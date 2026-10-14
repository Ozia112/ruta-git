# Flujos de trabajo colaborativos con Git
*Material complementario orientativo*

---

## 1. Panorama de flujos estándar

| Flujo | Idea central | Cuándo usarlo |
|---|---|---|
| **Centralized** | Todos trabajan sobre `main` directamente | Equipos de 1–3 personas; casi no se usa en la industria |
| **Feature Branch** | Una rama por funcionalidad, integrada vía Pull Request | Base de casi todos los demás flujos |
| **Git Flow** | Ramas de larga vida: `main`, `develop`, `feature/*`, `release/*`, `hotfix/*` | Software con releases versionadas: librerías, apps de escritorio o móviles, firmware |
| **GitHub Flow** | Rama desde `main` → PR → merge → despliegue inmediato | Aplicaciones web/SaaS con despliegue continuo |
| **GitLab Flow** | GitHub Flow + ramas de entorno (`staging`, `production`) o de release | Cuando se necesita controlar cuándo llega el código a producción |
| **Trunk-Based Development** | Integrar a `main` al menos una vez al día; ramas de horas | Organizaciones con CI/CD madura (Google, Meta) |
| **Forking** | Cada contribuidor trabaja en su fork y envía PR | Open source |
| **Stacked PRs** | Cambios grandes divididos en PRs pequeños dependientes | Equipos que buscan revisiones rápidas |

**Nota:** en 2020, el autor de Git Flow (Vincent Driessen) aclaró que su modelo no es ideal para aplicaciones web con entrega continua.

---

## 2. ¿Qué es más efectivo?

La investigación **DORA** y el libro *Accelerate* (Forsgren, Humble y Kim) encontraron que los equipos de alto desempeño:

- mantienen **pocas ramas activas** (unas tres o menos),
- usan **ramas de vida corta** (menos de un día),
- **no congelan** el código.

> **Conclusión:** el factor decisivo no es el nombre del flujo, sino **integrar pronto y en pequeño**, con PRs pequeños y CI automatizada.

### Prácticas complementarias
- **Protección de ramas:** sin push directo; PR con revisión y CI en verde obligatorios.
- **Estrategia de merge consistente:** squash, rebase o merge commit.
- **Conventional Commits:** `feat:`, `fix:`, `docs:`, etc.
- **Versionado semántico (SemVer):** `MAJOR.MINOR.PATCH`.
- **PRs pequeños:** menos de ~400 líneas.
- **CODEOWNERS:** asignación automática de revisores.

---

## 3. Caso de estudio: flujo con promoción por entornos

### Estructura

```
feature/*  ──►  develop  ──►  qa  ──►  main (tags vX.Y.Z)
(temporal)     (unitarias +   (funcional,   (solo releases
               integración)   estrés,       aprobadas)
                              seguridad)
```

### Nombre del modelo
- **GitLab Flow con ramas de entorno**, también llamado *environment branches* o *promotion-based branching*.
- Combina la base de **Git Flow** (`develop` + `main` con tags) con una etapa de QA por la que se **promueve** el código.

### Conceptos asociados

| Práctica | Término en la industria |
|---|---|
| Liberar a `main` con defectos estéticos menores ya conocidos | *Release with known issues* |
| Corregir avanzando por el pipeline en vez de revertir | **Fix-forward** / *roll-forward* |
| Corrección que recorre `develop` → `qa` → `main` | **Patch release** (ej. `v1.4.0` → `v1.4.1`) |
| Documentación en el mismo repo y con el mismo flujo | **Docs as Code** |

### Patch release vs. hotfix

| | Patch release | Hotfix |
|---|---|---|
| **Nace de** | `develop` | El **tag** en producción (`main`) |
| **Recorre** | Todo el pipeline | Solo `main`, con QA mínimo |
| **Cuándo** | Fallos no críticos | Solo fallos críticos: seguridad, pérdida de datos, caída de funcionalidad |
| **Después** | — | Se **retropropaga** a `qa` y `develop` |

### Reglas del modelo
1. **Nada nace en `qa` ni en `main`**, salvo un hotfix.
2. Todo trabajo nace de ramas temporales creadas desde `develop`.
3. El flujo va **en una sola dirección**: `develop` → `qa` → `main`.
4. Las promociones entre entornos usan **merge commit, nunca squash**, para evitar que las ramas diverjan.
5. Un hotfix consume el siguiente número PATCH; el patch release en curso se recorre al siguiente.

### Protocolo de hotfix
1. Crear la rama desde el tag: `hotfix/X.Y.Z` a partir de `vX.Y.(Z-1)`.
2. Tener un criterio de entrada escrito (qué califica como crítico).
3. Pasar una batería mínima obligatoria: smoke tests y la prueba del bug corregido.
4. Integrar a `main`, taguear y publicar el release.
5. **Retropropagar con merge** (no cherry-pick) hacia `qa` y `develop`.

### Hacer cumplir las reglas técnicamente
- Branch protection en `develop`, `qa` y `main`.
- Un check de CI que valide la rama de origen del PR:
  - hacia `qa` solo desde `develop` o `hotfix/*`;
  - hacia `main` solo desde `qa` o `hotfix/*`.
- Tags protegidos (`v*`).
- Filtros por ruta (`docs/**`) para que la documentación no espere pruebas que no le aplican.

### Riesgos y alternativas
- **Riesgo:** las ramas de entorno tienden a divergir si alguien hace commits directos en `qa` o `main`.
- **Alternativa moderna:** construir un **único artefacto** (imagen Docker, binario) y promover ese mismo build entre entornos.

---

## 4. Comandos por etapa (git, bash, gh)

### 0. Configuración inicial
```bash
git config --global user.name "Nombre"
git config --global user.email "correo@ejemplo.com"
git config --global pull.ff only
git config --global fetch.prune true
gh auth login
gh repo clone org/proyecto
git remote -v
```

### 1. Iniciar un trabajo
```bash
git switch develop
git pull
git switch -c feature/nombre
# o, ligado a un issue:
gh issue develop 42 --base develop --checkout
```

### 2. Durante el trabajo
```bash
git status
git diff / git diff --staged
git add -p
git commit -m "feat(modulo): descripción"
git log --oneline --graph --decorate -15
git stash push -m "wip" / git stash pop
git restore archivo / git restore --staged archivo
```

### 3. Sincronizar con develop
```bash
git fetch origin
git rebase origin/develop        # solo en ramas propias
git push -u origin feature/nombre
git push --force-with-lease      # después de un rebase
```

### 4. PR hacia develop
```bash
gh pr create --base develop --fill
gh pr checks --watch
gh pr checkout <n>               # para revisar el PR de otra persona
gh pr review <n> --approve
gh pr merge --squash --delete-branch
```

### 5. Promoción develop → qa
```bash
gh pr create --base qa --head develop --title "Promoción a QA"
gh pr merge --merge              # NUNCA squash
gh run list --branch qa
gh run watch
```

### 6. Promoción qa → main y release
```bash
gh pr create --base main --head qa --title "Release vX.Y.Z"
gh pr merge --merge
git switch main && git pull
git tag -a vX.Y.Z -m "Release vX.Y.Z"
git push origin vX.Y.Z
gh release create vX.Y.Z --generate-notes
```

### 7. Hotfix
```bash
git fetch --tags
git switch -c hotfix/X.Y.Z vX.Y.(Z-1)
git push -u origin hotfix/X.Y.Z
gh pr create --base main --title "Hotfix vX.Y.Z"
# merge, tag y release como en la etapa 6; después:
gh pr create --base qa      --head hotfix/X.Y.Z
gh pr create --base develop --head hotfix/X.Y.Z
```

### 8. Limpieza
```bash
git branch --merged develop
git branch -d feature/nombre
git fetch --prune
```

### 9. Rescate
```bash
git reflog                 # recuperar estados "perdidos"
git reset --soft HEAD~1    # solo en local y antes de hacer push
git revert <sha>           # la forma segura en ramas compartidas
git cherry-pick <sha>
git bisect start           # encontrar el commit que introdujo un bug
```

### Reglas de oro
- Nunca uses `rebase` ni `--force` sobre `develop`, `qa` o `main`.
- En ramas compartidas se usa `revert`, no `reset`.
- Los tags se suben explícitamente: `git push origin <tag>`.

---

## 5. Glosario rápido

- **PR / MR:** Pull Request / Merge Request; solicitud de integración con revisión.
- **CI/CD:** integración y entrega/despliegue continuos.
- **Feature flag:** interruptor para activar o desactivar código ya integrado.
- **Fix-forward:** corregir con un cambio nuevo en lugar de revertir.
- **Retropropagación (backport):** llevar un cambio de una rama de producción a ramas anteriores del flujo.
- **Tag anotado:** etiqueta con autor, fecha y mensaje (`git tag -a`).
- **SemVer:** versionado `MAJOR.MINOR.PATCH`.
