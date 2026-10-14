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
| 5 | Un agente de código funcionando en VS Code: al menos el piloto, idealmente todos | Cada quien | [4](#4-un-agente-de-código) |
| 6 | La solicitud del beneficio de estudiante de GitHub, enviada | Cada quien | [5](#5-programas-para-estudiantes) |
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
| 6 | Las plantillas de issue y de PR | `ls .github/ISSUE_TEMPLATE` muestra `tarea.md`, y existe `.github/pull_request_template.md` | Cópialas de [`2-gitflow/material/plantillas-y-robot/`](../../2-gitflow/material/plantillas-y-robot/), con la misma ruta, por PR | Bloque 2 |
| 7 | El robot revisor | `ls .github/workflows` muestra `revision.yml`, y `gh run list` muestra al menos una corrida | **Líder:** Actions → **set up a workflow yourself** → nombre `revision.yml` → pegar la receta de las [plantillas de GitFlow](../../2-gitflow/material/plantillas-y-robot/.github/workflows/revision.yml) → *Create a new branch and start a pull request* | Bloque 5 |
| 8 | Solo **Squash and merge** y ramas que se borran al integrar | `gh repo view`: `"squashMergeAllowed":true`, `"mergeCommitAllowed":false`, `"rebaseMergeAllowed":false`, `"deleteBranchOnMerge":true` | **Líder:** Settings → General → *Pull Requests*: desmarcar *Allow merge commits* y *Allow rebase merging*, dejar *Allow squash merging* (mensaje por omisión: *Pull request title and description*) y activar *Automatically delete head branches* | Bloque 5 |
| 9 | Las reglas de `main` (ruleset `proteger-main`) | `gh ruleset check main` lista: no borrar la rama, no forzar push, historia lineal, PR con 1 aprobación y el check **Sin marcadores de conflicto** con la rama al día | **Líder:** Settings → Rules → **Rulesets** → New branch ruleset → `proteger-main`, *Active*, *Include default branch*; marcar *Restrict deletions*, *Block force pushes*, *Require linear history*, *Require a pull request before merging* (1 aprobación) y *Require status checks to pass* (agregar **Sin marcadores de conflicto** y *Require branches to be up to date*) | Bloque 5 |
| 10 | El documento de la tarea: `docs/soporte/workflow_y_politicas_de_trabajo_colaborativo.md` | `ls docs/soporte` lo muestra | Si no lo entregaron, escriban la versión mínima de abajo (3.3), por PR. De ahí sale una parte del `AGENTS.md` | Tarea |
| 11 | Nada pendiente | `gh pr list` no muestra PRs abiertos; `git branch` solo muestra `main` | Integren o cierren los PRs abiertos; borren las ramas ya integradas con `git branch -D` | Bloque 8 |

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

**Qué necesita el curso de un agente:** que funcione **dentro de VS Code** (en el panel de chat o en la terminal integrada), que pueda **leer y cambiar los archivos del repo**, que **ejecute comandos pidiéndote permiso** y, de preferencia, que lea `AGENTS.md`.

**Mínimo:** al menos una persona por equipo, el **piloto**, con un agente funcionando. **Ideal:** todos, para turnarse y para tener respaldo si a alguien se le acaba la cuota a media clase.

### 4.1 Las opciones, de gratis a estándar

Precios en dólares estadounidenses, sin impuestos; con tarjeta mexicana el cargo aparece en pesos y puede incluir IVA.

| Nivel | Agente y plan | Costo | En VS Code | ¿Listo para el sábado? | Para qué alcanza |
|---|---|---|---|---|---|
| **Gratis** | **GitHub Copilot Free** | $0 | Viene en VS Code | **Sí**, en minutos | La sesión, con cuidado: el uso de chat y agente es limitado (las preguntas frecuentes de GitHub hablan de 50 solicitudes al mes). No alcanza para el proyecto final |
| **Gratis** | **GitHub Copilot Student** | $0 para estudiantes verificados | Viene en VS Code | **Quizá:** depende de la verificación (sección 5). Pídelo hoy | La sesión y los autoestudios: sugerencias de código ilimitadas y 200 créditos de IA al mes. El modelo lo elige Copilot automáticamente |
| **Gratis** | **Google Antigravity** (cuenta personal de Google) | $0 con cuota limitada | Extensión *Google Antigravity* o terminal (`agy`) | **Sí**, en minutos | La sesión, si la cuota alcanza: Google no publica claramente el límite gratuito y ha cambiado varias veces |
| **Gratis** | **Kilo Code** con modelos gratuitos | $0 | Extensión *Kilo Code* | **Sí**, en minutos | La sesión, con modelos menos capaces que los de pago y límites de uso. Ojo con la privacidad (abajo) |
| **Gratis** | **OpenCode** (código abierto) con sus modelos gratuitos, o con tu suscripción de Copilot o ChatGPT Plus | $0, o lo que ya pagas | Terminal integrada (`opencode`) y su extensión | **Sí**, si lo instalas y configuras antes: en Windows pide Node.js y **un ajuste obligatorio de permisos** | La sesión con modelos gratuitos, que cambian seguido; todo el curso si lo conectas a un plan de pago |
| **Económico** | **GitHub Copilot Pro** | $10 al mes | Viene en VS Code | **Sí**, al pagar | Los autoestudios y el proyecto final, con uso moderado |
| **Económico** | **Kilo Code** pagando por uso | Lo que consumas | Extensión *Kilo Code* | **Sí**, al agregar saldo | Tú controlas el gasto: compras créditos de Kilo o usas tu propia clave de API, y pagas solo lo que el agente consume |
| **Estándar** | **Claude Code** con Claude Pro | $20 al mes, o $17 al mes pagando el año ($200) | Extensión *Claude Code* y terminal (`claude`) | **Sí**, al pagar | Todo: sesión, autoestudios y proyecto final |
| **Estándar** | **OpenAI Codex** con ChatGPT Plus | $20 al mes | Extensión *Codex* y terminal (`codex`) | **Sí**, al pagar | Todo. Los planes Free y Go de ChatGPT **no** incluyen Codex en VS Code ni en la terminal |
| **Estándar** | **Google Antigravity** con Google AI Pro | $19.99 al mes | Extensión *Google Antigravity* y terminal (`agy`) | **Sí**, al pagar | Más cuota que la gratuita |

> **No sigas tutoriales viejos de estas dos:** el plan gratuito de **Gemini Code Assist** y el acceso a **Gemini CLI** con *Login with Google* dejaron de funcionar el 18 de junio de 2026 (Google recomienda pasar a Antigravity). **Amazon Q Developer** está en retiro: según varios reportes, ya no acepta cuentas gratuitas nuevas y sus extensiones dejan de tener soporte en abril de 2027.

**Nuestra recomendación para el sábado:**

1. **Todos:** activa hoy **Copilot Free** en VS Code (4.2). Es tu respaldo y tarda cinco minutos.
2. **Todos:** solicita hoy el **beneficio de estudiante de GitHub** (sección 5). Si se activa, tu Copilot Free se convierte en Copilot Student sin que reinstales nada.
3. **El piloto de cada equipo:** si puede, que use un plan **estándar** o Copilot Student ya activo; con el Free, la cuota se puede acabar a media clase.
4. **No gastes la cuota antes de la clase:** después de la prueba de la sección 4.3, deja de usar el agente hasta el sábado.

### 4.2 Cómo instalar cada uno

#### GitHub Copilot (Free, Student o Pro)

1. Actualiza VS Code. Las funciones de IA ya vienen incluidas.
2. Pasa el mouse sobre el ícono de Copilot en la barra inferior y elige **Use AI Features**. Inicia sesión **con la misma cuenta de GitHub del curso**.
3. Si tu cuenta no tiene plan, quedas en **Copilot Free** automáticamente. Si ya tienes Student o Pro, se usa ese.
4. Abre la vista de **Chat** y elige el modo que puede editar archivos y ejecutar comandos (el **agente**), no el de solo preguntas.
5. **`AGENTS.md`:** en **Settings** busca `chat.useAgentsMdFile` y confirma que esté activado.
6. **Privacidad (opcional):** en la versión gratuita la telemetría está activa. Para apagarla: **Settings** → `telemetry.telemetryLevel` → `off`.

Para pasar a **Pro** ($10 al mes): [github.com/features/copilot/plans](https://github.com/features/copilot/plans).

#### Claude Code (requiere Claude Pro o superior)

1. Contrata **Claude Pro** en [claude.com/pricing](https://claude.com/pricing). El plan gratuito de Claude **no** incluye Claude Code.
2. Instala el programa, en la terminal de tu sistema:

   ```bash
   # Windows (PowerShell)
   irm https://claude.ai/install.ps1 | iex

   # Windows (alternativa con winget)
   winget install Anthropic.ClaudeCode

   # macOS y Linux
   curl -fsSL https://claude.ai/install.sh | bash
   ```

3. Abre una terminal nueva y comprueba: `claude --version`.
4. En VS Code: **Extensions** → buscar **Claude Code** (de Anthropic) → **Install**.
5. Abre la carpeta del repo del equipo y ejecuta `claude` en la terminal integrada (o abre el panel de la extensión). La primera vez te pide iniciar sesión en el navegador.
6. **`AGENTS.md`:** Claude Code lo lee directamente si en el repo **no** hay un `CLAUDE.md` (desde la versión 2.1.277; el instalador nativo se actualiza solo). Si tu equipo ya tiene un `CLAUDE.md`, escribe en él una sola línea: `@AGENTS.md`.
7. **Windows:** Git for Windows (sección 2) es lo que le permite usar Git Bash. No necesitas instalar nada más.

#### OpenAI Codex (requiere ChatGPT Plus o superior)

1. Contrata **ChatGPT Plus**. Los planes Free y Go no incluyen Codex en la terminal ni en VS Code.
2. En VS Code: **Extensions** → buscar **Codex** (de OpenAI) → **Install** → **Sign in with ChatGPT**.
3. *(Opcional)* La versión de terminal:

   ```bash
   # Windows (PowerShell)
   powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"

   # macOS y Linux
   curl -fsSL https://chatgpt.com/codex/install.sh | sh
   ```

   Ejecuta `codex` dentro de la carpeta del repo y elige **Sign in with ChatGPT**.
4. **`AGENTS.md`:** lo lee directamente.

#### Google Antigravity (gratis con cuota, o con Google AI Pro)

1. En VS Code: **Extensions** → buscar **Google Antigravity** → **Install** → inicia sesión con tu **cuenta personal de Google**.
2. *(Opcional)* La versión de terminal:

   ```bash
   # Windows (PowerShell)
   irm https://antigravity.google/cli/install.ps1 | iex

   # macOS y Linux
   curl -fsSL https://antigravity.google/cli/install.sh | bash
   ```

   Ejecuta `agy` dentro de la carpeta del repo y sigue el inicio de sesión en el navegador.
3. **`AGENTS.md`:** las guías de uso indican que lo lee; compruébalo con la pregunta de la sección 4.3.
4. **No uses el IDE de Antigravity** (un editor aparte): en el curso usamos la extensión dentro de VS Code.

#### Kilo Code (gratis con modelos gratuitos, o pagando por uso)

1. En VS Code: **Extensions** → buscar **Kilo Code** → **Install**.
2. Crea tu cuenta gratuita de Kilo cuando la extensión te lo pida.
3. Elige el modelo **Auto Free** (o cualquiera marcado como *Free*). Según Kilo, los modelos gratuitos no requieren tarjeta.
4. **Privacidad:** Kilo advierte que *Auto Free* puede enviar tus mensajes a proveedores que los guardan y los usan para mejorar sus servicios. **No escribas nada personal ni confidencial**; para el repo del equipo, que es público, no es un problema.
5. **`AGENTS.md`:** su documentación no lo confirma; compruébalo con la pregunta de la sección 4.3. Si no lo lee, empieza cada conversación con *"Lee AGENTS.md antes de hacer cualquier cosa"*.

#### OpenCode (código abierto: gratis con sus modelos gratuitos, o con tu suscripción)

OpenCode es un agente de código abierto que corre en la terminal integrada de VS Code. Puede usar sus propios modelos gratuitos o la suscripción que ya tengas de Copilot o de ChatGPT Plus.

1. Instálalo:

   ```bash
   # Windows: primero Node.js (cierra y vuelve a abrir la terminal después)
   winget install --id OpenJS.NodeJS.LTS -e
   npm install -g opencode-ai

   # macOS y Linux
   curl -fsSL https://opencode.ai/install | bash
   ```

   > En Windows, OpenCode dice que la mejor experiencia es con WSL. La instalación de arriba funciona sin WSL; si algo falla, usa otra opción de esta sección en lugar de pelear con la instalación antes de la clase.

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

3. En VS Code, abre la carpeta del repo del equipo y ejecuta `opencode` en la terminal integrada. La extensión de VS Code se instala sola la primera vez.
4. Conecta un modelo con `/connect`:
   - **OpenCode:** crea tu cuenta en opencode.ai. Algunos modelos son gratuitos por tiempo limitado; la lista cambia seguido (revísala con `/models`).
   - **GitHub Copilot:** usa tu plan Free, Student o Pro. Algunos modelos pueden pedir un plan superior.
   - **OpenAI:** elige la opción de ChatGPT Plus/Pro e inicia sesión en el navegador.
5. **Comprueba el permiso** antes de la clase: pídele *"Ejecuta git status"*. **Debe pedirte permiso antes de ejecutarlo.** Si lo ejecuta sin preguntar, el paso 2 no funcionó: no lo uses en clase hasta corregirlo.
6. **Privacidad:** según OpenCode, durante su periodo gratuito algunos modelos pueden usar lo que les envías para mejorarse. No escribas nada personal ni confidencial.
7. **`AGENTS.md`:** lo lee directamente.

#### ¿Usas otro agente?

Si ya tienes un agente que no está en esta lista, puedes usarlo **bajo tu propio riesgo**, siempre que cumpla las cuatro condiciones del inicio de esta sección y pase la prueba de abajo. En clase no podremos resolver problemas de instalación de agentes que no estén aquí.

### 4.3 La prueba del agente

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

Revisamos qué ofertas para estudiantes existen hoy y si alcanzan a estar listas para la clase del **sábado 17 de octubre de 2026**:

| Programa | Qué da | ¿Aplica para alumnos de la UADY? | ¿Llega al sábado? |
|---|---|---|---|
| **GitHub Copilot Student** (con GitHub Education) | Copilot gratis: sugerencias ilimitadas y 200 créditos de IA al mes. También abre el resto del *Student Developer Pack* | **Sí**, con credencial o constancia vigente | **Posible, no garantizado.** GitHub no publica cuánto tarda la verificación, y después de aprobarla el beneficio *"puede tardar varios días"* en aplicarse. Las inscripciones estuvieron pausadas de abril a junio de 2026 y reabrieron gradualmente desde el 16 de junio. **Pídelo hoy** y usa Copilot Free mientras tanto |
| **Google AI Plus para estudiantes** | 12 meses gratis de Google AI Plus (fuera de EE. UU.). Se canjea hasta el 31 de diciembre de 2026 | Probablemente: Google lo ofrece en más de 140 países y excluye a EE. UU., Bolivia, Albania, Canadá, Macao, Hong Kong y Túnez | Sí, pero **no cuentes con él para el agente**: la oferta no menciona herramientas de código. Pide una forma de pago y, si no lo cancelas, al año cobra la mensualidad |
| **ChatGPT Plus para estudiantes** | Meses gratis de Plus | **No:** la única oferta vigente que encontramos es para universitarios de EE. UU. | No |
| **Claude para estudiantes** | No encontramos descuento individual. El acceso de estudiante llega solo si la universidad tiene un convenio de *Claude for Education* | No, de forma individual | No |

### Cómo solicitar el beneficio de estudiante de GitHub

1. Entra a [github.com/settings/education/benefits](https://github.com/settings/education/benefits) y haz clic en **Start an application**.
2. Ten a la mano **una prueba de que estás inscrito hoy**: tu credencial con fecha vigente, tu horario, tu kárdex o una constancia de estudios. Si te pide correo académico, agrega y verifica tu correo `@alumnos.uady.mx` en **Settings → Emails** antes de enviar la solicitud.
3. Envía la solicitud y espera la respuesta por correo.
4. Ya aprobado, vuelve a la misma página: en *"Free GitHub developer resources for students and teachers"* haz clic en **Learn more** y activa **Copilot Student**.
5. Si solo te aparecen opciones de pago, **no compres nada**: espera unos días y vuelve a intentarlo. Si sigue igual, escribe al soporte de GitHub Education.

> Requisitos de GitHub: ser estudiante inscrito en un programa que otorgue título, tener tu propia cuenta personal de GitHub y al menos 13 años.

---

## <font color="#179287">6. La comprobación final</font>

La noche anterior, cada quien:

- [ ] `code --version`, `git --version` y `gh --version` responden.
- [ ] `gh auth status` dice que tienes sesión.
- [ ] `git config user.name` y `git config user.email` tienen tus datos.
- [ ] En Windows, VS Code abre una terminal **Git Bash**.
- [ ] En tu copia del repo del equipo: `git switch main`, `git pull` y `git status` sin nada pendiente.
- [ ] Tu perfil está en `integrantes/` y tu fila en la tabla del README.
- [ ] Tu agente respondió la prueba de la sección 4.3 con los archivos reales, y sabes cómo aprueba permisos.
- [ ] Enviaste la solicitud del beneficio de estudiante de GitHub.

Y el equipo:

- [ ] Los once puntos de la sección 3.1 están en verde.
- [ ] Decidieron los papeles de la sesión: **piloto** (quien tenga el agente más capaz), **revisor**, **probador** y **líder**. En equipos de tres, el líder también es el probador.
- [ ] Saben quién tiene el agente de respaldo si al piloto se le acaba la cuota.

---

## <font color="#179287">Si algo sale mal</font>

| Problema | Solución |
|---|---|
| `gh: command not found` o `code` no se reconoce | Cierra y vuelve a abrir la terminal después de instalar. En Windows, si sigue igual, reinicia la sesión de Windows |
| `gh ruleset check main` responde *"Upgrade to GitHub Pro or make this repository public"* | El repo es privado: el líder lo hace público (sección 3.1, punto 1) |
| No aparece **Git Bash** en la terminal de VS Code | Instala Git for Windows (sección 2) y reinicia VS Code |
| El agente dice que no encuentra archivos | Lo abriste en otra carpeta: abre en VS Code **la carpeta del repo del equipo** (`File → Open Folder`) |
| Copilot dice que se acabó tu cuota | Usa el agente de respaldo de tu equipo. La cuota de Copilot Free se renueva cada mes |
| GitHub Education me pide más documentos | Sube otra prueba con fecha vigente (por ejemplo, el horario del semestre) y vuelve a enviar |
| Pagué un plan y la extensión sigue diciendo que no tengo acceso | Cierra sesión en la extensión, vuelve a iniciarla con **la misma cuenta** con la que pagaste y reinicia VS Code |
| Usas otro editor y algo no coincide | Es bajo tu propio riesgo: cambia a VS Code para la clase |

---

## <font color="#179287">Fuentes (consultadas el 14 de octubre de 2026)</font>

- GitHub: [planes de Copilot](https://github.com/features/copilot/plans) · [Copilot gratis para estudiantes](https://docs.github.com/copilot/how-tos/manage-your-account/free-access-with-copilot-student) · [solicitar GitHub Education como estudiante](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) · [plan Copilot Student](https://github.blog/changelog/2026-03-13-updates-to-github-copilot-for-students/) · [actualizaciones del plan para estudiantes](https://github.com/orgs/community/discussions/189268) · [reapertura de inscripciones](https://github.com/orgs/community/discussions/197089)
- VS Code: [configurar Copilot](https://code.visualstudio.com/docs/copilot/setup) · [instrucciones personalizadas y `AGENTS.md`](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
- Anthropic: [instalar Claude Code](https://code.claude.com/docs/en/setup) · [`AGENTS.md` en Claude Code](https://code.claude.com/docs/en/memory) · [planes y precios](https://claude.com/pricing)
- OpenAI: [Codex en GitHub](https://github.com/openai/codex) · [precios de Codex](https://learn.chatgpt.com/docs/pricing)
- Google: [fin del plan gratuito de Gemini Code Assist y Gemini CLI](https://developers.google.com/gemini-code-assist/docs/deprecations/code-assist-individuals) · [Antigravity: primeros pasos](https://antigravity.google/docs/getting-started/) · [oferta para estudiantes](https://blog.google/innovation-and-ai/products/gemini-app/student-offer-google-ai/)
- Kilo Code: [extensión para VS Code](https://kilo.ai/docs/code-with-ai/platforms/vscode) · [usar Kilo gratis](https://github.com/Kilo-Org/kilocode/blob/main/packages/kilo-docs/pages/getting-started/using-kilo-for-free.md)
- OpenCode: [instalación](https://opencode.ai/docs/) · [permisos](https://opencode.ai/docs/permissions/) · [configuración](https://opencode.ai/docs/config/) · [`AGENTS.md`](https://opencode.ai/docs/rules/) · [VS Code](https://opencode.ai/docs/ide/) · [proveedores](https://opencode.ai/docs/providers/) · [modelos y privacidad](https://opencode.ai/docs/zen/)
