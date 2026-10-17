<div align="center">

# Requisitos previos: lo que necesitas listo antes de la clase

Etapa 3 del curso de Git · AgenticFlow · Revísalo completo antes de la sesión

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

La sesión de AgenticFlow empieza a trabajar desde el primer minuto: no hay tiempo de clase para instalar, crear cuentas ni rehacer lo que quedó pendiente de GitFlow. Este documento dice qué necesitas, **cómo comprobar que ya lo tienes** y **qué hacer si no**.

> **Hazlo hoy, no la víspera.** Algunas cosas, como el beneficio de estudiante de GitHub, pueden tardar días en activarse. Si algo no te sale, avísale al instructor **antes** de la clase, por el canal del curso.

Los planes y precios de este documento se revisaron el **14 de octubre de 2026** en las páginas oficiales (están al final). Cambian seguido: si algo no coincide, manda lo que diga la página oficial.

---

## <font color="#179287">Resumen: la lista completa</font>

| # | Requisito | Quién | Sección |
|---|---|---|---|
| 1 | VS Code instalado, con una terminal **Git Bash** si usas Windows | Cada quien | [1](#1-el-editor-vs-code) |
| 2 | Git con tu nombre y correo, GitHub CLI con sesión iniciada | Cada quien | [2](#2-git-github-y-github-cli) |
| 3 | El repositorio del equipo de GitFlow, completo y con sus reglas | El líder, con el equipo | [3](#3-el-repositorio-del-equipo-lo-que-dejó-gitflow) |
| 4 | Tu copia del repo del equipo, al día | Cada quien | [3](#3-el-repositorio-del-equipo-lo-que-dejó-gitflow) |
| 5 | OpenCode funcionando en la terminal, con Copilot Free como respaldo: al menos el piloto, idealmente todos | Cada quien | [4](#4-un-agente-de-código) |
| 6 | (Opcional) La solicitud del beneficio de estudiante de GitHub, enviada | Cada quien | [5](#5-programas-para-estudiantes) |
| 7 | Los papeles del equipo decididos: piloto, revisor, probador y líder | El equipo | [6](#6-la-comprobación-final) |

---

## <font color="#179287">1. El editor: VS Code</font>

**Trabajamos con Visual Studio Code.** La guía, las instrucciones, las capturas y la ayuda en clase están hechas para VS Code.

> **Si decides usar otro editor, es bajo tu propio riesgo.** Eso incluye editores que se parecen a VS Code y traen su propio agente (Cursor, Windsurf, el IDE de Antigravity), los de JetBrains, Zed, Neovim y cualquier otro. Los pasos pueden no coincidir, algunas opciones pueden no existir y en clase no podremos detenernos a resolverlo.

| Requisito | Cómo lo compruebas | Si no lo tienes |
|---|---|---|
| VS Code instalado y actualizado | En una terminal: `code --version` responde con un número. En VS Code: **Help → Check for Updates** | Windows: `winget install --id Microsoft.VisualStudioCode -e` · macOS: `brew install --cask visual-studio-code` · Linux: [instrucciones oficiales](https://code.visualstudio.com/docs/setup/linux) |
| **Windows:** una terminal Git Bash dentro de VS Code | En VS Code, flecha junto al **+** de la terminal: aparece **Git Bash** | Viene con Git (sección 2). Si no aparece después de instalar Git, cierra y vuelve a abrir VS Code |
| La extensión GitLens (la usaste en GitFlow) | **Extensions** (`Ctrl+Shift+X`) → buscar *GitLens* | Instálala desde ahí. No inicies sesión ni conectes nada |

> **Por qué Git Bash:** las comprobaciones de la etapa son scripts `sh` y PowerShell no los conoce. Si quieres que Git Bash sea la terminal por omisión: `Ctrl+Shift+P` → **Terminal: Select Default Profile** → **Git Bash**.

---

## <font color="#179287">2. Git, GitHub y GitHub CLI</font>

Todo esto ya lo tenías desde GitBasic y GitFlow. Compruébalo de todos modos: una actualización del sistema o una computadora nueva lo pueden haber borrado.

```bash
git --version
git config user.name
git config user.email
gh --version
gh auth status
```

| Requisito | Qué debe responder | Si no responde bien |
|---|---|---|
| Cuenta de GitHub con correo verificado | Puedes entrar a [github.com](https://github.com) y en **Settings → Emails** tu correo dice *Verified* | Verifica el correo desde esa página |
| Git | `git --version` responde con un número | Windows: `winget install --id Git.Git -e` · macOS: `brew install git` · Linux: `sudo apt install git` (o el gestor de tu distribución) |
| Tu nombre y correo en Git | `git config user.name` y `git config user.email` responden con tus datos | `git config --global user.name "Tu Nombre"` y `git config --global user.email "el-correo-de-tu-cuenta-de-github"` |
| GitHub CLI | `gh --version` responde con un número | Windows: `winget install --id GitHub.cli -e` · macOS: `brew install gh` · Linux: [instrucciones oficiales](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) |
| Sesión de GitHub CLI | `gh auth status` dice que tienes sesión en github.com | `gh auth login` → GitHub.com → HTTPS → *Login with a web browser* |

> En Windows, después de instalar con `winget`, **cierra y vuelve a abrir la terminal** para que reconozca los comandos nuevos.

---

## <font color="#179287">3. El repositorio del equipo (lo que dejó GitFlow)</font>

AgenticFlow trabaja sobre el repositorio que su equipo construyó en GitFlow: los perfiles de `integrantes/` son los datos de la página que van a construir, y las reglas de `main` son las que van a revisar el trabajo del agente. **Si su equipo no terminó alguna actividad de GitFlow, o la hizo distinto, déjenla lista aquí.** Lo que es configuración del repo lo hace el líder; lo demás, cada quien.

### 3.1 La comprobación rápida

Desde la carpeta de tu copia del repo del equipo, en Git Bash:

```bash
git switch main
git pull
git status
gh repo view --json visibility,squashMergeAllowed,mergeCommitAllowed,rebaseMergeAllowed,deleteBranchOnMerge
gh ruleset check main
gh api "repos/{owner}/{repo}/collaborators" --jq '.[].login'
gh run list --workflow revision.yml --limit 1
gh pr list
ls integrantes .github/ISSUE_TEMPLATE .github/workflows docs/soporte
```

Cada línea de la tabla siguiente dice qué debe responder y cómo arreglarlo si no. La última columna dice en qué bloque de la [guía de GitFlow](../../2-gitflow/material/guia-alumno.md) se hizo originalmente, por si necesitas repasar el paso a paso.

| # | Requisito | Qué debe responder | Si no, cómo dejarlo listo | GitFlow |
|---|---|---|---|---|
| 1 | El repo `equipo-[nombre]` es **público** y está en la cuenta del líder | `gh repo view`: `"visibility":"PUBLIC"` | **Líder:** Settings → General → *Danger Zone* → **Change visibility** → Public. Las reglas de `main` y GitHub Pages son gratuitas solo en repos públicos | Bloque 2 |
| 2 | Todos los integrantes son colaboradores | `gh api .../collaborators`: aparece el usuario de cada integrante | **Líder:** Settings → **Collaborators** → **Add people**. Cada invitado la acepta en [github.com/notifications](https://github.com/notifications) | Bloque 2 |
| 3 | Cada quien tiene su copia al día | `git status`: *"Your branch is up to date with 'origin/main'"* y nada pendiente | Si no tienes copia: `gh repo clone usuario-del-lider/equipo-[nombre]`. Si tienes cambios a medias que no sirven: `git switch main` y `git reset --hard origin/main` | Bloque 2 |
| 4 | El `README.md` tiene el título del equipo y la tabla **Integrantes** con una fila por persona (Nombre, Carrera, Usuario de GitHub) | Ábrelo en GitHub | Cada quien agrega su fila con el ritual de siempre: issue, rama, PR y **Squash and merge** | Bloques 2 y 7 |
| 5 | Un perfil por integrante en `integrantes/[tu-nombre].md` con **Nombre**, **Carrera**, **Una frase** y **Foto** (`![foto](https://github.com/tu-usuario.png)`) | `ls integrantes`: un archivo por persona | Cada quien crea el suyo con el formato del README, por PR. **Sin perfiles no hay datos para la página** | Bloque 4 |
| 6 | Las plantillas de issue y de PR | `ls .github/ISSUE_TEMPLATE` muestra `tarea.md`, y existe `.github/pull_request_template.md` | Cópialas de [`2-gitflow/material/plantillas/`](../../2-gitflow/material/plantillas/), con la misma ruta, por PR | Bloque 2 |
| 7 | El robot revisor | `ls .github/workflows` muestra `revision.yml`, y `gh run list` muestra al menos una corrida | **Líder:** Actions → **set up a workflow yourself** → nombre `revision.yml` → pegar la receta de las [plantillas de GitFlow](../../2-gitflow/material/plantillas/.github/workflows/revision.yml) → *Create a new branch and start a pull request* | Bloque 5 |
| 8 | Solo **Squash and merge** y ramas que se borran al integrar | `gh repo view`: `"squashMergeAllowed":true`, `"mergeCommitAllowed":false`, `"rebaseMergeAllowed":false`, `"deleteBranchOnMerge":true` | **Líder:** Settings → General → *Pull Requests*: desmarcar *Allow merge commits* y *Allow rebase merging*, dejar *Allow squash merging* (mensaje por omisión: *Pull request title and description*) y activar *Automatically delete head branches* | Bloque 5 |
| 9 | Las reglas de `main` (ruleset `proteger-main`) | `gh ruleset check main` lista: no borrar la rama, no forzar push, historia lineal, PR con 1 aprobación y el check **Sin marcadores de conflicto** con la rama al día | **Líder:** Settings → Rules → **Rulesets** → New branch ruleset → `proteger-main`, *Active*, *Include default branch*; marcar *Restrict deletions*, *Block force pushes*, *Require linear history*, *Require a pull request before merging* (1 aprobación) y *Require status checks to pass* (agregar **Sin marcadores de conflicto** y *Require branches to be up to date*) | Bloque 5 |
| 10 | El documento de la tarea: `docs/soporte/workflow_y_politicas_de_trabajo_colaborativo.md` | `ls docs/soporte` lo muestra | Si no lo entregaron, escriban la versión mínima de abajo (3.3), por PR. De ahí sale una parte del `AGENTS.md` | Tarea |
| 11 | Nada pendiente | `gh pr list` no muestra PRs abiertos; `git branch` solo muestra `main` | Integren o cierren los PRs abiertos; borren las ramas ya integradas con `git branch -D` | Autoestudio 3 |

> **Si `gh ruleset check main` responde *"Upgrade to GitHub Pro or make this repository public"*,** el repo es privado: vuelve al punto 1.

### 3.2 Si su equipo no tiene repositorio

Pasa si son un equipo nuevo, si alguien se cambió de equipo o si el repo se perdió. Sigan la [guía de GitFlow](../../2-gitflow/material/guia-alumno.md) **solo en estos pasos**, en este orden (calculen una hora y media en equipo):

| Paso | En la guía de GitFlow | Quién |
|---|---|---|
| Crear el repo local con el README base y las plantillas, publicarlo vacío en GitHub y subir `main` | Bloque 2, pasos 1 y 2 | Líder |
| Agregar a los colaboradores, aceptar la invitación y clonar | Bloque 2, pasos 3 y 4 | Líder, luego todos |
| Un perfil por integrante, cada uno con su issue, rama y PR | Bloques 3 y 4 | Cada quien |
| Solo squash, borrar ramas, ruleset y robot | Bloque 5 | Líder |
| Una fila por integrante en la tabla del README | Bloque 7, paso 1 (sin provocar el conflicto: uno a la vez) | Cada quien |
| El documento de reglas mínimo | Sección 3.3 de este documento | El equipo |

### 3.3 El documento de reglas, versión mínima

Si su equipo no entregó "Nuestras reglas del juego", creen `docs/soporte/workflow_y_politicas_de_trabajo_colaborativo.md` con las reglas que usaron en clase. Es lo mínimo que necesita el agente para no romperlas; pueden ampliarlo después.

```markdown
# Nuestras reglas del juego · Equipo [nombre]

## Ramas
- Nunca se trabaja directo en `main`.
- Cada tarea tiene su issue y su rama `feature/[número-de-issue]-[descripción]`, creada desde un `main` al día.

## Commits
- Formato `tipo: mensaje`, en español: `docs:` documentos, `feat:` algo nuevo, `fix:` correcciones.

## Pull Requests
- Todo entra por PR, con la plantilla y `Closes #[número]`.
- Necesita la aprobación de otra persona y el robot en verde.

## Integración
- Solo **Squash and merge**. La rama se borra al integrar.
- Para ponerse al día: `git pull --rebase origin main`. Para subir después de un rebase: `git push --force-with-lease`.

## Lo que no hacemos
- Push directo a `main`, `--force` a secas, reescribir la historia de `main`.
```

---

## <font color="#179287">4. Un agente de código</font>

**Qué necesita el curso de un agente:** que corra en la **terminal**, que pueda **leer y cambiar los archivos del repo**, que **ejecute comandos pidiéndote permiso** y que lea `AGENTS.md`.

**Mínimo:** al menos una persona por equipo, el **piloto**, con OpenCode funcionando. **Ideal:** todos, para turnarse y para tener respaldo si a alguien se le acaba la cuota a media clase.

### 4.1 El agente del curso: OpenCode

**OpenCode** es el agente del curso: código abierto, corre en la terminal, lee `AGENTS.md` de forma nativa y **te obliga a configurar permisos** antes de dejarlo tocar nada — justo la lección de esta etapa: *lo que el agente ejecuta, lo firmas tú*. Usa sus propios modelos gratuitos (cambian seguido) o la suscripción que ya tengas de Copilot o de ChatGPT Plus.

**¿Ya lo tienes?** En la terminal:

```bash
opencode --version
```

Si responde con una versión, ve directo a comprobar el permiso (4.2, paso 5). Si no, instálalo con los pasos de abajo.

> **¿Ya pagas otro agente de terminal (Claude Code, Codex, Antigravity)?** Puedes usarlo bajo tu propio riesgo, si lee `AGENTS.md` y pasa la prueba de 4.4. En clase no resolvemos problemas de instalación de agentes fuera de OpenCode.

### 4.2 Cómo instalarlo

1. Instálalo:

   ```bash
   # Windows: primero Node.js (cierra y vuelve a abrir la terminal después)
   winget install --id OpenJS.NodeJS.LTS -e
   npm install -g opencode-ai

   # macOS y Linux
   curl -fsSL https://opencode.ai/install | bash
   ```

   > En Windows, OpenCode dice que la mejor experiencia es con WSL. La instalación de arriba funciona sin WSL; si algo falla, cae al respaldo (4.3) en vez de pelear con la instalación antes de la clase.

2. **Antes de usarlo, haz que pida permiso. Es obligatorio en el curso.** Por omisión, OpenCode edita archivos y ejecuta comandos **sin preguntar**. Crea el archivo de configuración global `~/.config/opencode/opencode.json` (en Windows, `C:\Users\TU-USUARIO\.config\opencode\opencode.json`) con este contenido:

   ```json
   {
     "$schema": "https://opencode.ai/config.json",
     "permission": {
       "edit": "ask",
       "bash": "ask"
     }
   }
   ```

3. En la terminal, abre la carpeta del repo del equipo y ejecuta `opencode`. Si trabajas desde VS Code, su extensión se instala sola la primera vez.
4. Conecta un modelo con `/connect`: **OpenCode** (cuenta gratuita en opencode.ai, revisa `/models`), **GitHub Copilot** (tu plan Free, Student o Pro) u **OpenAI** (ChatGPT Plus/Pro).
5. **Comprueba el permiso** antes de la clase: pídele *"Ejecuta git status"*. **Debe pedirte permiso antes de ejecutarlo.** Si lo ejecuta sin preguntar, el paso 2 no funcionó: no lo uses en clase hasta corregirlo.
6. **Privacidad:** según OpenCode, durante su periodo gratuito algunos modelos pueden usar lo que les envías para mejorarse. No escribas nada personal ni confidencial.
7. **`AGENTS.md`:** lo lee directamente.

### 4.3 Si OpenCode no te arranca: Copilot Free (respaldo)

Copilot Free es la **red de seguridad** del curso, no una alternativa equivalente: viene incluido en VS Code, no necesita instalación aparte y está listo en minutos — pero su cuota (las preguntas frecuentes de GitHub hablan de ~50 solicitudes al mes) **no alcanza para el proyecto final**.

1. Actualiza VS Code. Las funciones de IA ya vienen incluidas.
2. Pasa el mouse sobre el ícono de Copilot en la barra inferior y elige **Use AI Features**. Inicia sesión **con la misma cuenta de GitHub del curso**.
3. Abre la vista de **Chat** y elige el modo que puede editar archivos y ejecutar comandos (el **agente**), no el de solo preguntas.
4. **`AGENTS.md`:** en **Settings** busca `chat.useAgentsMdFile` y confirma que esté activado.

> Si ya tienes el beneficio de estudiante de GitHub (sección 5), tu Copilot Free se convierte en Copilot Student automáticamente, sin que reinstales nada — pero no es requisito del curso.

### 4.4 La prueba del agente

Con el agente abierto **en la carpeta del repo del equipo**, pídele:

```text
¿Qué archivos hay en este repositorio y para qué crees que sirve?
```

Debe responder con los archivos reales. Después, en su configuración, revisa dos cosas:

- **Cómo pide permiso** antes de editar un archivo o ejecutar un comando. En clase cada permiso se lee y se decide.
- **Que no esté activado ningún modo de aprobar todo**: los nombres cambian según el agente (*auto-approve*, *bypass permissions*, *full access*, *YOLO*), pero la idea es la misma. En el curso no se usan.

> **Lo que nunca le escribes a un agente:** contraseñas, tokens, claves ni datos personales de nadie. Es el riesgo R8 de la etapa, y empieza a mitigarse antes de la primera conversación.

---

## <font color="#179287">5. Programas para estudiantes</font>

GitHub Education sigue existiendo y da **Copilot Student**: sugerencias ilimitadas y 200 créditos de IA al mes. Si lo activas, tu Copilot Free (sección 4.3) se convierte en Student automáticamente, sin que reinstales nada. **No es requisito del curso** — con Copilot Free como respaldo alcanza para la sesión.

Si quieres pedirlo: [github.com/settings/education/benefits](https://github.com/settings/education/benefits). GitHub no publica cuánto tarda la verificación; pídelo con días de anticipación si te interesa para los autoestudios o el proyecto final.

---

## <font color="#179287">6. La comprobación final</font>

La noche anterior, cada quien:

- [ ] `code --version`, `git --version` y `gh --version` responden.
- [ ] `gh auth status` dice que tienes sesión.
- [ ] `git config user.name` y `git config user.email` tienen tus datos.
- [ ] En Windows, VS Code abre una terminal **Git Bash**.
- [ ] En tu copia del repo del equipo: `git switch main`, `git pull` y `git status` sin nada pendiente.
- [ ] Tu perfil está en `integrantes/` y tu fila en la tabla del README.
- [ ] Tu agente (OpenCode, o Copilot Free si es tu respaldo) respondió la prueba de la sección 4.4 con los archivos reales, y sabes cómo aprueba permisos.
- [ ] (Opcional) Enviaste la solicitud del beneficio de estudiante de GitHub.

Y el equipo:

- [ ] Los once puntos de la sección 3.1 están en verde.
- [ ] Decidieron los papeles de la sesión: **piloto** (quien tenga el agente más capaz), **revisor**, **probador** y **líder**. En equipos de tres, el líder también es el probador.
- [ ] Saben que Copilot Free (sección 4.3) es el respaldo si a OpenCode se le acaba la cuota del piloto.

---

## <font color="#179287">Si algo sale mal</font>

| Problema | Solución |
|---|---|
| `gh: command not found` o `code` no se reconoce | Cierra y vuelve a abrir la terminal después de instalar. En Windows, si sigue igual, reinicia la sesión de Windows |
| `gh ruleset check main` responde *"Upgrade to GitHub Pro or make this repository public"* | El repo es privado: el líder lo hace público (sección 3.1, punto 1) |
| No aparece **Git Bash** en la terminal de VS Code | Instala Git for Windows (sección 2) y reinicia VS Code |
| El agente dice que no encuentra archivos | Lo abriste en otra carpeta: abre en VS Code **la carpeta del repo del equipo** (`File → Open Folder`) |
| OpenCode ejecuta `git status` sin pedir permiso | Revisa `opencode.json` (sección 4.2, paso 2): falta `permission.edit`/`bash` en `"ask"`, o el archivo no quedó en la ruta correcta |
| Se te acabaron las solicitudes de Copilot Free (tu respaldo) | Espera a que se renueve el mes, o prueba otro modelo gratuito de OpenCode con `/models` |
| Usas otro editor y algo no coincide | Es bajo tu propio riesgo: cambia a VS Code para la clase |

---

## <font color="#179287">Fuentes (consultadas el 14 de octubre de 2026)</font>

- GitHub: [planes de Copilot](https://github.com/features/copilot/plans) · [Copilot gratis para estudiantes](https://docs.github.com/copilot/how-tos/manage-your-account/free-access-with-copilot-student) · [solicitar GitHub Education como estudiante](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) · [plan Copilot Student](https://github.blog/changelog/2026-03-13-updates-to-github-copilot-for-students/) · [actualizaciones del plan para estudiantes](https://github.com/orgs/community/discussions/189268) · [reapertura de inscripciones](https://github.com/orgs/community/discussions/197089)
- VS Code: [configurar Copilot](https://code.visualstudio.com/docs/copilot/setup) · [instrucciones personalizadas y `AGENTS.md`](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
- OpenCode: [instalación](https://opencode.ai/docs/) · [permisos](https://opencode.ai/docs/permissions/) · [configuración](https://opencode.ai/docs/config/) · [`AGENTS.md`](https://opencode.ai/docs/rules/) · [VS Code](https://opencode.ai/docs/ide/) · [proveedores](https://opencode.ai/docs/providers/) · [modelos y privacidad](https://opencode.ai/docs/zen/)
