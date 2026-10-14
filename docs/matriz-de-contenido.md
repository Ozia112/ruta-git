# Matriz de contenido del curso de Git

Comparación de las tres etapas del curso. GitFlow repasa a propósito lo que GitBasic hizo con botones, ahora en la terminal. La matriz separa ese repaso intencional de lo que solo se repite, señala qué pasa a actividades autodidactas, estima cuánto tiempo de actividad se ahorra y propone cómo repartir GitFlow en sesiones de 4 horas.

| Etapa | Carpeta | Fuente revisada | Estado |
|---|---|---|---|
| **1. GitBasic** | [`1-gitbasic/`](../1-gitbasic/) | [`guion/guion-instructor.md`](../1-gitbasic/guion/guion-instructor.md) y [`material/guia-alumno.md`](../1-gitbasic/material/guia-alumno.md) | Guion de 250 min, sin calibrar con un grupo real |
| **2. GitFlow** | [`2-gitflow/`](../2-gitflow/) | [`guion/guion-instructor.md`](../2-gitflow/guion/guion-instructor.md) | 740 min; Bloques 1 a 4 calibrados con el grupo de octubre de 2026 |
| **3. AgenticFlow** | [`3-agenticflow/`](../3-agenticflow/) | - | Tema nuevo, por desarrollar |

> GitBasic viene del `main` de [David-Alcocer/GitBasic](https://github.com/David-Alcocer/GitBasic), importado con su historial. Su guía del alumno ya sigue los 10 bloques del guion. El guion del instructor viene de la rama `propuesta-isaac` de ese repo, que `main` no tenía.

---

## 1. Las etapas de un vistazo

| | GitBasic | GitFlow | AgenticFlow |
|---|---|---|---|
| **Pregunta central** | ¿Qué es Git y cómo guardo y comparto mi trabajo? | ¿Cómo trabajamos ordenados varias personas en un mismo repo? | Por definir |
| **Herramienta principal** | GitHub Desktop (botones) | Terminal (`git` y `gh`) | Por definir |
| **Dónde se mira** | History de Desktop, GitLens, extensión Git Graph | Graph nativa de VS Code, GitLens | - |
| **Modelo de equipo** | Fork del repo del instructor + colaboradores en el fork + PR al instructor | Repo compartido del líder + colaboradores + PR interno | - |
| **Archivo hilo conductor** | `mi-perfil.md` y `answers-box/equipo-[nombre].md` | `README.md` del equipo e `integrantes/[nombre].md` | - |
| **Duración en el guion** | 250 min | 740 min | - |
| **Duración con esta propuesta** | ~244 min (1 sesión en el papel, sin medir) | ~645 min (3 sesiones, sección 4.3) | - |

---

## 2. Contenido por etapa

### Etapa 1: GitBasic (guion de 1 sesión, minutos planeados)

| Escena | Temas | Min |
|---|---|---|
| 1. ¿Qué pasa sin Git? | Control de versiones; Git vs. GitHub; por qué Desktop. **Markdown #1**: encabezados, listas, citas | 15 |
| 2. Tour de GitHub Desktop | Current Repository, Current Branch, Changes, History, Push origin. **Markdown #2**: tablas, negritas, código en línea | 15 |
| 3. Repo, commit y rama | Vocabulario mínimo; anatomía de un commit (autor, mensaje, hash). **Markdown #3**: listas de tareas | 10 |
| 4. Nace tu repo local | New Repository; la carpeta `.git` oculta; primer commit; 3 o 4 commits | 25 |
| 5. Ramas y merge local | Analogía carretera/desvío; New Branch; diálogo Leave/Bring/Stash; cambiar de rama; merge commit. **Markdown #4**: links, listas numeradas | 35 |
| Descanso | | 10 |
| 6. Push, Fetch y Pull | Publish repository; origin como apodo; analogía del **buzón**. **Markdown #5**: separadores, cursiva | 20 |
| 7. Viajar en el historial | History de Desktop; GitLens (blame); extensión Git Graph | 10 |
| 8. Si algo sale mal | Discard, Undo commit, Abort merge, Revert | 10 |
| 9. Fork + colaboradores + PR | Fork; colaboradores; clonar; primer pull real; PR al repo del instructor (code owner); comentar el PR de otro equipo | 30 |
| 10. Proyecto final | Ramas `perfil-*`; PRs internos en el fork; **conflicto resuelto en GitHub.com**; PR final al instructor | 50 |
| Cierre | `answers-box/` del instructor; recorrido de la Graph; autoestudio (Reto 5: terminal y `gh`); recursos | 20 |

### Etapa 2: GitFlow (guion calibrado, minutos reales o extrapolados)

| Bloque | Temas | Min |
|---|---|---|
| 1. El botón era un comando | Tabla de traducción Desktop → terminal; `git init` y `.git`; `status`, `add`, `commit`, `log`, `diff`; `switch -c`; Graph nativa | 60 |
| 2. Local y origin | README base + plantillas; repo vacío + `remote add` + `push -u`; colaboradores; `gh repo clone`; `remote -v`, `branch -a`; `main` vs. `origin/main` (analogía de la **foto**); `fetch` vs. `pull` | 110 |
| 3. Tu primer issue | Issue como comanda; plantilla de issue; asignar; `gh issue list`; la configuración es un archivo | 45 |
| 4. El ritual diario + primer PR | Antes/durante/después; rama `feature/N-...`; commits convencionales; `push -u`; `gh pr create` con plantilla y `Closes #`; revisión con Approve; merge commit; limpieza (`branch -d`, `fetch --prune`); GitLens (line blame, hover, CodeLens) | 115 |
| 5. Las reglas de la casa | Solo squash; borrar ramas automáticamente; ruleset (historia lineal, PR con 1 aprobación); `reset --hard origin/main`; robot con Actions; checks obligatorios y rama al día | 85 |
| 6. Historia limpia | Fast-forward; `amend`; no usar Update branch; analogía del post-it; `pull --rebase`; `--force-with-lease`; squash and merge; `branch -D`; reglas de oro; `pull.rebase true` | 120 |
| 7. Conflictos en equipo | Conflicto garantizado (filas de la tabla); CONFLICT durante el rebase; editor de merge; etiquetas invertidas; `rebase --continue` / `--abort`; robot en rojo; File Blame | 115 |
| 8. Ciclo completo sin red → **Autoestudio 3** | Acordeón; issue asignado a otro; ciclo completo sin guía; limpieza final. **Sale de la clase** (sección 4.2) | (55) |
| Cierre | Recorrido de la Graph; no hay una sola forma correcta (tabla de factores); tarea; recursos | 35 |

### Etapa 3: AgenticFlow

Por desarrollar (ver la sección 6).

---

## 3. Matriz de temas

● = se enseña · ○ = se menciona o se usa sin enseñarlo
⇄ = **repaso en terminal** (intencional: lo que se hizo con botones en GitBasic se vuelve a hacer con comandos en GitFlow)
⟳ = **repetido con la misma herramienta** (candidato a ahorrar tiempo)
Autoestudio 2 = se practica fuera de clase (sección 4.1)

| Tema | GitBasic | GitFlow | AgenticFlow | |
|---|---|---|---|---|
| Control de versiones; Git vs. GitHub | ● E1 | | | |
| Markdown | ● E1–E6 (5 actividades) | ○ se usa | | |
| Interfaz de GitHub Desktop | ● E2 | ○ B1 (tabla de traducción) | | |
| Vocabulario: repo, commit, rama | ● E3 | ○ se asume | | |
| Crear repo local y la carpeta `.git` | ● E4 | ● B1 paso 2 | | ⇄ |
| Ciclo de commit | ● E4 (botones) | ● B1 paso 3 (terminal) | | ⇄ |
| Ramas y merge local | ● E5 | ● B1 paso 5 (ramas; el merge va al Autoestudio 2) | | ⇄ + Autoestudio 2 |
| Publicar un repo local | ● E6 (Publish) | ● B2 paso 2 (`remote add` + `push -u`) | | ⇄ |
| origin, fetch y pull | ● E6 (buzón) | ● B2 pasos 5–6 (foto) | | ⇄ |
| Mirar el historial | ● E7 (History, Git Graph) | ● `git log`, Graph nativa | | ⇄ |
| GitLens | ● E7 (blame) | ● B4 paso 7, B6, B7 | | ⟳ |
| Deshacer | ● E8 (Discard, Undo, Abort, Revert) | ● `amend`, `rebase --abort`, `reset --hard` (nuevos); Discard, Undo, Abort y Revert van al Autoestudio 2 | | ⇄ + Autoestudio 2 |
| Colaboradores | ● E9 (web) | ● B2 paso 3 (web) | | ⟳ |
| Clonar | ● E9 (Desktop) | ● B2 paso 4 (`gh repo clone`) | | ⇄ |
| Fork | ● E9 | ○ Autoestudio 2, si el fork se queda | | ⇄ en Autoestudio 2 |
| Pull Request | ● E9–E10 (Desktop/web) | ● B4 (`gh pr create`, plantilla, `Closes #`) | | ⇄ |
| Revisión de PR | ○ comentario en el PR de otro equipo | ● B4 paso 5 (comentario en línea + Approve, en la web) | | ⟳ |
| Protección de ramas | ○ la del instructor (code owner), solo se observa | ● B5 (la configuran ellos) | | complementario |
| Conflictos | ● E10 (en GitHub.com, durante un merge) | ● B7 (terminal + VS Code, durante un rebase) | | ⇄ |
| Issues | | ● B3 | | |
| Convenciones de commits y ramas | | ● B4 | | |
| Historia limpia: amend, rebase, squash | | ● B6 | | |
| Automatización (GitHub Actions) | | ● B5 | | |
| Estrategias de trabajo colaborativo | ○ lectura sin uso en su guion | ● Cierre + tarea + lectura de apoyo | | resuelto |
| Terminal y GitHub CLI | ○ autoestudio, Reto 5 | ● toda la etapa | | |
| IA en el trabajo | ○ pregunta del reto final | ○ se excluye GitLens *Explain* | ● | |

---

## 4. Repaso de GitBasic en GitFlow: qué se conserva y dónde se ahorra

Principio: **el repaso es intencional.** GitFlow existe para asimilar en la terminal lo que en GitBasic se hizo con botones, así que la **práctica** de cada acción se repite completa. Lo que se ahorra es:

- **volver a explicar el concepto:** se recuerda con la tabla de traducción y una frase, sin la analogía completa;
- **lo que se repite con la misma herramienta** (⟳), que no aporta traducción;
- **trabajo que no es de Git**, como volver a escribir contenido en Markdown.

Los minutos son sobre el guion calibrado de GitFlow.

| Tema | Qué se conserva en GitFlow | Qué se ahorra | Ahorro |
|---|---|---|---|
| Crear repo y `.git` | `git init` y ver la carpeta `.git` | Nada: es corto y ancla la traducción con New Repository | 0 |
| Ciclo de commit | Todo: es el primer contacto con la terminal | - | 0 |
| Ramas y merge local | El paso 5 del Bloque 1 completo | - (ver huecos en la sección 4.1) | 0 |
| origin, fetch y pull | La práctica completa de la foto vieja (`status` → `fetch` → `status` → `pull`) | **Una sola analogía en las dos etapas.** Fue de lo que más tiempo costó: si GitBasic ya siembra la misma imagen, en GitFlow solo se recuerda | ~10 min |
| Colaboradores | Que el líder invite a sus compañeros | Mismos equipos y líderes que en GitBasic; invitar apenas se cree el repo para que el resto no espere | ~5 min |
| GitLens | En GitFlow, donde tiene sentido porque hay varios autores | En GitBasic dejar solo History de Desktop (E7 de 10 a ~4 min) | GitBasic ~6 min |
| Pull Request | `gh pr create` completo | No volver a explicar qué es un PR | 0 |
| Revisión de PR | Comentario en línea + Approve | Es web en las dos etapas: una sola revisión por PR | ~5 min |
| Actividad de perfil | Los comandos del ritual | Copiar el contenido de su `mi-perfil.md` de GitBasic en vez de escribirlo desde cero | ~15 min |
| Conflictos | Todo el Bloque 7: rebase, etiquetas invertidas, robot | Las marcas `<<<<<<<` se recuerdan, no se vuelven a explicar | ~5 min |
| Estrategias de trabajo colaborativo | Cierre + tarea | **Hecho:** la lectura se movió a [`2-gitflow/material/lecturas/`](../2-gitflow/material/lecturas/flujos-git-colaborativos.md) como apoyo para la tarea | 0 (mejora la tarea) |

**Ahorro estimado en GitFlow:** ~40 min, sin tocar ningún paso de práctica en terminal.

### 4.1 Huecos del repaso → Autoestudio 2

Con el criterio de "todo lo que se hizo con botones se vuelve a hacer en terminal", estas acciones de GitBasic no se practican en GitFlow: o no aparecen, o solo se mencionan. En lugar de agregarlas a la clase, pasan a una **segunda actividad autodidacta**, cuyo tema principal es *"practica los otros comandos de terminal que faltan"*.

| Botón en GitBasic | Escena | Comando | Situación en GitFlow | En el Autoestudio 2 |
|---|---|---|---|---|
| Merge into Current Branch | E5 | `git merge rama` | Solo se menciona (tabla de traducción) | Sí |
| Discard changes | E8 | `git restore archivo` | No aparece | Sí |
| Undo commit | E8 | `git reset --soft HEAD~1` | No aparece (`amend` en el B6 cubre un caso parecido) | Sí |
| Abort merge | E8 | `git merge --abort` | No aparece (solo `git rebase --abort`, B7) | Sí, junto con `merge` para provocar el conflicto |
| Revert commit | E8 | `git revert hash` | Solo se menciona (tabla del B6 y acordeón) | Sí |
| Fork | E9 | `gh repo fork` | No aparece | Solo si el fork se queda en GitBasic |
| Leave / Bring / Stash changes | E5 | `git stash` | Fuera de alcance en clase a propósito | Opcional, como reto extra |

**Características del Autoestudio 2:**

- **Dónde se practica:** en `practica-terminal`, el repo solo local que cada alumno crea en el Bloque 1 de GitFlow. Ahí equivocarse no cuesta nada y nadie más se ve afectado.
- **Cuándo se deja:** desde el final del Bloque 1, porque ya existe `practica-terminal`. Así se practica la terminal entre clases, antes de los bloques de rebase.
- **Relación con el Autoestudio 1:** el [primero](../1-gitbasic/material/autoestudio-1.md) practica con botones, en un repo desechable `sandbox-[tu-nombre]`, lo mismo que aquí falta: su Reto 3 (*Rómpelo y arréglalo*) cubre Discard, Undo, Revert y un conflicto, y su Reto 5 asoma a la terminal. El Autoestudio 2 puede repetir esas misiones, ahora con comandos, y seguir el mismo formato de bitácora.

**Balance:** GitFlow conserva los ~40 min de ahorro sin agregar tiempo de clase.

### 4.2 Bloque 8 → Autoestudio 3 (en equipo)

El Bloque 8 repite el ciclo completo sin guía. Todo lo que practica ya se vio en los Bloques 3 a 7, así que sale de la clase y pasa a una actividad autodidacta.

- **Es en equipo, no individual:** cada quien crea un issue para otro integrante, resuelve el que le asignaron, revisa el PR de un compañero e integra con squash. Por eso no cabe en el Autoestudio 2, que es individual y en un repo solo local. Se hace en el repo del equipo, en el tiempo que acuerden entre ellos.
- **Qué incluye:** el ciclo completo con el acordeón (tema: `recomendaciones/[tu-nombre].md`), la limpieza final y la prueba de `git log --oneline`: cada línea desde el Bloque 5 es un PR con título convencional y `(#número)`.
- **Qué se queda en clase:** el **acordeón** se sigue entregando (la guía del alumno ya lo tiene al final; en el guion vive dentro del Bloque 8 y habría que moverlo al cierre). La revisión de la Graph ya está en el recorrido del cierre.
- **Se cruza con la tarea:** "Nuestras reglas del juego" también obliga a repetir el ciclo completo en equipo (el documento se escribe con issues, ramas y PRs). Conviene decidir si el Autoestudio 3 queda como actividad aparte o como el primer paso de la tarea.

**Total de GitFlow en clase:** 740 − 40 (ahorros) − 55 (Bloque 8) = **~645 min**.

### 4.3 Distribución en sesiones de 4 horas (grupos nuevos)

Minutos por bloque con los ahorros aplicados: B1 60 · B2 95 · B3 45 · B4 95 · B5 85 · B6 120 · B7 110 · Cierre 35.

Desde la segunda sesión se suman 10 min de reentrada. El total queda en 665 min, y 3 sesiones con dos descansos de 10 min solo dan 640. **Para que quepa en 3 sesiones, cada sesión lleva un solo descanso de 15 min** (225 min de trabajo cada una). Los cortes caen en puntos seguros: nadie queda con un rebase a medias.

| Sesión | Contenido | Trabajo | Termina con |
|---|---|---|---|
| 1 | B1 + B2 + B3 + B4 pasos 1–2 | 60 + 95 + 45 + 23 = **223** | La rama del perfil creada, todavía sin cambios |
| 2 | Reentrada + B4 pasos 3–7 + B5 + B6 pasos 1–4 | 10 + 72 + 85 + 55 = **222** | Los PRs del ritual abiertos y desactualizados, tras la analogía del post-it |
| 3 | Reentrada + B6 pasos 5–7 + B7 + Cierre | 10 + 65 + 110 + 35 = **220** | Fin de la etapa |

**Riesgo:** quedan ~10 min de holgura en total y el Bloque 5 en adelante es extrapolado. La sesión 3 es la más expuesta (rebase y conflictos). Recortes de reserva: la demostración en rojo del Bloque 5 (~8 min, sesión 2) y la parte de GitLens del Bloque 7 (~5 min, sesión 3).

Los autoestudios se dejan así: el 2 al final de la sesión 1 (ya existe `practica-terminal`) y el 3 al final de la sesión 3, junto con la tarea.

---

## 5. Inconsistencias entre etapas

| Punto | GitBasic | GitFlow | Propuesta |
|---|---|---|---|
| Analogía de origin | Buzón: *fetch* es mirar el buzón | Foto: `origin/main` es la foto de GitHub | Elegir una para las dos etapas |
| Vista del historial | Extensión **Git Graph** | **Graph nativa** de VS Code | Usar la Graph nativa desde GitBasic; una extensión menos que instalar |
| Modelo de equipo | Fork + colaboradores en el fork | Repo compartido + colaboradores | Decidir si el fork se queda en GitBasic: aporta el `answers-box/` colectivo, pero mezcla dos modelos en la misma escena |
| Vocabulario | El guion llamaba "Bloque 1" a toda la etapa | Llamaba "Sesión 2" a la etapa | **Hecho:** **Etapa** > **Sesión** (una clase) > **Bloque** en los README y encabezados |
| Tiempos | 250 min sin medir | 3.3 veces lo planeado en los Bloques 1 a 4 | Medir GitBasic en su próxima impartición. Si se comporta parecido, tampoco cabe en 4 horas |

---

## 6. AgenticFlow (por desarrollar)

Todavía no hay contenido. Lo que las etapas anteriores ya dejan preparado:

| Viene de | Qué deja |
|---|---|
| GitBasic, reto final | La pregunta *"¿Cómo puedes usar la IA en tu carrera sin perder el protagonismo?"* |
| GitFlow, GitLens | Se excluyó a propósito el botón *Explain* (IA) para no depender de una cuenta |
| GitFlow, Bloque 3 | Los issues como unidad de trabajo con criterio de terminado: una tarea que también se le puede asignar a un agente |
| GitFlow, Bloques 4 a 6 | PR con plantilla, revisión obligatoria, robot y historia lineal: las reglas con las que se puede revisar trabajo hecho por un agente |
| GitFlow, cierre | *"Las reglas están para servirle al equipo"*: punto de partida para discutir qué reglas cambian cuando un integrante es un agente |
| GitFlow, notas finales | Temas fuera de alcance: `rebase -i`, `stash`, `cherry-pick`, `reflog`, tags y releases, ramas de larga vida |

**Decisiones pendientes antes de diseñarla:** objetivo de la etapa, herramienta principal, duración y si se apoya en el repo de equipo que ya existe al terminar GitFlow.
