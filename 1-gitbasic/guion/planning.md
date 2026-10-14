# Curso Básico: Git & GitHub con GitHub Desktop desde Cero
**Dirigido a:** Estudiantes de nuevo ingreso

**Duración:** ~4 horas efectivas

**Modalidad:** 100% visual, usando GitHub Desktop como cliente gráfico y VS Code como editor de archivos Markdown

**Distribución:** ~100 min trabajo individual · ~80 min trabajo en equipos · ~40 min teoría · ~20 min cierre · 10-15 min descanso

## Contenidos

- El alumno conocerá la herramienta del control de versiones que le permitirá organizar y administrar sus archivos mediante Git y GitHub Desktop.

- El alumno conocerá, creará y clonará un repositorio de un proyecto.

- El alumno practicará la sintaxis de Markdown creando y editando archivos `.md` a lo largo de toda la sesión.

- El alumno aprenderá las acciones push, fetch y pull para sincronizar cambios con GitHub.

- El alumno aprenderá a navegar el historial de commits con GitHub Desktop, GitLens y Git Graph.

- El alumno conocerá las opciones para deshacer cambios en distintas etapas (Discard, Undo, Abort merge, Revert).

- El alumno conocerá las maneras de poder corregir merge conflicts.


## Requisitos previos
- Laptop con Git instalado
- VS Code instalado
- Cuenta de GitHub creada previamente
- Cuenta de correo verificada (no es necesaria el student developer pack)
- GitHub Desktop instalado y cuenta vinculada
- Extensiones de VS Code instaladas: **GitLens** y **Git Graph**

---

## Agenda

### Bloque 1 — Introducción (15 min) — Teoría (canva)
- ¿Qué es el control de versiones y por qué existe?
- Git vs. GitHub: la herramienta vs. la plataforma
- ¿Por qué GitHub Desktop? (ver visualmente lo que pasa "por dentro")
- 📝 Mini actividad Markdown: crear `mi-perfil.md` con encabezados, listas y citas

### Bloque 2 — Setup rápido + tour de interfaz (15 min) — Teoría
- Instalar GitHub Desktop y conectar cuenta de GitHub (antelación)
- Tour rápido: Current Repository, Current Branch, Changes, History, Push origin
- 📝 Mini actividad Markdown: agregar tabla y código en línea a `mi-perfil.md`

### Bloque 3 — Conceptos fundamentales (10 min) — Teoría (mostrar GitHub Desktop)
- Repositorio (repo)
- ¿Qué es un commit? Anatomía de un commit (autor, mensaje, hash)
- El historial de commits: cómo leerlo
- 📝 Mini actividad Markdown: agregar lista de tareas con `- [ ]` a `mi-perfil.md`

### Bloque 4 — Primer repositorio + commits (25 min) 🖐️ Individual
- Crear un repo nuevo desde GitHub Desktop (File → New Repository)
- Modificar `mi-perfil.md` en VS Code, hacer stage (casillas) y escribir mensajes de commit
- Ejercicio: realizar 3–4 commits y ver el historial crecer

### Bloque 5 — Ramas (branches) visualmente (35 min) 🖐️ Individual
- ¿Qué es una rama? (analogía de "línea de tiempo alterna")
- Crear una rama nueva y cambiar entre ramas (Current Branch dropdown)
- Fusionar (merge) visualmente: Branch → Merge into Current Branch
- 📝 Mini actividad Markdown: agregar links y listas numeradas en la rama nueva
- Ejercicio: crear una rama, hacer cambios y fusionarla a main

**☕ Descanso (10-15 min)**

### Bloque 6 — Trabajo remoto: Push, Fetch y Pull (20 min) 🖐️ Individual
- ¿Qué es un remoto (remote)? origin y GitHub
- Push: Publish repository / Push origin
- Diferencia entre Fetch y Pull: "Fetch = mirar el buzón, Pull = meter las cartas al escritorio"
- GitHub.com se usa solo para verificar visualmente que los archivos llegaron (lectura, sin editar)
- 📝 Mini actividad Markdown: agregar sección de reflexión en VS Code antes del push
- Ejercicio: subir el repo de práctica a la cuenta personal de GitHub

### Bloque 7 — Viajando en el historial (10 min) 🖐️ Individual
- Pestaña History en GitHub Desktop: leer diffs commit por commit
- GitLens: blame inline, ver quién escribió cada línea y cuándo
- Git Graph: árbol visual de commits y ramas (Git Graph: View Git Graph desde la paleta de comandos)
- Concepto clave: mirar el historial no modifica nada, es como pausar un video

### Bloque 8 — Si algo sale mal (10 min) 🖐️ Individual
- **Discard changes**: descartar cambios antes de hacer commit (clic derecho en Changes → GitHub Desktop)
- **Undo commit**: deshacer el último commit local no publicado
- **Abort merge**: cancelar un merge en curso durante un conflicto
- **Revert commit**: crear un commit nuevo que deshace uno ya publicado (opción segura)
- Diferencia clave: Undo reescribe, Revert agrega — Revert es siempre seguro

### Bloque 9 — Colaboración: Fork + equipo + Pull Request (30 min) 👥 Equipos
- Líder del equipo: Fork del repo del instructor desde GitHub.com
- Líder: agrega compañeros como collaborators en Settings del fork (GitHub.com, solo configuración)
- Compañeros: aceptan invitación y clonan el fork del líder en GitHub Desktop
- Pull real en equipo: líder pushea, compañeros hacen Fetch + Pull — aquí se practica Pull por primera vez
- PR: GitHub Desktop abre navegador → líder manda PR al repo del instructor
- main del instructor protegido (codeowner): solo el instructor aprueba y mergea
- Alumnos dejan comentarios en PRs ajenos (lectura + feedback, sin merge)

### Bloque 10 — Proyecto final: perfiles en equipo + conflictos reales (50 min) 👥 Equipos
- Continúan en el mismo fork del Bloque 9 (no clonar de nuevo)
- Líder crea el archivo base `answers-box/equipo-[nombre].md` con la estructura de perfiles y preguntas del equipo; hace commit + Push origin
- Cada integrante crea su propia rama `perfil-[su-nombre]` desde la rama `equipo-[nombre]`
- Cada quien agrega su sección al archivo (perfil + responde una pregunta distinta), hace commit + Push origin
- Cada integrante manda un PR hacia la rama del líder (base: `equipo-[nombre]` ← compare: `perfil-[su-nombre]`)
- Líder mergea los PRs uno por uno → el primero sin conflicto; el segundo genera conflicto natural
- **¿Qué es un conflicto y por qué ocurre?** Dos integrantes editaron la misma zona del archivo en ramas distintas
- Entender las marcas `<<<<<<<`, `=======`, `>>>>>>>`: conservar ambas secciones y eliminar los marcadores
- Si el conflicto da pánico: recordar Abort merge del Bloque 8
- PR final de la rama `equipo-[nombre]` al repo del instructor desde GitHub Desktop → navegador
- Alumnos dejan comentario en el PR de otro equipo
- Instructor acepta los PRs; equipos visualizan `answers-box/` del instructor en GitHub.com para ver el trabajo colectivo

### Cierre (20 min) — Plenaria
- Recapitulación del flujo completo
- Recursos para seguir practicando (GitHub Learning Lab, Oh My Git!, etc.)
- Preguntas abiertas

---

## Resumen de tiempos

| Segmento | Tiempo |
|---|---|
| Teoría (Bloques 1–3) | 40 min |
| Trabajo individual (Bloques 4–8) | 100 min |
| Trabajo en equipos (Bloques 9–10) | 80 min |
| Cierre | 20 min |
| Descanso | 10-15 min |
| **Total** | **~250-255 min (~4h)** |

---
