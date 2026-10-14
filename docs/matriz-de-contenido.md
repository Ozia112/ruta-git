# Matriz de contenido del curso de Git

Comparación de las tres etapas del curso. GitFlow repasa a propósito lo que GitBasic hizo con botones, ahora en la terminal. La matriz separa ese repaso intencional de lo que solo se repite, señala qué pasa a actividades autodidactas, estima cuánto tiempo de actividad se ahorra y propone cómo repartir GitFlow en sesiones de 4 horas.

| Etapa | Carpeta | Fuente revisada | Estado |
|---|---|---|---|
| **1. GitBasic** | [`1-gitbasic/`](../1-gitbasic/) | [`guion/guion-instructor.md`](../1-gitbasic/guion/guion-instructor.md) y [`material/guia-alumno.md`](../1-gitbasic/material/guia-alumno.md) | Guion de 250 min, sin calibrar con un grupo real |
| **2. GitFlow** | [`2-gitflow/`](../2-gitflow/) | [`guion/guion-instructor.md`](../2-gitflow/guion/guion-instructor.md) | 685 min de clase (sin el Bloque 8, que pasó al Autoestudio 3) + Autoestudios 2 y 3 + tarea; Bloques 1 a 4 calibrados con el grupo de octubre de 2026 |
| **3. AgenticFlow** | [`3-agenticflow/`](../3-agenticflow/) | [`guion/guion-instructor.md`](../3-agenticflow/guion/guion-instructor.md) y [`material/guia-alumno.md`](../3-agenticflow/material/guia-alumno.md) | 225 min de clase + 2 autoestudios + proyecto final desplegado; tiempos estimados con el ritmo de GitFlow, sin calibrar |
| **Siguiente: mentoría** | - | - | Los equipos presentan su proyecto desplegado a ingenieros egresados y con experiencia en el sector. Por diseñar |

> GitBasic viene del `main` de [David-Alcocer/GitBasic](https://github.com/David-Alcocer/GitBasic), importado con su historial. Su guía del alumno ya sigue los 10 bloques del guion. El guion del instructor viene de la rama `propuesta-isaac` de ese repo, que `main` no tenía.

---

## 1. Las etapas de un vistazo

| | GitBasic | GitFlow | AgenticFlow |
|---|---|---|---|
| **Pregunta central** | ¿Qué es Git y cómo guardo y comparto mi trabajo? | ¿Cómo trabajamos ordenados varias personas en un mismo repo? | ¿Cómo construimos software de calidad cuando quien escribe el código es un agente? Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar |
| **Herramienta principal** | GitHub Desktop (botones) | Terminal (`git` y `gh`) | Cualquier agente de código + `AGENTS.md` (el material no depende de uno), ordenado por el ritual de GitFlow |
| **Dónde se mira** | History de Desktop, GitLens, extensión Git Graph | Graph nativa de VS Code, GitLens | `git status` / `git diff`, las comprobaciones de `pruebas/`, las revisiones registradas en el PR y la dirección publicada |
| **Modelo de equipo** | Fork del repo del instructor + colaboradores en el fork + PR al instructor | Repo compartido del líder + colaboradores + PR interno | El mismo repo de GitFlow, con cuatro papeles (piloto, revisor, probador y líder) y una regla: quien construye no prueba ni aprueba su propio trabajo |
| **Archivo hilo conductor** | `mi-perfil.md` y `answers-box/equipo-[nombre].md` | `README.md` del equipo e `integrantes/[nombre].md` | `AGENTS.md`, `docs/especificaciones/ESP-01-...md`, `docs/guias/revision.md` y la página publicada con los perfiles de `integrantes/` |
| **Pregunta que se repite** | - | ¿Dónde está esto: en tu compu, en origin o en los dos? | ¿Cómo lo sé? |
| **Analogía** | Buzón (origin) | Foto (origin), post-it (rebase), comanda (issue) | La cocina sigue: cocinero sin memoria (agente), recetario (`AGENTS.md`), receta (especificación), el chef que prueba antes de servir (probador), la mesa pública (`main` desplegado) |
| **Duración en el guion** | 250 min | 685 min (740 antes de sacar el Bloque 8) | 225 min de clase + 15 de descanso |
| **Duración con esta propuesta** | ~244 min (1 sesión en el papel, sin medir) | ~645 min (3 sesiones, sección 4.3) | 1 sesión + Autoestudio 4 (~3 h 30 min), Autoestudio 5 (~4 h) y proyecto final (~12 h) |

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
| 8. Ciclo completo sin red → **[Autoestudio 3](../2-gitflow/material/autoestudio-3.md)** | Acordeón; issue asignado a otro; ciclo completo sin guía; limpieza final. **Hecho:** salió de la clase (sección 4.2) | (55) |
| Cierre | Recorrido de la Graph; no hay una sola forma correcta (tabla de factores); acordeón, autoestudios y tarea; recursos | 35 |

### Etapa 3: AgenticFlow (guion de 1 sesión, minutos estimados)

| Bloque | Temas | Min |
|---|---|---|
| Apertura | Check-in del agente en cada equipo; el ciclo completo como mapa del día; cuatro papeles y su regla; permisos; la pregunta "¿cómo lo sé?" | 10 |
| 1. Un cocinero sin memoria | La pregunta pendiente de GitBasic; rama de experimento; el agente sin contexto; qué decidió, inventó y afirmó; los riesgos con nombre (R1–R15); permisos; evidencia de Proyectos A y B | 40 |
| 2. El recetario de la casa · Documentar | `AGENTS.md`: mapa, verdad hoy y una sola fuente; *Lo que nunca se hace* como riesgos mitigados a tiempo; entrevista al agente; rama de documentación sin integrar | 40 |
| 3. La receta, y la primera revisión · Documentar y Revisión 1 | Comanda contra receta; plan contra especificación; criterios comprobables; la comprobación existe antes, en rojo; guía de revisión y plantilla de PR; **Revisión 1** con lista; issue corto | 40 |
| Descanso | | 15 |
| 4. El agente implementa, y la segunda revisión · Implementar y Revisión 2 | Plan antes del código; "si lo explicas en el chat, faltaba en el repo"; primer vistazo del piloto; PR del tamaño de una especificación; **Revisión 2** con lista; tirar la rama si da vueltas | 45 |
| 5. Probar, la tercera revisión y desplegar | El probador con `gh pr checkout` y tabla de evidencia; **Revisión 3** con lista; squash; GitHub Pages; prueba de humo; "cada merge a `main` es un despliegue"; Revert | 40 |
| Cierre | Antes y después; la conclusión (el ciclo); GitFlow ordena la velocidad del agente; riesgos en su momento; respuesta a GitBasic; lo que sigue hasta la mentoría | 10 |
| **Autoestudio 4** | ADR y aviso "no lo arregles" con provocación antes y después; auditoría de afirmaciones; registro de riesgos del equipo | (~210) |
| **Autoestudio 5** | El ciclo completo sin guía: guía de estilo, despliegue documentado, robot obligatorio, comprobación escrita antes del código, simulacro de reversa, política de documentos | (~240) |
| **Proyecto final** | El proyecto de cada equipo, construido con el ciclo y desplegado; registro de riesgos propio; ensayo de reversa; paquete de mentoría y video | (~720) |

---

## 3. Matriz de temas

● = se enseña · ○ = se menciona o se usa sin enseñarlo
⇄ = **repaso en terminal** (intencional: lo que se hizo con botones en GitBasic se vuelve a hacer con comandos en GitFlow)
⟳ = **repetido con la misma herramienta** (candidato a ahorrar tiempo)
Autoestudio 2 = se practica fuera de clase (sección 4.1)
A4 / A5 = Autoestudio 4 / Autoestudio 5 de AgenticFlow

| Tema | GitBasic | GitFlow | AgenticFlow | |
|---|---|---|---|---|
| Control de versiones; Git vs. GitHub | ● E1 | | | |
| Markdown | ● E1–E6 (5 actividades) | ○ se usa | ○ se usa: todos los documentos para el agente | |
| Interfaz de GitHub Desktop | ● E2 | ○ B1 (tabla de traducción) | | |
| Vocabulario: repo, commit, rama | ● E3 | ○ se asume | | |
| Crear repo local y la carpeta `.git` | ● E4 | ● B1 paso 2 | | ⇄ |
| Ciclo de commit | ● E4 (botones) | ● B1 paso 3 (terminal) | | ⇄ |
| Ramas y merge local | ● E5 | ● B1 paso 5 (ramas; el merge va al Autoestudio 2) | | ⇄ + Autoestudio 2 |
| Publicar un repo local | ● E6 (Publish) | ● B2 paso 2 (`remote add` + `push -u`) | | ⇄ |
| origin, fetch y pull | ● E6 (buzón) | ● B2 pasos 5–6 (foto) | | ⇄ |
| Mirar el historial | ● E7 (History, Git Graph) | ● `git log`, Graph nativa | | ⇄ |
| GitLens | ● E7 (blame) | ● B4 paso 7, B6, B7 | | ⟳ |
| Deshacer | ● E8 (Discard, Undo, Abort, Revert) | ● `amend`, `rebase --abort`, `reset --hard` (nuevos); Discard, Undo, Abort y Revert van al Autoestudio 2 | ● B4: tirar la rama del agente y `git restore`; B5 y A5: **Revert** de un PR desplegado | ⇄ + Autoestudio 2 |
| Colaboradores | ● E9 (web) | ● B2 paso 3 (web) | | ⟳ |
| Clonar | ● E9 (Desktop) | ● B2 paso 4 (`gh repo clone`) | | ⇄ |
| Fork | ● E9 | ○ Autoestudio 2, si el fork se queda | | ⇄ en Autoestudio 2 |
| Pull Request | ● E9–E10 (Desktop/web) | ● B4 (`gh pr create`, plantilla, `Closes #`) | ● el único lugar por donde entra el trabajo del agente; plantilla con "Cómo lo comprobé" y el registro de las tres revisiones (B3) | ⇄ |
| Revisión de PR | ○ comentario en el PR de otro equipo | ● B4 paso 5 (comentario en línea + Approve, en la web) | ● **revisión organizada**: tres revisiones con lista, por quien no construyó (B3, B4, B5) | complementario |
| Protección de ramas | ○ la del instructor (code owner), solo se observa | ● B5 (la configuran ellos) | ○ las reglas de GitFlow también frenan al agente; A5 suma un check obligatorio | complementario |
| Conflictos | ● E10 (en GitHub.com, durante un merge) | ● B7 (terminal + VS Code, durante un rebase) | | ⇄ |
| Issues | | ● B3 | ○ B3: issue corto que apunta a una especificación | |
| Convenciones de commits y ramas | | ● B4 | ○ se escriben en `AGENTS.md`; el commit cita la especificación | |
| Historia limpia: amend, rebase, squash | | ● B6 | | |
| Automatización (GitHub Actions) | | ● B5 | ● A5: el robot de GitFlow corre las comprobaciones en cada PR, como check obligatorio | complementario |
| Estrategias de trabajo colaborativo | ○ lectura sin uso en su guion | ● Cierre + tarea + lectura de apoyo | ○ "Nuestras reglas del juego" es la fuente de `AGENTS.md` (B2) y la idea de proyecto del proyecto final | resuelto |
| Terminal y GitHub CLI | ○ autoestudio, Reto 5 | ● toda la etapa | ○ se usa para comprobar (Git Bash en Windows) | |
| IA en el trabajo | ○ pregunta del reto final | ○ se excluye GitLens *Explain* | ● toda la etapa; responde la pregunta de GitBasic en el cierre | resuelto |
| El ciclo: documentar, tres revisiones, probar, desplegar | | | ● toda la etapa; conclusión del cierre; A5 y proyecto final sin guía | |
| Riesgos de trabajar con IA y su momento | | | ● B1 (se ven), B2–B5 (se mitigan), cierre; A4 (registro de riesgos) | |
| Permisos de un agente | | | ● B1 | |
| Instrucciones para agentes (`AGENTS.md`) | | ○ B3: "la configuración es un archivo" | ● B2; crece en A4 y A5 | |
| Especificación con criterios comprobables | | ○ B3: plantilla de issue con "¿cuándo está terminado?" | ● B3 | |
| Comprobaciones antes de construir | | ○ B5: el robot revisor | ● B3; A5 (escrita por el agente antes del código; enlaces) | |
| Pruebas con evidencia, por quien no construyó | | | ● B5 (probador) | |
| Despliegue: prueba de humo y reversa | | | ● B5 (GitHub Pages); A5 (documento de despliegue y simulacro de reversa) | |
| Registros de decisión (ADR) | | | ● A4 | |
| Avisos "no lo arregles" | | | ● A4 | |
| Guías por tema y una sola fuente | | | ● B3 (guía de revisión); A5 | |
| Política de documentos | | | ● A5 | |
| Preparación para la mentoría | | | ● proyecto final (`docs/mentoria.md` y video) | |

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

**Hecho:** [`2-gitflow/material/autoestudio-2.md`](../2-gitflow/material/autoestudio-2.md). Incluye `stash` y `gh repo fork` como retos opcionales; los líderes, cuyo `practica-terminal` se publicó en el Bloque 2, lo hacen en una carpeta nueva.

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

**Hecho:** [`2-gitflow/material/autoestudio-3.md`](../2-gitflow/material/autoestudio-3.md). El Bloque 8 salió de la guía, del guion y de la guía de diapositivas.

El Bloque 8 repite el ciclo completo sin guía. Todo lo que practica ya se vio en los Bloques 3 a 7, así que sale de la clase y pasa a una actividad autodidacta.

- **Es en equipo, no individual:** cada quien crea un issue para otro integrante, resuelve el que le asignaron, revisa el PR de un compañero e integra con squash. Por eso no cabe en el Autoestudio 2, que es individual y en un repo solo local. Se hace en el repo del equipo, en el tiempo que acuerden entre ellos.
- **Qué incluye:** el ciclo completo con el acordeón (tema: `recomendaciones/[tu-nombre].md`), la limpieza final y la prueba de `git log --oneline`: cada línea desde el Bloque 5 es un PR con título convencional y `(#número)`.
- **Qué se queda en clase:** el **acordeón** se sigue entregando (la guía del alumno lo tiene al final; en el guion pasó a un anexo y se proyecta en el cierre). La revisión de la Graph ya está en el recorrido del cierre.
- **Se cruza con la tarea:** "Nuestras reglas del juego" también obliga a repetir el ciclo completo en equipo (el documento se escribe con issues, ramas y PRs). **Decidido:** es una actividad aparte y se hace antes de la tarea.

**Total de GitFlow en clase:** 740 − 40 (ahorros) − 55 (Bloque 8) = **~645 min**.

### 4.3 Distribución en sesiones de 4 horas (grupos nuevos)

**Pendiente:** los ahorros de la sección 4 y este reparto todavía no se aplican al guion ni a la guía del alumno de GitFlow.

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

## 6. AgenticFlow: cómo se conecta con las etapas anteriores

**Tema:** construir software de calidad con un agente, recorriendo un ciclo en el que cada paso deja algo escrito y tiene quién lo revise: documentar → revisión organizada → implementar → revisión organizada → probar → revisión organizada → desplegar. Los documentos que guían al agente (instrucciones, especificaciones, decisiones, guías, riesgos y despliegue) son el centro; el ritual de GitFlow es lo que ordena un trabajo tan masivo y rápido como el de un agente, y se usa sin volver a enseñarse. Los flujos de trabajo de los proyectos de referencia no son el tema. La etapa termina con cada proyecto desplegado, listo para la mentoría.

### 6.1 Decisiones tomadas

| Decisión | Qué se eligió | Por qué |
|---|---|---|
| Herramienta | Ninguna en particular: el material habla de "el agente" y de `AGENTS.md`, y las plantillas explican qué archivo lee cada agente | El curso no depende de una cuenta ni de un precio, igual que GitFlow excluyó GitLens *Explain* |
| Duración | 1 sesión de 4 h + Autoestudio 4, Autoestudio 5 y proyecto final | En clase, el ciclo completo una vez con el grupo junto. Lo que se aprende provocando al agente y el ciclo sin guía se hacen por cuenta propia |
| Qué se construye | En la sesión, la página del equipo en el repo de GitFlow. En el proyecto final, el proyecto de cada equipo (la idea de la tarea de GitFlow), desplegado | Continuidad: mismos datos, mismo repo, mismas reglas de `main`. Los alumnos no escriben código: lo especifican, lo revisan, lo prueban y lo despliegan |
| Revisión organizada | Tres revisiones (documentos, implementación y pruebas) con una lista cada una en `docs/guias/revision.md`, cuatro papeles y el registro en el PR | Es la conclusión de la etapa y lo que GitFlow hace posible a la velocidad de un agente |
| Riesgos | Quince riesgos con su señal, su mitigación y su momento, en el acordeón de la guía y en `docs/riesgos.md` | Que los alumnos sepan mitigarlos al mínimo y en el momento correcto |
| Despliegue | GitHub Pages desde `main` en la sesión; en el proyecto final, lo que decidan en un ADR | Lo más simple que permite aprender la prueba de humo y la reversa |
| Requisitos previos | [`material/requisitos.md`](../3-agenticflow/material/requisitos.md): VS Code (otro editor, bajo riesgo del alumno), Git y GitHub CLI, el repo de GitFlow completo con comandos para comprobarlo, agentes por nivel de precio y programas para estudiantes, con fuentes y fecha de verificación | Algunos alumnos no completaron GitFlow, y los planes de los agentes cambian seguido. Es la única fuente de la instalación de agentes: las plantillas y la guía enlazan ahí |
| Casos reales | Proyecto A y Proyecto B sin nombre ni pistas de su dominio; FILEY por nombre, solo como ejemplo de buen trabajo | A y B son proyectos personales. La evidencia está en la [lectura de apoyo](../3-agenticflow/material/lecturas/documentacion-para-agentes.md) y en el anexo del guion |
| Comprobaciones | Dos scripts POSIX `sh` sin dependencias: `verificar-sitio.sh` (ESP-01) y `verificar-enlaces.sh` (documentación) | Corren igual en Git Bash, macOS, Linux y Actions. Su salida en español es la evidencia de "¿cómo lo sé?" |

### 6.2 Lo que las etapas anteriores dejaron preparado, y dónde se usa

| Viene de | Qué deja | Dónde lo usa AgenticFlow |
|---|---|---|
| GitBasic, reto final | La pregunta *"¿Cómo puedes usar la IA en tu carrera sin perder el protagonismo?"* | Abre el Bloque 1 y se responde en el cierre |
| GitFlow, Bloque 3 | El issue como comanda, con *¿cuándo está terminado?*; *"la configuración es un archivo"* | Bloque 3 (comanda contra receta) y Bloque 2 (`AGENTS.md` es configuración y entra por PR) |
| GitFlow, Bloque 4 | *"Main es la mesa donde se sirve, no la tabla donde se corta"* | La analogía de la cocina sigue con el cocinero sin memoria |
| GitFlow, Bloques 4 a 6 | PR con plantilla, revisión obligatoria, robot, historia lineal, squash y revert | Son el soporte de las tres revisiones y del despliegue; el cierre los presenta como lo que ordena la velocidad del agente |
| GitFlow, cierre | *"No hay una sola forma correcta"* y *"las reglas están para servirle al equipo"* | El cierre: cada equipo ajusta cuánto escribe y qué tan larga es cada lista; lo que no se negocia es que alguien distinto revise antes de servir |
| GitFlow, tarea | "Nuestras reglas del juego" y una idea de proyecto | Fuente de la sección *Cómo trabajamos* de `AGENTS.md` (Bloque 2) y el proyecto que se construye y despliega en el proyecto final |
| GitFlow, notas finales | Temas fuera de alcance: `rebase -i`, `stash`, `cherry-pick`, `reflog`, tags y releases, ramas de larga vida | Siguen fuera de alcance |

### 6.3 Lo que AgenticFlow deja preparado para la mentoría

| Deja | Para qué sirve en la mentoría |
|---|---|
| Un proyecto desplegado, con su dirección pública | Mostrar algo que funciona |
| El repositorio con sus PRs y sus tres revisiones registradas | Que los mentores vean cómo trabajaron, no solo el resultado |
| ADR, registro de riesgos y bitácora del proyecto | Discutir decisiones y riesgos reales |
| `docs/mentoria.md` con 3 a 5 preguntas para los mentores, y el video | Aprovechar el tiempo de los mentores en lo que los equipos no saben resolver |

### 6.4 Pendientes

- **Diseñar la etapa de mentoría:** formato de la sesión, perfil y número de mentores, cuánto tiempo por equipo y cómo se recoge su retroalimentación.
- **Calibrar los tiempos** en la primera impartición. Están estimados con el ritmo de GitFlow (~3 veces el tiempo de teclear) más la espera del agente. El proyecto final (~12 h por equipo) necesita al menos dos semanas entre la sesión y la mentoría.
- **Repo de demostración del instructor** con la forma de un repo de equipo, para proyectar y para prestar a un equipo sin agente.
- **Numeración de autoestudios:** AgenticFlow usa los números 4 y 5 porque el 2 y el 3 están reservados para GitFlow (secciones 4.1 y 4.2), aunque todavía no existan como archivo.
