<div align="center">

# Autoestudio 4: decisiones y riesgos

Etapa 3 del curso de Git · AgenticFlow · En equipo · ~3 horas y media

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

**Requisito:** haber tomado la sesión de AgenticFlow. Su repo tiene en `main` `AGENTS.md`, `ESP-01`, la guía de revisión y la página del equipo publicada.

## ¿Por qué este autoestudio?

En la sesión vieron los riesgos de trabajar con un agente y recorrieron el ciclo una vez. Aquí van a trabajar dos cosas que la sesión dejó abiertas:

- **Las decisiones.** En ESP-01 escribieron que la página no descarga nada de otros sitios. Esa decisión protege a ESP-01 y a nada más: si mañana le piden al agente otra página, nada se lo recuerda. Y aunque se lo recuerde, el agente no sabe **por qué**: una regla sin porqué se rompe en cuanto el agente encuentra una buena razón para romperla.
- **Los riesgos.** Cada riesgo de trabajar con un agente tiene un momento en el que prevenirlo cuesta poco. Van a escribir el registro de riesgos de su equipo, con ese momento.

| Documento | Responde | Riesgos que mitiga |
|---|---|---|
| **ADR** (registro de decisión) | ¿Por qué se decidió así, y qué se descartó? | Decide solo (R2), dependencias que nadie decidió (R9) |
| **Aviso "no lo arregles"** | ¿Qué parece un error y no lo es? | Hace de más (R5) |
| **Registro de riesgos** | ¿Qué puede salir mal, cómo se nota y cuándo se previene? | Todos |

---

## Antes de empezar

- [ ] Si en la sesión no terminaron el **Bloque 5**, termínenlo primero: la página tiene que estar publicada.
- [ ] Repartan los papeles de este autoestudio: **piloto**, **revisor**, **probador** y **líder**. Que no repitan los de la sesión.
- [ ] Copien la [plantilla de ADR](plantillas/docs/adr/0000-plantilla.md) a `docs/adr/0000-plantilla.md`.
- [ ] Creen el archivo de notas del equipo para la bitácora (ver el final). No lo suban todavía.

## Cómo entregar

Todo lo que cambie en `main` entra con el ciclo: issue, rama, PR, **la revisión que le toca** según la [guía de revisión](plantillas/docs/guias/revision.md) y **Squash and merge**. Los PR de este autoestudio son de documentos, así que llevan su **Revisión 1**, con la lista marcada en el PR. Al final suben la bitácora en `docs/soporte/autoestudio-4.md`, también por PR.

---

## Reto 1 — La provocación

Van a pedirle al agente algo que **ninguna especificación cubre**, en una rama que nunca sale de su compu:

```bash
git switch main
git pull
git switch -c experimento/sin-adr
```

```text
Crea una segunda página, recomendaciones.html, donde cada integrante pueda
recomendar un libro, un video o un curso. Que se vea moderna y profesional.
```

Cuando termine:

1. `git status`: ¿qué archivos creó o cambió?
2. `sh pruebas/verificar-sitio.sh`, en Git Bash: ¿la sección 4 encontró algo descargado de fuera?
3. Pregúntenle:

   ```text
   ¿Por qué no deberías usar frameworks ni fuentes de otros sitios en este
   repositorio? Responde solo con lo que esté escrito en el repo.
   ```

4. Anoten en la bitácora qué usó y qué respondió. Después tiren el experimento:

```bash
git add .
git commit -m "experimento: sin ADR"
git switch main
git branch -D experimento/sin-adr
```

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Saber si el agente descargó algo de fuera en la página nueva | La sección 4 de la comprobación, o buscar `http` en los `<link>` y `<script>` de `recomendaciones.html` |
| Saber si el agente conoce el porqué de la regla | Su respuesta a la pregunta 3: ¿citó un documento o se inventó una razón? |

> Pase lo que pase, el resultado sirve. Si usó algo de fuera, la regla no lo alcanzó. Si no lo usó pero no supo explicar por qué, la regla está escrita sin su porqué y la va a romper la primera vez que tenga una buena razón.

---

## Reto 2 — El ADR

Escriban `docs/adr/0001-la-pagina-no-depende-de-nada-externo.md` con la plantilla. La decisión ya la tomaron en ESP-01; ahora escriben **por qué**.

| Sección | Qué poner |
|---|---|
| **Contexto** | El problema, sin decir la solución: ¿qué pasa si la página depende de otros sitios? Piensen en qué pasa si ese sitio cambia o se cae, en quién se entera de quién visita su página y en qué pasaría con un trabajo que se entrega dentro de un año |
| **Opciones consideradas** | Al menos tres con argumentos reales: un framework desde un CDN, descargar el framework al repo, o CSS propio |
| **Decisión** | Una o dos frases que un agente pueda obedecer |
| **Consecuencias** | Lo que se gana, lo que se pierde y **la excepción**: las fotos de GitHub |
| **Qué queda desactualizado** | ESP-01 y `AGENTS.md`. Se corrigen **en el mismo PR** |

En el mismo PR:

- En **ESP-01**, la decisión ya no se repite: se cambia por *"No se descarga nada de otros sitios (ADR-0001)"*.
- En **`AGENTS.md`**, una sección nueva:

```markdown
## Reglas que vienen de una decisión

No se contradicen sin escribir un ADR nuevo que reemplace al anterior.

| Regla | Por qué |
|---|---|
| Nada se descarga de otros sitios, salvo las fotos de GitHub | [ADR-0001](docs/adr/0001-la-pagina-no-depende-de-nada-externo.md) |
```

Así lo hace **FILEY**, un sistema de la UADY construido con agentes. Sus instrucciones empiezan las reglas de arquitectura así: *"Vienen de los ADR y no se contradicen sin escribir uno nuevo."* Y su carpeta de ADR explica para qué sirven: *"Es la forma más barata de que un agente de IA respete la arquitectura. Un `CLAUDE.md` puede decir 'sigue la arquitectura decidida'; el ADR es el documento que explica cuál es y por qué, para que la regla no sea arbitraria ni para el agente ni para quien la lee."*

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Un ADR con al menos tres opciones reales | Cada opción tiene algo a favor que alguien defendería de verdad |
| La regla vive en un solo lugar | ESP-01 y `AGENTS.md` enlazan al ADR y no repiten su argumento |
| Todo entró en un solo PR, con su Revisión 1 | En el PR, **Files changed** muestra el ADR, ESP-01 y `AGENTS.md` juntos, y la lista de la Revisión 1 está marcada |

---

## Reto 3 — El aviso "no lo arregles"

Un agente que encuentra algo raro lo "arregla". Pídanle, en una rama nueva (`feature/[número]-revision-adr-0001`):

```text
Revisa que todo el repositorio cumpla ADR-0001 al pie de la letra y corrige
lo que no cumpla.
```

Miren qué hizo con **las fotos**: ¿las descargó al repo? ¿Las quitó? ¿Las dejó? Si las tocó, descarten el cambio (`git restore .`).

Las fotos vienen de GitHub **a propósito**: así cada integrante cambia su foto en GitHub y la página se actualiza sola. Eso es justo lo que parece un error y no lo es. Agreguen a `AGENTS.md`:

```markdown
## Lo que parece un error y no lo es

> **Las fotos vienen de github.com a propósito.** Es la única excepción de
> ADR-0001: así cada integrante cambia su foto en GitHub y la página se actualiza
> sola. No las descargues al repositorio ni las quites.
```

Hagan commit del aviso, pídanle lo mismo otra vez y comparen. El aviso entra por PR con su Revisión 1.

FILEY tiene 60 avisos en sus instrucciones. Uno de ellos empieza: *"Cuatro cosas de la configuración de `s3` se leen como errores. No las «arregles». Están en `config/settings.py` con su porqué y las sostiene [una prueba], porque las cuatro fallan de una forma que no apunta a su causa."*

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Ver qué hace el agente con una excepción que no está escrita | Bitácora: qué hizo con las fotos la primera vez |
| Un aviso que dice qué, por qué y qué no hacer | Léanlo sin contexto: ¿alguien nuevo entendería por qué no se toca? |
| El agente respeta la excepción con el aviso | La segunda vez, `git status` no muestra cambios en las fotos |

---

## Reto 4 — La provocación, otra vez

Repitan el Reto 1 exactamente igual, con la misma frase y en una rama experimento nueva. Comparen en la bitácora:

| | Sin ADR (Reto 1) | Con ADR y aviso (Reto 4) |
|---|---|---|
| ¿Descargó algo de fuera? | | |
| ¿Supo explicar por qué no debía? | | |
| ¿Citó algún documento? ¿Cuál? | | |
| ¿Tocó las fotos? | | |

Tiren el experimento igual que en el Reto 1.

---

## Reto 5 — Auditoría de afirmaciones

Este fragmento es real. Viene del README de un proyecto construido casi por completo con IA:

```markdown
- 🧪 **100% Testeado**: Suite completa de tests automatizados
- 🏗️ **Arquitectura MVC**: Código limpio, mantenible y extensible

### Cobertura Actual

- ✅ **Modelo**: 95% (15 tests)
- ✅ **Controlador**: 90% (10 tests)
- ✅ **Parámetros**: 100% (8 tests)
- ✅ **Backend**: 95% (5 tests)

### ✨ Refactorización MVC Completa

- Acoplamiento reducido en 70%
- Testabilidad aumentada en 850%

| **[📚 DOCUMENTATION.md](docs/DOCUMENTATION.md)** | Guía completa del sistema |
```

1. Hagan una lista de cada afirmación y, al lado, cómo la comprobarían. ¿Cuáles **no se pueden** comprobar con nada?
2. Lo que había en ese repositorio: **4 pruebas**, no 38. `DOCUMENTATION.md` **nunca existió**. Ninguna de las dos cifras de la refactorización tenía una medición detrás. Un agente que leyera ese README lo creería todo, y una persona que lo leyera sin comprobar, también. Son los riesgos **R1** (inventa) y **R3** ("listo" sin evidencia).
3. Ahora hagan lo mismo con **sus** documentos: `AGENTS.md`, ESP-01, ADR-0001 y la guía de revisión. Cada afirmación, con su "¿cómo lo sé?". Lo que no se pueda comprobar se corrige o se borra, por PR con Revisión 1.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| La lista del fragmento, con el "¿cómo lo sé?" de cada afirmación | En la bitácora |
| Sus documentos sin afirmaciones que no se puedan comprobar | Un PR de corrección, o una línea en la bitácora que diga por qué no hizo falta |

---

## Reto 6 — El registro de riesgos del equipo

Copien el [registro de riesgos](plantillas/docs/riesgos.md) a `docs/riesgos.md`. Ya trae los quince riesgos generales de trabajar con un agente, cada uno con su señal, su mitigación y **su momento**.

1. Para cada riesgo, decidan si aplica a su repo. Borren los que de verdad no apliquen y ajusten las mitigaciones a lo que ustedes hacen.
2. Marquen en la bitácora cuáles **ya vieron pasar**: en el Bloque 1 de la sesión, en el Reto 1 o en el Reto 3 de este autoestudio.
3. Agreguen **al menos dos riesgos propios** de su página (por ejemplo: un perfil con datos que alguien no quería publicar, o una foto que deja de existir).
4. Enlacen el registro desde `AGENTS.md` y devuelvan a la guía de revisión la línea de `docs/riesgos.md` que borraron en la sesión: ahora sí es verdad.

> **El momento importa tanto como la mitigación.** Un riesgo prevenido con una línea en un documento no cuesta nada. El mismo riesgo, encontrado en producción, cuesta una reversa y la confianza de quien lo vio.

**Autoverificación:**

| Debieron lograr | Cómo lo confirman |
|---|---|
| Un registro que habla de su repo, no de cualquiera | Cada fila dice algo que ustedes hacen o revisan |
| Al menos dos riesgos propios, con su momento | La tabla *Riesgos propios de este proyecto* |
| Ningún enlace roto | `AGENTS.md` y la guía de revisión llevan a `docs/riesgos.md` |

---

## Reto 7 (opcional) — Cambiar de opinión sin dejar reglas viejas

Una decisión puede cambiar. Lo que no puede pasar es que cambie en un documento y se quede igual en otro: durante ese tiempo, el agente obedece la regla vieja. En FILEY pasó: un ADR retiró una regla el 29 de agosto y una de sus guías la siguió enunciando hasta el 3 de septiembre.

Imaginen que el equipo quiere una tipografía especial. Escriban `ADR-0002`, que permite **una** fuente guardada dentro del repo (nunca desde un CDN). En el mismo PR:

- En ADR-0001, `reemplazado_por: ADR-0002` si lo reemplaza completo, o una nota que diga qué parte cambió.
- La tabla de reglas de `AGENTS.md`, ESP-01 y cualquier otro documento que lo mencione.

**Autoverificación:** busquen en todo el repo la regla vieja (`git grep -n "fuentes"`). No debe quedar ningún documento que la siga enunciando como vigente.

---

## Entregable — Bitácora del Autoestudio 4

Súbanla en `docs/soporte/autoestudio-4.md`, por PR:

```markdown
# Autoestudio 4 — Equipo [nombre]

## Papeles
- Piloto: · Revisor: · Probador: · Líder:

## Retos completados

- [ ] Reto 1 — La provocación
- [ ] Reto 2 — ADR-0001 (PR #)
- [ ] Reto 3 — El aviso "no lo arregles" (PR #)
- [ ] Reto 4 — La provocación, otra vez
- [ ] Reto 5 — Auditoría de afirmaciones (PR # si hubo correcciones)
- [ ] Reto 6 — Registro de riesgos (PR #)
- [ ] Reto 7 (opcional) — ADR-0002 (PR #)

## Lo que pasó

### Reto 1: sin ADR
(Qué pidió, qué usó y qué respondió el agente a la pregunta del porqué)

### Reto 3: las fotos
(Qué hizo la primera vez y qué hizo con el aviso)

### Reto 4: la comparación
(La tabla del Reto 4)

### Reto 6: los riesgos que ya vimos pasar
(Cuáles, dónde y en qué momento se habrían podido prevenir)

## Reflexión

**¿Qué decisión de su equipo, que hoy solo vive en la cabeza de alguien, merecería un ADR?**


**¿Qué riesgo les parece el más peligroso para el proyecto que van a construir, y en qué momento lo van a prevenir?**


**Una pregunta que les quedó pendiente:**

```
