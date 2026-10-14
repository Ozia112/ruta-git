<div align="center">

# Proyecto final: nuestro proyecto, construido y desplegado

Etapa 3 del curso de Git · AgenticFlow · En equipo · ~12 horas, en dos o tres semanas

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

En la tarea de GitFlow, "Nuestras reglas del juego", eligieron una idea de proyecto y escribieron cómo trabajaría el equipo. En esta etapa aprendieron el ciclo con el que se construye software de calidad junto con un agente:

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

Ahora lo recorren solos, con **su** proyecto, hasta tenerlo **publicado en una dirección que cualquiera puede abrir**. Es lo que van a presentar en la siguiente etapa a un grupo de ingenieros egresados y con experiencia en el sector, que les darán mentoría, consejos y respuestas a sus dudas. Lleguen con algo que funcione, que puedan explicar línea por línea y con preguntas que valga la pena hacerles.

| | |
|---|---|
| **Modalidad** | En equipo (el mismo de la clase) |
| **Tiempo estimado** | ~12 horas de trabajo por equipo, repartidas en dos o tres semanas |
| **Fecha límite** | Antes de la sesión de mentoría (el instructor la confirma) |
| **Acreditación** | Como en GitFlow, la entrega completa, **incluido el video**, es obligatoria para acreditar los puntos de formación integral del programa |

---

## <font color="#179287">Qué hay que hacer</font>

1. **Recortar la idea a lo mínimo que alguien pueda usar.** Retomen la idea de "Nuestras reglas del juego" (o elijan otra) y quédense con su versión más pequeña útil: **de 2 a 4 especificaciones**. Lo que quede fuera se escribe también: es lo primero que los mentores van a preguntar.
2. **Crear el repositorio con GitFlow.** El líder lo publica, invita al equipo y configura las reglas de `main` que aprendieron (PR con una aprobación, historia lineal, solo squash, borrar ramas al integrar), con las plantillas de issue y de PR.
3. **Decidir dónde se despliega, en un ADR.** Si su proyecto puede ser un sitio sin servidor (HTML, CSS y JavaScript), GitHub Pages es lo más simple. Si necesita servidor o base de datos, elijan un servicio que despliegue desde GitHub y tenga plan gratuito, y revisen sus condiciones vigentes. Es una decisión cara de revertir: por eso va en un ADR.
4. **Documentar antes de construir**, con su Revisión 1: los documentos del contenido mínimo (abajo) y la comprobación de cada especificación, en rojo.
5. **Entrevistar al agente** antes de construir la primera especificación:

   ```text
   Lee AGENTS.md y todo lo que enlaza. No escribas código. Antes de construir
   ESP-01, ¿qué preguntas tendrías que hacernos? Para cada una, dime qué
   decidirías tú si no te respondiéramos.
   ```

   Respondan cada pregunta **en el documento que le toca**, por PR, nunca solo en el chat. Repitan hasta que las preguntas sean de detalle y no de decisiones.
6. **Construir cada especificación con el ciclo completo:** implementar → Revisión 2 → probar → Revisión 3 → desplegar. **Una especificación por PR.**
7. **Poner al robot a probar:** que el workflow de comprobaciones corra las pruebas del proyecto en cada PR y sea un check obligatorio en las reglas de `main`.
8. **Desplegar y ensayar una reversa:** la prueba de humo después de cada despliegue y, al menos una vez, un **Revert** completo, para saber que funciona antes de necesitarlo.
9. **Preparar la mentoría:** `docs/mentoria.md` y un video corto que es su ensayo general.

---

## <font color="#179287">Contenido mínimo</font>

| Qué | Mínimo | Lo que debe demostrar |
|---|---|---|
| `README.md` | Qué es, para quién, la dirección publicada y cómo correrlo en local | Que alguien de fuera entiende el proyecto en un minuto |
| `AGENTS.md` | Las secciones de la [plantilla](plantillas/plantilla-AGENTS.md), más **Qué guía aplica**, **Reglas que vienen de una decisión** y **Qué documentos existen** | Que es un mapa: dice dónde está cada cosa y enlaza, sin repetir |
| Glosario | `docs/glosario.md`, al menos **5 términos** | Las palabras que en su proyecto significan algo preciso |
| ADR | Al menos **2**, uno de ellos sobre dónde y cómo se despliega | Al menos dos opciones reales cada uno, y qué queda desactualizado |
| Especificaciones | **De 2 a 4**, las del producto mínimo, con la [plantilla](plantillas/docs/especificaciones/ESP-00-plantilla.md) | Criterios que dicen cómo se comprueban; criterios de seguridad y privacidad si reciben datos de usuarios; **Fuera de alcance** |
| Comprobaciones | Una por especificación, más [`verificar-enlaces.sh`](plantillas/pruebas/verificar-enlaces.sh) | Que existen **antes** que el código. Pueden ser scripts como `verificar-sitio.sh` o pruebas en el lenguaje del proyecto. Entran con su especificación, en rojo y corridas a mano (si el agente las escribe, la Revisión 1 revisa que prueben los criterios), y al robot con su implementación, ya en verde, como en el Reto 4 del Autoestudio 5. Lo que no se puede automatizar va en la lista *A mano* de la especificación |
| Revisión | La [guía de revisión](plantillas/docs/guias/revision.md) y la [plantilla de PR](plantillas/.github/pull_request_template.md) | Cada PR de implementación con sus **tres revisiones registradas**, hechas por personas distintas de quien construyó |
| Guía por tema | Al menos **1**, además de la de revisión | Reglas con valores concretos y cuándo aplica |
| Registro de riesgos | `docs/riesgos.md`, desde la [plantilla](plantillas/docs/riesgos.md), con al menos **3 riesgos propios** del proyecto | Que saben qué puede salir mal con su proyecto y en qué momento lo previenen |
| Despliegue | `docs/despliegue.md`, desde la [plantilla](plantillas/docs/despliegue.md) | Dirección, quién despliega, prueba de humo y cómo se revierte |
| Robot | `.github/workflows/comprobaciones.yml`, adaptado: sin el paso de la página del equipo y con las pruebas de su proyecto. Obligatorio en las reglas de `main` | Que nada entra sin pasar las comprobaciones |
| Bitácora | `docs/soporte/bitacora-del-proyecto.md` | Las preguntas de la entrevista al agente, **cada error del agente y la línea que agregaron por él**, y el ensayo de reversa |
| Paquete de mentoría | `docs/mentoria.md` (abajo) | Que están listos para aprovechar a los mentores |

---

## <font color="#179287">El paquete de mentoría</font>

Los mentores van a tener poco tiempo. `docs/mentoria.md` es lo que leen antes de hablar con ustedes:

```markdown
# [Nombre del proyecto] · Equipo [nombre]

**Dirección publicada:** https://...
**Repositorio:** https://github.com/...
**Video:** https://...

## Qué es y para quién
(Dos párrafos)

## Lo que construimos y lo que dejamos fuera
(Las especificaciones del producto mínimo, con su estado, y lo que quedó fuera a propósito)

## Cómo lo construimos
(El ciclo, cuántas especificaciones y PRs, y el enlace a un PR que muestre sus tres revisiones)

## Decisiones
(Enlaces a los ADR, con una línea cada uno)

## Riesgos que encontramos y cómo los mitigamos
(Los más importantes del registro de riesgos y de la bitácora: qué pasó, en qué momento lo detectamos y qué línea agregamos)

## Lo que salió mal y lo que aprendimos

## Lo que haríamos después

## Preguntas para los mentores
(De 3 a 5, concretas: sobre decisiones que no supieron cerrar, sobre cómo se hace esto en un trabajo real, sobre lo que harían distinto)
```

---

## <font color="#179287">Reglas de la entrega</font>

- **Todo entra por el ciclo y por GitFlow:** issue, rama, PR, las revisiones que le tocan y **Squash and merge**. El historial del repo es la prueba de cómo trabajaron.
- **Una especificación por PR.** Si un PR no se puede revisar en una sentada (como referencia, unas 400 líneas cambiadas), son dos especificaciones.
- **Quien construye no prueba ni aprueba su propio trabajo.** Los papeles rotan: cada integrante es piloto al menos una vez, y revisor o probador al menos una vez.
- **Ningún secreto ni dato personal real en el repositorio.** Si su proyecto maneja datos de personas, usen datos inventados.
- **El agente puede escribir borradores de cualquier cosa, pero cada línea la decide el equipo.** En la mentoría, cualquiera de ustedes debe poder explicar cualquier archivo y por qué está ahí.
- **Video:** de 5 a 10 minutos, con todos los integrantes. Es el ensayo de la mentoría: el proyecto funcionando en su dirección publicada, un PR recorrido con sus tres revisiones y un riesgo que mitigaron a tiempo, contado de principio a fin.
- **Qué se entrega:** el enlace al repositorio, la dirección publicada y el enlace al video, los tres en `docs/mentoria.md`.

---

## <font color="#179287">Distribución sugerida de las ~12 horas</font>

| Actividad | Tiempo |
|---|---|
| Recortar al producto mínimo, crear el repo y configurar sus reglas | 1 h |
| Documentar con su Revisión 1: `AGENTS.md`, glosario, ADR, especificaciones, comprobaciones, riesgos y despliegue | 3 h |
| Entrevista al agente y correcciones | 30 min |
| Construir de 2 a 4 especificaciones con el ciclo completo | 5 h |
| Despliegue, prueba de humo y ensayo de reversa | 1 h |
| Paquete de mentoría y video | 1 h 30 min |

---

## <font color="#179287">Listos para la mentoría</font>

Antes de entregar, todo esto debe ser verdad:

- [ ] La dirección publicada abre y pasa la prueba de humo.
- [ ] Cada especificación del producto mínimo dice `estado: construida`.
- [ ] Cada PR de implementación tiene sus tres revisiones registradas, por personas distintas de quien lo construyó.
- [ ] El robot corre las comprobaciones en cada PR y es obligatorio en las reglas de `main`.
- [ ] `sh pruebas/verificar-enlaces.sh` termina sin fallas.
- [ ] El registro de riesgos tiene al menos tres riesgos propios, con su momento.
- [ ] Ensayaron una reversa completa y está en la bitácora.
- [ ] Ningún secreto ni dato personal real en el repositorio.
- [ ] Cualquier integrante puede explicar cualquier archivo.
- [ ] `docs/mentoria.md` está completo, con sus preguntas para los mentores.
