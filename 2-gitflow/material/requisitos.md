<div align="center">

# Requisitos previos: lo que necesitas listo antes de la clase

Etapa 2 del curso de Git · GitFlow · Revísalo completo antes de la primera sesión

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

GitFlow trabaja en la terminal desde el primer minuto: no hay tiempo de clase para instalar ni crear cuentas. Este documento dice qué necesitas, **cómo comprobar que ya lo tienes** y **qué hacer si no**.

Varias cosas vienen de GitBasic. **Si no terminaste GitBasic, si algo te quedó a medias o si cambiaste de computadora, déjalo listo aquí:** cada requisito dice cómo.

> **Hazlo antes de la clase, no al llegar.** Si algo no te sale, avísale al instructor **antes** de la sesión, por el canal del curso.

---

## <font color="#179287">Resumen: la lista completa</font>

| # | Requisito | Viene de | Quién | Sección |
|---|---|---|---|---|
| 1 | VS Code con la extensión GitLens, sin iniciar sesión en ella | GitBasic | Cada quien | [1](#1-el-editor-vs-code) |
| 2 | Cuenta de GitHub con correo verificado | GitBasic | Cada quien | [2](#2-lo-que-viene-de-gitbasic) |
| 3 | Git instalado, con tu nombre y tu correo | GitBasic | Cada quien | [2](#2-lo-que-viene-de-gitbasic) |
| 4 | GitHub CLI instalado y con tu sesión iniciada | Nuevo | Cada quien | [3](#3-github-cli) |
| 5 | Un equipo de 3 o 4 personas con un líder, y el usuario de GitHub de cada integrante | GitBasic | El equipo | [4](#4-el-equipo) |

---

## <font color="#179287">1. El editor: VS Code</font>

**Trabajamos con Visual Studio Code.** La guía, las instrucciones y la ayuda en clase están hechas para VS Code.

> **Si decides usar otro editor, es bajo tu propio riesgo.** Los pasos pueden no coincidir, algunas opciones pueden no existir y en clase no podremos detenernos a resolverlo.

| Requisito | Cómo lo compruebas | Si no lo tienes |
|---|---|---|
| VS Code instalado y actualizado | En una terminal: `code --version` responde con un número. En VS Code: **Help → Check for Updates** | Windows: `winget install --id Microsoft.VisualStudioCode -e` · macOS: `brew install --cask visual-studio-code` · Linux: [instrucciones oficiales](https://code.visualstudio.com/docs/setup/linux) |
| La extensión **GitLens** | **Extensions** (`Ctrl+Shift+X`) → buscar *GitLens*: aparece como instalada | Instálala desde ahí |
| GitLens **sin cuenta** | GitLens no te pide nada al abrir VS Code | Si muestra una bienvenida o te invita a crear una cuenta, iniciar una prueba de Pro o conectar GitHub, **cierra la ventana e ignórala**. En clase solo usamos lo gratuito y sin cuenta |

> La vista **Graph** que usamos es la del panel **Source Control** de VS Code, no la *Commit Graph* de GitLens. Si te quedó la extensión *Git Graph* de GitBasic, no estorba, pero no la usamos.

---

## <font color="#179287">2. Lo que viene de GitBasic</font>

En una terminal (en VS Code: `` Ctrl+` ``):

```bash
git --version
git config user.name
git config user.email
```

| Requisito | Qué debe responder | Si no responde bien |
|---|---|---|
| Cuenta de GitHub con correo verificado | Puedes entrar a [github.com](https://github.com) y en **Settings → Emails** tu correo dice *Verified* | Crea la cuenta en [github.com](https://github.com) o verifica el correo desde esa página |
| Git | `git --version` responde con un número | Windows: `winget install --id Git.Git -e` · macOS: `brew install git` · Linux: `sudo apt install git` (o el gestor de tu distribución) |
| Tu nombre y tu correo en Git | `git config user.name` y `git config user.email` responden con tus datos | Si vinculaste tu cuenta en GitHub Desktop, ya están. Si no: `git config --global user.name "Tu Nombre"` y `git config --global user.email "el-correo-de-tu-cuenta-de-github"` |

> **No necesitas GitHub Desktop en esta etapa.** Si lo tienes de GitBasic, déjalo instalado: es el que dejó configurados tu nombre y tu correo, y la terminal usa esa misma configuración.

---

## <font color="#179287">3. GitHub CLI</font>

GitHub CLI (`gh`) es lo único nuevo que hay que instalar. Si ya tienes Git, estos comandos lo detectan y solo instalan lo que falta.

**Windows** (PowerShell o Terminal):

```powershell
winget install --id Git.Git -e
winget install --id GitHub.cli -e
```

**macOS** (requiere [Homebrew](https://brew.sh/)):

```bash
brew install git gh
```

**Linux:**

```bash
# Ubuntu / Debian
sudo apt update && sudo apt install git gh

# Fedora
sudo dnf install git gh

# Arch
sudo pacman -S git github-cli
```

> Si tu distribución no encuentra el paquete `gh`, sigue las [instrucciones oficiales para Linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md).

Después de instalar, **cierra y vuelve a abrir la terminal** e inicia sesión:

```bash
gh --version
gh auth login       # GitHub.com → HTTPS → Login with a web browser
gh auth status      # debe decir que tienes sesión en github.com
```

---

## <font color="#179287">4. El equipo</font>

| Requisito | Por qué | Si no lo tienen |
|---|---|---|
| Un equipo de **3 o 4 personas** | Es el tamaño con el que se diseñaron las actividades | Pueden ser los mismos de GitBasic. Si alguien se queda sin equipo, avísenle al instructor antes de la clase |
| Un **líder** | Su repo de práctica se convierte en el repo del equipo, y es quien configura las reglas en GitHub.com: solo el dueño del repo puede hacerlo | Decídanlo antes de la clase. Conviene que sea quien tenga la instalación más confiable **y quien pueda asistir a todas las sesiones**, que son en días distintos. Si sabe que faltará a una, que avise antes |
| El **usuario de GitHub** de cada integrante | El líder los invita como colaboradores en el Bloque 2 | Compártanlo en el chat del equipo |

**Opcional, pero da ventaja:** el [Reto 5 del Autoestudio 1](../../1-gitbasic/material/autoestudio-1.md#reto-5-opcional--asómate-a-la-terminal-y-a-github-cli) de GitBasic, que te asoma a la terminal antes de llegar.

---

## <font color="#179287">5. La comprobación final</font>

La noche anterior, cada quien:

- [ ] `code --version`, `git --version` y `gh --version` responden.
- [ ] `git config user.name` y `git config user.email` tienen tus datos.
- [ ] `gh auth status` dice que tienes sesión en github.com.
- [ ] GitLens está instalado y no tiene ninguna sesión iniciada.
- [ ] Sabes quién es el líder de tu equipo, y el líder tiene el usuario de GitHub de cada integrante.

---

## <font color="#179287">Si algo sale mal</font>

| Problema | Solución |
|---|---|
| `winget` no se reconoce | Actualiza **App Installer** desde Microsoft Store, o descarga Git desde [git-scm.com](https://git-scm.com/install/) y GitHub CLI desde [cli.github.com](https://cli.github.com/) |
| `git`, `gh` o `code` no se reconocen después de instalar | Cierra y vuelve a abrir la terminal. Si sigue igual, reinicia la sesión de Windows |
| `gh auth status` dice que no tienes sesión | `gh auth login` → GitHub.com → HTTPS → *Login with a web browser* |
| Al hacer commit dice *"Please tell me who you are"* | Configura tu nombre y correo (sección 2) |
| GitLens te pide iniciar sesión o conectar GitHub | Cierra la ventana: no hace falta para nada de la clase |
| No tienes equipo | Avísale al instructor antes de la clase |
