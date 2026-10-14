<div align="center">

# Autoestudio 2: los botones que faltaban

Etapa 2 del curso de Git · GitFlow · Individual · ~2 horas

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

**Requisito:** haber terminado el Bloque 1 de GitFlow. Tienes la carpeta `practica-terminal` con un repo creado con `git init`, al menos dos commits y la rama `prueba`. Si en clase no alcanzaron a crear la rama, créala ahora: `git switch -c prueba`, un cambio en `notas.md`, un commit y `git switch main`.

## ¿Por qué este autoestudio?

En GitBasic usaste botones de GitHub Desktop que en la clase de GitFlow no se vuelven a practicar con comandos. Todos son útiles y todos tienen su comando. Aquí los practicas en tu `practica-terminal`, el repo que es solo tuyo: no tiene origin, nadie más lo ve y equivocarte no cuesta nada.

| Botón en GitHub Desktop | Comando | Reto |
|---|---|---|
| Branch → Merge into Current Branch | `git merge rama` | 1 |
| Discard changes | `git restore archivo` | 2, misión A |
| Undo commit | `git reset --soft HEAD~1` | 2, misión B |
| Revert commit | `git revert hash` | 2, misión C |
| Abort merge | `git merge --abort` | 2, misión D |
| Stash changes and switch branch | `git stash` | 3 (opcional) |
| Fork | `gh repo fork` | 4 (opcional) |

> Es la misma idea del [Autoestudio 1](../../1-gitbasic/material/autoestudio-1.md) de GitBasic, *"rómpelo y arréglalo"*, pero ahora sin botones: el botón solo ejecutaba un comando.

---

## Antes de empezar

- [ ] Abre `practica-terminal` en VS Code (`File` → `Open Folder`) y su terminal integrada (`` Ctrl+` ``).
- [ ] `git status` no muestra nada pendiente.
- [ ] `git log --oneline --graph --all` muestra tus commits y la rama `prueba`.
- [ ] Crea en la carpeta un archivo `bitacora.md` para ir anotando lo que pasa (la plantilla está al final).

> **Si eres líder:** tu `practica-terminal` se convirtió en el repo del equipo en el Bloque 2. Haz este autoestudio en una carpeta nueva, por ejemplo `practica-autoestudio`, con `git init`, dos commits a `notas.md` y una rama `prueba` con un commit, como en el Bloque 1.

> Si en tu `practica-terminal` la rama principal se llama `master` en lugar de `main`, usa `master` donde este documento diga `main`.

## Cómo entregar

Tu `practica-terminal` se queda en tu compu. Cuando termines, entrega la bitácora en el **repo del equipo**, con el ritual completo: issue, rama, PR revisado por un compañero y **Squash and merge**. Va en `docs/soporte/autoestudio-2/[tu-nombre].md`.

> Si en la clase todavía no llegan al Bloque 4 (el primer Pull Request), puedes hacer los retos desde ya y entregar la bitácora después de ese bloque.

---

## Reto 1 — Unir ramas con `merge`

En clase, las ramas entran a `main` con un Pull Request. En tu repo de práctica no hay GitHub: las unes tú, como con el botón *Merge into Current Branch*.

**Parte A — Cuando `main` no se movió: fast-forward**

```bash
git switch main
git merge prueba
git log --oneline --graph --all
```

La terminal responde **Fast-forward**: `main` solo avanzó hasta donde estaba `prueba`. En la Graph no aparece ningún nudo.

**Parte B — Cuando las dos ramas avanzaron: merge commit**

```bash
git switch -c tema-a
# agrega una línea al final de notas.md y guarda
git add notas.md
git commit -m "docs: agrego una idea en notas"

git switch main
# crea un archivo nuevo ideas.md con cualquier texto y guarda
git add ideas.md
git commit -m "docs: agrego ideas"

git merge tema-a
```

Esta vez Git abre un editor para el mensaje del **merge commit**. No cambies nada: si se abre como pestaña de VS Code, ciérrala; si se abre dentro de la terminal, escribe `:wq` y Enter (como el `rebase --continue` del Bloque 7).

```bash
git log --oneline --graph --all
```

Ahora sí hay un nudo: un commit con dos padres.

> **Por qué en el repo del equipo no hacemos esto:** cada merge commit es un nudo en la historia. Con cuatro personas y muchos PRs, la historia se vuelve difícil de leer. Por eso en el Bloque 6 usamos rebase para ponernos al día y squash para integrar.

**Autoverificación:**

| Debiste lograr | Cómo lo confirmas |
|---|---|
| Un merge fast-forward | En la parte A, la terminal dijo *Fast-forward* y no hubo nudo |
| Un merge commit | En la parte B, `git log --oneline --graph` muestra un nudo y un commit *"Merge branch 'tema-a'"* |
| Saber cuándo pasa cada uno | Lo explicas en una línea en tu bitácora |

---

## Reto 2 — Rómpelo y arréglalo, con comandos

Cada misión provoca un problema común **a propósito** y lo arregla con el comando del botón que usabas en GitBasic. Anota en tu bitácora qué hiciste y qué pasó, en 2 o 3 líneas por misión.

### Misión A — Descartar cambios que no quieres (*Discard changes*)

1. Escribe texto sin sentido en `notas.md` y guarda, sin hacer commit.
2. `git status` y `git diff`: el cambio está ahí.
3. Descártalo:

   ```bash
   git restore notas.md
   ```

4. `git status`: ya no hay nada pendiente, y el archivo volvió a como estaba.

**Variante:** si ya habías hecho `git add`, primero quítalo de lo preparado con `git restore --staged notas.md` y luego descártalo con `git restore notas.md`.

**Lo que aprendiste:** mientras no hagas commit, Git no recuerda el cambio. `restore` lo tira sin dejar rastro, así que úsalo solo cuando de verdad no lo quieras.

### Misión B — Deshacer un commit recién hecho (*Undo commit*)

1. Cambia algo en `notas.md` y haz un commit con un mensaje absurdo: `git commit -am "asdkjaskjd"`.
2. Deshazlo:

   ```bash
   git reset --soft HEAD~1
   ```

3. `git log --oneline`: el commit desapareció. `git status`: tus cambios siguen ahí, listos para un commit nuevo.
4. Haz el commit otra vez, ahora con un mensaje que se entienda.

**Lo que aprendiste:** `HEAD~1` significa *"un commit antes de donde estoy"*. `reset --soft` regresa ahí y conserva tus cambios. Es pariente del `commit --amend` del Bloque 6: los dos reescriben historia, así que solo se usan con commits **que no has subido**.

### Misión C — Revertir un commit (*Revert commit*)

1. Haz un cambio real en `ideas.md` y un commit.
2. Revierte ese commit:

   ```bash
   git revert HEAD
   ```

   Git abre el editor con el mensaje *"Revert ..."*: ciérralo sin cambiar nada.
3. `git log --oneline`: están **los dos** commits, el original y el que lo deshace. El archivo volvió a como estaba antes.

**Lo que aprendiste:** `revert` no borra historia: agrega un commit que anula a otro. Por eso es la única forma segura de deshacer algo que ya está compartido. En el repo del equipo se hace en una rama nueva y entra por PR, como dice el acordeón.

### Misión D — Provócate un conflicto, abórtalo y resuélvelo (*Abort merge*)

1. Prepara el choque, cambiando **la misma línea** de `notas.md` en dos ramas:

   ```bash
   git switch -c choque
   # cambia la PRIMERA línea de notas.md, guarda y:
   git commit -am "docs: título desde choque"

   git switch main
   # cambia la MISMA primera línea, con otro texto, guarda y:
   git commit -am "docs: título desde main"

   git merge choque
   ```

2. La terminal responde **CONFLICT**. `git status` te dice qué archivo está en conflicto.
3. **Aborta:**

   ```bash
   git merge --abort
   git status
   ```

   Todo volvió a como estaba antes del merge. Es el botón de pánico, como el `rebase --abort` del Bloque 7.
4. Ahora sí, **resuélvelo**: vuelve a escribir `git merge choque`, abre `notas.md` en VS Code y elige con los botones **Accept Current**, **Accept Incoming** o **Accept Both**, o escribe a mano la versión que quieras. Quita todas las marcas y guarda.
5. Termina el merge:

   ```bash
   git add notas.md
   git commit
   ```

   Se abre el editor con el mensaje del merge: ciérralo sin cambiar nada.

**Lo que aprendiste:** en un **merge**, *Current* es la rama donde estás (`main`) e *Incoming* es la que estás trayendo (`choque`). En el **rebase** del Bloque 7 se sentían al revés, porque tu commit era el que se volvía a pegar. Y un merge con conflicto se termina con `git commit`, no con `--continue`.

### Misión E (opcional) — Borra tu copia del equipo y vuelve a clonarla

Solo si ya existe el repo del equipo **y** no tienes nada sin subir: `git status` dice *up to date* y `git branch` solo muestra `main`.

1. Cierra esa carpeta en VS Code y bórrala con el Explorador de archivos.
2. En la terminal, desde el Escritorio: `gh repo clone usuario-del-lider/equipo-[nombre]`.
3. `git log --oneline`: toda la historia sigue ahí.

**Lo que aprendiste:** lo que está en origin no depende de tu compu. Es la salida más segura cuando te pierdes en tu copia del equipo.

---

## Reto 3 (opcional) — Guardar cambios sin commit (*Stash*)

Cuando tienes cambios a medias y necesitas cambiarte de rama sin llevártelos ni perderlos:

```bash
# cambia algo en notas.md, sin commit
git stash              # guarda los cambios aparte y deja la carpeta limpia
git status             # no hay nada pendiente
git switch prueba
git switch main
git stash list         # ahí está tu cambio guardado
git stash pop          # lo trae de vuelta y lo quita de la lista
```

**Lo que aprendiste:** `stash` es el botón *Stash changes* de GitHub Desktop. Úsalo para pausas cortas; si el cambio vale la pena, lo correcto es una rama y un commit.

---

## Reto 4 (opcional) — Fork desde la terminal

Si en GitBasic hiciste fork con el botón, este es su comando. Crea en tu cuenta una copia del repositorio de práctica de GitHub y la clona:

```bash
cd ..
gh repo fork octocat/Spoon-Knife --clone
```

Revisa en tu cuenta de GitHub que apareció `tu-usuario/Spoon-Knife`. Si no quieres conservarlo, lo borras en **Settings → Danger Zone** de ese repo.

---

## Entregable — Bitácora del Autoestudio 2

Entrégala en el repo del equipo como `docs/soporte/autoestudio-2/[tu-nombre].md`, por PR:

````markdown
# Autoestudio 2 — [tu nombre]

## Retos completados

- [ ] Reto 1A — Merge fast-forward
- [ ] Reto 1B — Merge commit
- [ ] Reto 2A — Discard con `git restore`
- [ ] Reto 2B — Undo con `git reset --soft HEAD~1`
- [ ] Reto 2C — Revert con `git revert`
- [ ] Reto 2D — Conflicto: abortado y resuelto
- [ ] Reto 2E (opcional) — Borrar y volver a clonar
- [ ] Reto 3 (opcional) — Stash
- [ ] Reto 4 (opcional) — Fork

## Del botón al comando

| Botón de GitHub Desktop | Comando que usé | Qué pasó |
|---|---|---|
| Merge into Current Branch | | |
| Discard changes | | |
| Undo commit | | |
| Revert commit | | |
| Abort merge | | |

## Mi historial

(Pega aquí la salida de `git log --oneline --graph --all` de tu practica-terminal, dentro de un bloque de código)

## Reflexión

**¿Qué comando te dio más miedo antes de usarlo, y por qué ya no?**


**¿Qué diferencia notaste entre resolver un conflicto en un merge (Misión D) y en un rebase (Bloque 7)?**


**Una pregunta que te quedó pendiente:**

````
