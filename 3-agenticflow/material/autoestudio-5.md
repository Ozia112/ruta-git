<div align="center">

# Autoestudio 5: el ciclo completo, sin red

Etapa 3 del curso de Git · AgenticFlow · En equipo · ~4 horas

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

**Requisito:** haber terminado el [Autoestudio 4](autoestudio-4.md). Su repo tiene `AGENTS.md`, `ESP-01`, `ADR-0001`, la guía de revisión, el registro de riesgos y la página publicada.

## ¿Por qué este autoestudio?

En la sesión recorrieron el ciclo una vez, con alguien guiándolos. Este autoestudio es el ensayo del proyecto final: lo recorren **solos**, de punta a punta, con todo lo que un proyecto real necesita y que la sesión no alcanzó a cubrir:

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

| Lo nuevo | Para qué |
|---|---|
| **Guía por tema** | Que el agente sepa *cómo* se hace algo aquí sin explicárselo en el chat |
| **Documento de despliegue** | Que cualquiera del equipo sepa publicar, comprobar y deshacer |
| **El robot prueba** | Que las comprobaciones corran en cada PR y sean obligatorias, como en GitFlow |
| **Una comprobación escrita antes del código** | Lo que van a hacer con cada especificación de su proyecto |
| **Simulacro de reversa** | Saber que el botón de pánico funciona antes de necesitarlo |
| **Política de documentos** | Que el agente no invente tipos de documento |

---

## Antes de empezar

- [ ] Repartan los papeles: **piloto**, **revisor**, **probador** y **líder**. Que nadie repita el papel que tuvo en el Autoestudio 4.
- [ ] Copien la [plantilla de guía](plantillas/docs/guias/plantilla-guia.md) a `docs/guias/plantilla-guia.md`.
- [ ] Copien [`pruebas/verificar-enlaces.sh`](plantillas/pruebas/verificar-enlaces.sh) con la misma ruta (revisen que diga **LF**).
- [ ] Creen el archivo de notas del equipo para la bitácora.

## Cómo entregar

Todo entra con el ciclo, como en el Autoestudio 4: los PR de documentos llevan su Revisión 1, y el de implementación sus Revisiones 2 y 3. La bitácora va en `docs/soporte/autoestudio-5.md`.

---

## Reto 1 — La guía de estilo

Cuando la misma explicación aparece dos veces en el chat con el agente, merece una guía. La del aspecto de la página es la primera candidata.

Escriban `docs/guias/estilo-visual.md` con la plantilla:

| Sección | Qué poner |
|---|---|
| **Cuándo se usa** | *"Úsala cuando vayas a escribir o cambiar CSS o el aspecto de cualquier página."* |
| **Qué manda** | ADR-0001 manda sobre esta guía. Esta guía manda sobre la costumbre |
| **Las reglas** | Los colores con su código (`#179287`), qué tipografía se usa (las del sistema, por ADR-0001), los tamaños y cómo se ve una tarjeta. Todo con valores, nada de "agradable" o "moderno" |
| **Ejemplos** | Una regla de CSS que cumple y una que no |
| **Lo que no es de esta guía** | Qué contenido lleva la página (eso es ESP-01) |

En el mismo PR:

- **Una sola fuente:** si ESP-01 tenía los colores, quítenlos de ahí y pongan en su lugar `Los colores son los de la [guía de estilo](../guias/estilo-visual.md).`
- En **`AGENTS.md`**, una tabla nueva:

```markdown
## Qué guía aplica

| Vas a... | Lee |
|---|---|
| Revisar o pedir revisión | [Guía de revisión](docs/guias/revision.md) |
| Escribir o cambiar CSS, o el aspecto de una página | [Guía de estilo visual](docs/guias/estilo-visual.md) |
```

Así lo hace **FILEY**: sus instrucciones tienen una tabla *"Vas a… → Skill"*, y una regla debajo: *"Cada hecho vive en **un solo** skill; los demás enlazan. No dupliques contenido entre ellos."* (Algunos agentes llaman *skills* a estas guías y las cargan solos cuando las necesitan. Con cualquier agente funciona la tabla.)

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Cada color está escrito en un solo lugar | `git grep -n "#179287"` (o su color) solo aparece en la guía y en el CSS |
| La guía dice cuándo aplica | Léanle al agente solo la sección **Cuándo se usa** y pregúntenle si aplica para escribir un perfil. Debe decir que no |

---

## Reto 2 — El despliegue, escrito

Copien la [plantilla de despliegue](plantillas/docs/despliegue.md) a `docs/despliegue.md` y llénenla: su dirección, quién despliega, su prueba de humo y cómo se revierte. En el mismo PR:

- devuelvan a la guía de revisión las líneas que mencionan `docs/despliegue.md`, que borraron en la sesión;
- enlacen `docs/despliegue.md` desde `AGENTS.md`, en **Dónde vive cada cosa**.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Alguien que no desplegó en la sesión podría desplegar | Que lo lea en voz alta quien no fue líder: ¿le falta algo? |
| La prueba de humo cabe en dos minutos | Hagan la prueba con la página publicada, con reloj |

---

## Reto 3 — El robot prueba

En GitFlow contrataron un robot que buscaba marcadores de conflicto. Ahora le van a dar trabajo nuevo: correr las comprobaciones en cada PR.

1. Corran primero, en Git Bash, la comprobación de enlaces y corrijan lo que encuentre:

   ```bash
   sh pruebas/verificar-enlaces.sh
   ```

   Revisa cada enlace de todos los `.md` del repo y avisa cuando uno lleva a un archivo que no existe: el mismo problema del `DOCUMENTATION.md` fantasma del Autoestudio 4. **FILEY** tiene un script parecido para su documentación: *"No mira si un documento dice la verdad sobre el código: eso lo hacen las pruebas. Mira las promesas que los propios documentos se hacen entre ellos, que son las que se rompen en silencio al editar uno solo."*

2. Copien el [workflow de comprobaciones](plantillas/.github/workflows/comprobaciones.yml) a `.github/workflows/comprobaciones.yml` y súbanlo por PR. Ese mismo PR es su primera prueba: abajo aparece el check **Comprobaciones del equipo**, corriendo y luego en verde.
3. Cuando se integre, el líder lo hace obligatorio, igual que en el Bloque 5 de GitFlow: **Settings → Rules → Rulesets → proteger-main → Require status checks to pass → Add checks → Comprobaciones del equipo → Save changes**.
4. Agreguen a la sección **Cómo se comprueba** de `AGENTS.md` la línea `sh pruebas/verificar-enlaces.sh   # cada vez que cambies un documento`.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Ningún enlace roto | `sh pruebas/verificar-enlaces.sh` termina sin fallas |
| El robot corre las dos comprobaciones en cada PR | En cualquier PR nuevo aparece **Comprobaciones del equipo** |
| Nada entra sin pasar las comprobaciones | En el ruleset, **Comprobaciones del equipo** está como check obligatorio |

---

## Reto 4 — ESP-02, con el ciclo completo

Ahora sí, el ciclo entero, sin guía paso a paso. Lo nuevo: **la comprobación la escribe el agente, antes del código**, como harán en su proyecto.

**Documentar y Revisión 1.** Escriban **ESP-02**, un **pie de página** para `index.html` con el enlace al repositorio y una línea que diga quién la hizo. Al menos tres criterios comprobables, y uno de ellos:

> Los colores, tamaños y la tipografía del pie de página son los de la guía de estilo visual.

En el mismo PR, pídanle al agente la comprobación:

```text
Lee ESP-02. Escribe pruebas/verificar-pie.sh, en el estilo de
pruebas/verificar-sitio.sh, que compruebe los criterios de ESP-02 que se puedan
comprobar con un script. No toques nada más. Hoy debe fallar, porque el pie de
página no existe todavía.
```

Córranla en Git Bash y peguen en el PR su salida en rojo. La **Revisión 1** revisa también la comprobación: ¿prueba cada criterio que dice probar?, ¿falla hoy?, ¿fallaría si el pie de página estuviera mal? Todavía **no** la agreguen al robot: con el check obligatorio en rojo, este PR no se podría integrar.

**Implementar y Revisión 2.** Issue corto (*"Construir ESP-02"*), rama, plan antes del código, que el agente construya, PR con la plantilla. En ese mismo PR, **una persona** (no el agente) agrega al workflow de comprobaciones el paso que corre `pruebas/verificar-pie.sh`: desde aquí debe estar en verde. El revisor marca la lista de la Revisión 2. Atención: este PR **no debe tocar `pruebas/`**.

**Probar y Revisión 3.** El probador (`gh pr checkout [número]`) corre las dos comprobaciones y revisa a mano lo que no se pudo automatizar, con la tabla de evidencia en el PR. La Revisión 3 la hace alguien que no construyó ni probó.

**Desplegar.** Ahora cada merge a `main` es un despliegue: **Squash and merge** y, enseguida, la prueba de humo de `docs/despliegue.md`, con su comentario en el PR.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| La comprobación existió en rojo antes que el código | Su salida en rojo, pegada en el PR de documentos |
| El robot la corre desde la implementación | En el PR de implementación, el paso del pie de página en verde |
| El agente encontró la guía de estilo sin que se la nombraran | En su plan dice que va a usarla |
| El PR de implementación no tocó `pruebas/` | **Files changed** del PR |
| Tres revisiones, tres personas distintas de quien construyó | Las listas marcadas en los PRs |
| El pie de página está publicado | La prueba de humo y su comentario |

---

## Reto 5 — Simulacro de reversa

El botón de pánico se prueba antes de necesitarlo. Con ESP-02 ya publicada:

1. En el PR de implementación de ESP-02 (ya integrado), botón **Revert**. GitHub crea un PR que lo deshace.
2. Ese PR pasa por la **Revisión 3**: el probador comprueba que la página vuelve a estar como antes y que las comprobaciones de ESP-01 siguen en verde (las de ESP-02 fallan, y es lo esperado: anótenlo).
3. **Squash and merge** y prueba de humo: el pie de página ya no está.
4. Ahora deshagan la reversa: en el PR de la reversa, botón **Revert** otra vez, mismo camino, y prueba de humo: el pie de página volvió.
5. Midan cuánto tardaron de punta a punta y anótenlo en la bitácora y en `docs/despliegue.md`.

> Como el paso del robot para ESP-02 entró en el mismo PR que su código, la reversa se lleva los dos juntos y el robot sigue en verde. Por eso la comprobación automática de una especificación entra al robot **con su implementación**, no antes. Si a ustedes el robot les bloqueó la reversa, anoten por qué en `docs/despliegue.md`: es exactamente lo que conviene saber **antes** de una emergencia.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Una reversa completa, revisada y comprobada | El PR de la reversa, con su Revisión 3 y su prueba de humo |
| `main` nunca se tocó directo | `git log --oneline`: cada línea es un PR con su `(#número)` |
| Saben cuánto tarda | El tiempo, en `docs/despliegue.md` |

---

## Reto 6 — Ningún tipo de documento inventado

En una rama experimento, pídanle al agente:

```text
Documenta la página del equipo.
```

Miren qué creó. ¿Un `DOCUMENTATION.md`? ¿Un `CHANGELOG.md`? ¿Una carpeta nueva? ¿Repitió lo que ya dicen ESP-01 y la guía? Anótenlo y tiren el experimento.

Ahora agreguen a `AGENTS.md`, por PR, una política de documentos:

```markdown
## Qué documentos existen

| Tipo | Dónde | Plantilla |
|---|---|---|
| Especificación | `docs/especificaciones/ESP-NN-...md` | `ESP-00-plantilla.md` |
| Decisión (ADR) | `docs/adr/NNNN-...md` | `0000-plantilla.md` |
| Guía por tema | `docs/guias/...md` | `plantilla-guia.md` |
| Registro de riesgos | `docs/riesgos.md` | - |
| Despliegue | `docs/despliegue.md` | - |

Si crees que hace falta un tipo de documento que no está en esta tabla, pregunta
antes de crearlo: qué es, dónde viviría y qué campos lleva.
```

Repitan el experimento con la misma frase y comparen.

FILEY lo dice así: *"Un artefacto sin frontmatter definido no se inventa. Si vas a crear un tipo de documento que no está en esta sección [...] pregunta qué datos requiere antes de ponerle campos. Un frontmatter improvisado se copia al siguiente documento del mismo tipo antes de que nadie lo revise, y a partir de ahí ya son dos que corregir."*

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Saber qué inventa el agente sin la política | Bitácora: qué archivos creó la primera vez |
| Con la política, el agente pregunta o usa un tipo que existe | La segunda vez, `git status` no muestra tipos de documento nuevos, o el agente preguntó antes |

---

## Entregable — Bitácora del Autoestudio 5

Súbanla en `docs/soporte/autoestudio-5.md`, por PR:

```markdown
# Autoestudio 5 — Equipo [nombre]

## Papeles
- Piloto: · Revisor: · Probador: · Líder:

## Retos completados

- [ ] Reto 1 — Guía de estilo visual (PR #)
- [ ] Reto 2 — Despliegue documentado (PR #)
- [ ] Reto 3 — El robot prueba (PR #)
- [ ] Reto 4 — ESP-02 con el ciclo completo (PR # de documentos, PR # de implementación)
- [ ] Reto 5 — Simulacro de reversa (PR # de la reversa y de su reversa)
- [ ] Reto 6 — Política de documentos (PR #)

## Lo que pasó

### Reto 4: el ciclo sin guía
(Qué se detuvo en cada revisión y por qué. ¿Alguna revisión encontró algo que las anteriores no?)

### Reto 5: la reversa
(Cuánto tardó y qué no sabían antes de hacerla)

### Reto 6: sin política y con política
(Qué creó el agente cada vez)

## Reflexión

**¿Qué revisión les pareció más valiosa, y cuál más tentadora de saltarse? ¿Por qué no deben saltarla?**


**Si su proyecto fuera diez veces más grande, ¿qué parte del ciclo se rompería primero?**


**Una pregunta que les quedó pendiente:**

```
