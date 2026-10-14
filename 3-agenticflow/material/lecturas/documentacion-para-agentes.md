<div align="center">

# Construir software con agentes: lo que enseñan tres proyectos reales

Etapa 3 del curso de Git · AgenticFlow · Lectura de apoyo

<br>

<img src="../../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

Esta lectura acompaña a la sesión, a los autoestudios y al proyecto final. Cuenta qué pasó en tres proyectos reales construidos con agentes de IA: qué documentos hicieron la diferencia, cómo se organizó (o no) la revisión, qué riesgos aparecieron y en qué momento convenía prevenirlos. Los dos primeros se presentan sin nombre (**Proyecto A** y **Proyecto B**); el tercero es **FILEY**, el sistema de registro de la Feria Internacional de la Lectura Yucatán.

---

## <font color="#179287">1. El lector que no recuerda</font>

Cuando escribes para una persona, cuentas con que va a preguntar lo que no entienda, va a recordar lo que le dijiste ayer y va a desconfiar de algo que suena raro. Un agente de código no hace ninguna de las tres cosas:

| Una persona del equipo | Un agente de código |
|---|---|
| Pregunta cuando algo no está claro | Decide solo, y casi nunca dice que decidió |
| Recuerda lo que acordaron la semana pasada | Empieza cada sesión sin memoria: solo sabe lo que lee en ese momento |
| Desconfía de un documento que suena raro | Cree lo que lee, con la misma seguridad sea verdad o no |
| Se cansa y escribe poco | Escribe en minutos lo que al equipo le tomaría días |

De ahí salen las tres ideas que sostienen toda la etapa:

- **Lo que no está escrito, el agente lo inventa.** No por malicia: necesita una respuesta para seguir y la elige él.
- **Lo que está escrito, el agente lo obedece, aunque sea falso.** Un documento que miente es peor que no tener documento.
- **El agente escribe más rápido de lo que nadie puede revisar.** Sin un proceso que lo ordene, esa velocidad es caos; con uno, es capacidad.

Por eso la pregunta que acompaña a cada documento y a cada respuesta del agente es la misma: **¿cómo lo sé?**

---

## <font color="#179287">2. Tres proyectos, tres maneras de trabajar con un agente</font>

### Proyecto A: el agente escribe y nadie le dijo nada

Una aplicación construida casi por completo pidiéndole a una IA que la escribiera, sin ningún documento escrito para ella.

| Qué se encontró en el repositorio | Por qué importa |
|---|---|
| **5 commits en total.** El segundo agrega 38 archivos y 21,007 líneas de una vez | El historial no cuenta cómo se construyó nada. El proyecto terminó llevando un registro de cambios escrito a mano para compensarlo |
| El README presume *"100% testeado"* y desglosa la cobertura: 15 + 10 + 8 + 5 = **38 pruebas**. En el repositorio hay **4** | El agente escribió lo que sonaba bien, y nadie lo comparó con el código |
| Un commit titulado *"Remove unused files and tests to streamline the project structure"* borra siete archivos de pruebas | Las pruebas que sí existieron se fueron "para simplificar", y el README siguió diciendo que estaban |
| El README y el índice de documentación enlazan a **4 archivos que no existen**: una guía completa, un análisis de arquitectura, un documento de rendimiento y un script de verificación | Un documento fantasma no le estorba a una persona, que da clic y ve el error. Un agente que lo lee cree que existe y puede citarlo o "seguirlo" |
| Métricas sin ninguna medición detrás: *"Acoplamiento reducido en 70%"*, *"Testabilidad aumentada en 850%"* | Una cifra inventada es una afirmación que nadie puede comprobar |
| Dos versiones distintas del proyecto en el mismo README (2.2.0 arriba, 2.0.0 abajo) | Cuando el mismo dato vive en dos lugares, tarde o temprano se contradicen |
| 36 archivos compilados (`.pyc`) dentro del repositorio | Nadie le dijo al agente qué no se sube |
| Un documento de **casi 2,400 líneas** con el plan para migrar a otro lenguaje: análisis, diseño, fases con días estimados, pruebas... y **ni una línea migrada** | Un plan no es una especificación. Dice cómo se piensa pasar el tiempo, no qué tiene que ser verdad al terminar |

**La lección:** sin documentos, cada respuesta del agente es una decisión que nadie tomó. Y lo que el agente afirma sobre su propio trabajo hay que comprobarlo con evidencia, nunca con su palabra.

### Proyecto B: mucha documentación y una tarea demasiado grande

Un sistema con meses de documentación de análisis y diseño (requerimientos, casos de uso, reglas de negocio, registros de decisión) y con instrucciones para el agente, al que después se le pidió implementarlo.

| Qué se encontró en el repositorio | Por qué importa |
|---|---|
| El equipo escribió un reporte de contradicciones entre sus propios documentos. Por ejemplo, el glosario decía que cierto dato **no** decide un cambio de estado; un caso de uso decía que **sí** puede decidirlo, y una regla de negocio repetía la versión del caso de uso | Si dos documentos dicen cosas distintas, el agente elige uno sin avisar. Revisar las contradicciones *antes* de construir fue un acierto |
| Al agente se le pidió el sistema completo de una vez: **un commit de 66 archivos y 15,134 líneas** que cubre seis tareas del backlog | La tarea era demasiado grande para revisarla, para comprobarla y para corregirla |
| El Pull Request que lo integraba creció a **32,759 líneas en 119 archivos**. Tiene **0 revisiones y 0 comentarios** y nunca se integró | Un PR que nadie puede revisar no se integra. Todo ese código quedó fuera del proyecto |
| De los 28 commits que siguieron, **19 son correcciones** (`fix(...)`) de dependencias, arranque, contenedores e integración continua | Generar todo de golpe y luego perseguir los errores uno por uno |
| El equipo abrió cuatro tareas solo para **entender** lo que había escrito el agente: *"No existe documentación interna que explique qué hace cada módulo, cómo se relacionan entre sí ni cómo arranca el sistema. Sin ese análisis, cualquier colaborador nuevo o revisión externa parte desde cero."* | Código que nadie del equipo entiende es deuda, aunque funcione |
| Las instrucciones decían que antes de integrar se corren las pruebas. El agente escribió 59 archivos de código y 3 de pruebas | Una regla sin comprobación es una sugerencia |
| Cuatro archivos de instrucciones, uno por cada agente que se probó, que repetían con variaciones las mismas reglas | Cuando las instrucciones viven en cuatro lugares, cada agente puede estar leyendo una versión distinta |
| Los permisos del agente se fueron acumulando con "permitir siempre": `git push`, `git reset` y `git checkout` con cualquier argumento, e instalar paquetes con una herramienta que las propias instrucciones prohibían | Lo que el agente ejecuta, lo firma quien le dio permiso |

**La lección:** Proyecto B sí tenía instrucciones para el agente, con su arquitectura y los errores que debía evitar, y buena parte de ellas explicaba cómo buscar en la documentación. Le faltó lo que convierte una instrucción en algo que se cumple: tareas del tamaño de una revisión, criterios que se pudieran comprobar y una sola fuente sin contradicciones.

### FILEY: el agente trabaja dentro de un sistema de documentos

El sistema de registro de la Feria Internacional de la Lectura Yucatán, construido por un equipo de la FMAT con agentes de IA. Más de 300 de sus commits fueron coescritos con un agente. Estas son las piezas que lo hicieron funcionar:

| Documento | Qué hace | Fragmento real |
|---|---|---|
| **Instrucciones del proyecto** (`CLAUDE.md`, que se copia a `AGENTS.md`) | Un mapa: dónde vive cada cosa, qué guía aplica para cada tarea, qué reglas no se rompen y con qué comandos se comprueba | *"La arquitectura la mandan `docs/adr/`; los detalles de cómo se construye una pantalla viven en los skills, no aquí."* |
| **Casos de uso** (`CU-DOM-NNN`) | La especificación de cada funcionalidad. Los commits los citan | `fix(evt): en presentación de libro, la editorial es quien organiza (CU-EVT-002)` |
| **15 ADR** (registros de decisión) | El porqué de cada decisión de arquitectura | *"Vienen de los ADR y no se contradicen sin escribir uno nuevo."* |
| **6 guías por tema** (*skills*) | Cómo se hace cada cosa: estilo visual, componentes, pruebas, pantallas... | *"Cada hecho vive en **un solo** skill; los demás enlazan. No dupliques contenido entre ellos."* |
| **60 avisos** dentro de las instrucciones | Trampas, excepciones y lo que parece un error y no lo es, muchas veces con la fecha del error que los originó | *"Cuatro cosas de la configuración de `s3` se leen como errores. No las «arregles»."* |
| **Política de artefactos** | Qué tipos de documento existen y qué hacer con uno nuevo | *"Un artefacto sin frontmatter definido no se inventa. [...] pregunta qué datos requiere antes de ponerle campos."* |
| **Scripts que comprueban la documentación** | Que los documentos no se contradigan entre sí y que las copias de las instrucciones estén al día | *"Mira las promesas que los propios documentos se hacen entre ellos, que son las que se rompen en silencio al editar uno solo."* |
| **Más de mil pruebas** y una guía para escribirlas | Lo que el agente afirma se comprueba con un comando | *"Si esto lo contradice, esto está viejo."* (la guía de pruebas, sobre el ADR que manda sobre ella) |

**Un detalle que importa:** la primera versión de esas instrucciones tenía **166 líneas**. Dos meses y 74 cambios después tiene más de 1,200, y casi todo lo que se agregó fue un aviso escrito después de que algo saliera mal. Nadie escribió ese documento de una vez: **creció cada vez que el agente se equivocó en algo que debió estar escrito**.

### Las tres juntas

| | Proyecto A | Proyecto B | FILEY |
|---|---|---|---|
| **Instrucciones para el agente** | Ninguna | Cuatro archivos que se repiten | Uno, del que se generan las copias |
| **Qué se le pide** | "Haz la aplicación" | "Implementa el sistema completo" | Un caso de uso a la vez |
| **Cómo se sabe si está bien** | Lo que dice el README | Una regla que nadie comprobó | Pruebas y scripts que se corren |
| **Decisiones** | Sin ningún registro | Algunas en registros de decisión, y otros documentos las contradecían | En ADR, y las instrucciones las citan |
| **Lo que parecía error y no lo era** | - | - | Un aviso con fecha: *"no lo arregles"* |
| **Pruebas antes de producción** | Ninguna verificable | 3 archivos de pruebas para 59 de código, y un PR sin revisar | Más de mil pruebas automáticas, pruebas funcionales que ejecuta una persona y una ronda de aceptación antes de producción |
| **Despliegue** | - | El código nunca llegó a integrarse | Entornos separados de desarrollo, aceptación y producción |
| **Resultado** | Afirmaciones que no se pueden creer | Código que no se integró | Un sistema en producción que el equipo entiende |

---

## <font color="#179287">3. El ciclo completo, y por qué GitFlow lo hace posible</font>

Los tres proyectos dejan la misma conclusión: un agente no produce software de calidad por sí solo, ni con buenas instrucciones. La calidad sale de un ciclo en el que cada paso deja algo escrito y cada paso tiene quién lo revise antes del siguiente:

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

| Paso | Qué produce | Qué evita |
|---|---|---|
| **Documentar** | Instrucciones, especificación con criterios comprobables, decisiones y la comprobación, en rojo | Que el agente decida o invente lo que nadie escribió (Proyecto A) |
| **Revisión 1 · Documentos** | Documentos verdaderos, sin contradicciones y del tamaño de un PR | Construir sobre una contradicción (Proyecto B), cuando corregirla cuesta una línea |
| **Implementar** | Un PR del tamaño de una especificación | El trabajo imposible de revisar (Proyecto B: 32,759 líneas) |
| **Revisión 2 · Implementación** | Código que alguien del equipo entiende, sin dependencias ni secretos que nadie decidió | Código que después hay que estudiar como si fuera de otro (Proyecto B: cuatro tareas solo para entenderlo) |
| **Probar** | Evidencia de cada criterio, obtenida por alguien que no construyó | El "listo" sin evidencia (Proyecto A: 38 pruebas anunciadas, 4 reales) |
| **Revisión 3 · Pruebas** | La aprobación de que lo que se va a servir es lo que se pidió | Que alguien debilite una prueba para que pase |
| **Desplegar** | Una dirección pública, comprobada, con una forma conocida de deshacerla | Que un error llegue a usuarios sin forma de volver atrás |

**Revisión organizada** quiere decir tres cosas: cada revisión tiene **una lista** (la guía de revisión), la hace **alguien distinto de quien construyó** y queda **registrada en el PR**. La regla que las une: *quien construye no prueba ni aprueba su propio trabajo*.

**GitFlow es lo que convierte la velocidad del agente en avance.** Un agente puede escribir en una tarde lo que el equipo revisaría en un mes. Las herramientas de la etapa anterior son justo las que ordenan ese volumen:

| Herramienta de GitFlow | Lo que ordena cuando el que escribe es un agente |
|---|---|
| Issue | Una unidad de trabajo del tamaño de una especificación |
| Rama | El agente trabaja aislado; si da vueltas, la rama se tira y `main` no se entera |
| Pull Request | El único lugar por donde entra su trabajo, con las revisiones registradas |
| Reglas de `main` | Nadie se salta las revisiones: ni el equipo con prisa ni el agente |
| Robot | Corre las comprobaciones en cada PR, sin cansarse |
| Squash | Un PR, un commit en `main`: cada cambio lleva a su porqué |
| Revert | Deshacer en producción sin reescribir la historia |

Sin ellas, la velocidad del agente se nota en el historial: Proyecto A metió todo el código en 5 commits, y en Proyecto B un solo PR creció más de lo que nadie podía revisar.

---

## <font color="#179287">4. Los riesgos de trabajar con un agente, y su momento</font>

Trabajar con un agente tiene riesgos conocidos. Ninguno se elimina del todo; todos se reducen al mínimo si se atienden **en el momento correcto**, que casi siempre es el más temprano: antes de escribirle no cuesta nada, en un documento cuesta una línea, en una revisión una corrección, en producción una reversa.

| Riesgo | Cómo se nota | Cómo se mitiga | Momento |
|---|---|---|---|
| **R1** Inventa datos, archivos, cifras o funciones | Menciona algo que no existe | Documentos verdaderos; *Cuándo preguntar*; comprobar cada afirmación | Al documentar y en cada revisión |
| **R2** Decide solo lo que nadie escribió | Tecnología o estructura que nadie eligió | *Decisiones ya tomadas*; ADR | Al documentar |
| **R3** Dice "listo" sin evidencia | "Ya pasan todas las pruebas" | El probador corre la comprobación | Al probar |
| **R4** Trabajo demasiado grande para revisarlo | Un PR de miles de líneas | Una especificación por PR; plan antes del código | Al pedir |
| **R5** Hace de más | Archivos fuera de alcance | *Fuera de alcance*; *Lo que no se toca* | Al documentar y en la Revisión 2 |
| **R6** Debilita o borra pruebas | Cambios en `pruebas/` | La Revisión 3 lo revisa | Revisión 3 |
| **R7** Ejecuta comandos peligrosos | Pide `git push`, `git reset` o borrar | Leer cada permiso; reglas de `main` | Durante la implementación |
| **R8** Secretos y datos personales donde no deben estar | Contraseñas en el chat o en un commit | No pegarlos nunca; la Revisión 2 los busca | Antes de escribirle y en la Revisión 2 |
| **R9** Dependencias que nadie decidió, o que no existen | Un paquete o CDN nuevo | ADR de dependencias; la Revisión 2 las revisa | Al documentar y en la Revisión 2 |
| **R10** Código que nadie entiende | Nadie puede explicar un archivo | Si no se puede explicar, no se integra | Revisión 2 |
| **R11** Código que funciona pero es inseguro | Acepta cualquier entrada | Criterios de seguridad; probar entradas raras | Al documentar y al probar |
| **R12** Obedece instrucciones escondidas en lo que lee | Un texto le pide ignorar sus instrucciones | No darle contenido de fuera de confianza con permisos amplios; que se detenga y avise | Durante la implementación |
| **R13** Olvida lo que se le corrigió en el chat | Repite un error ya arreglado | La corrección se escribe en el repo | Después de cada error |
| **R14** Algo roto llega a producción | La dirección publicada falla | Tres revisiones antes del merge; prueba de humo; Revert | Al desplegar |
| **R15** El equipo pierde el protagonismo | Nadie sabe ya por qué el proyecto es así | El equipo decide, revisa y prueba; los papeles rotan | Todo el ciclo |

El [registro de riesgos](../plantillas/docs/riesgos.md) de las plantillas trae esta tabla lista para que cada equipo la adapte y le agregue los riesgos propios de su proyecto.

---

## <font color="#179287">5. Los documentos, uno por uno</font>

Cada documento responde una pregunta distinta. Si dos responden la misma, uno sobra.

| Documento | Responde | Dónde vive |
|---|---|---|
| **AGENTS.md** | ¿Dónde estoy y cómo se trabaja aquí? | La raíz del repo |
| **Especificación** | ¿Qué hay que construir y cuándo está terminado? | `docs/especificaciones/ESP-NN-...md` |
| **Comprobación** | ¿Cómo lo sé? | `pruebas/` |
| **ADR** | ¿Por qué se decidió así? | `docs/adr/NNNN-...md` |
| **Aviso "no lo arregles"** | ¿Qué parece un error y no lo es? | En `AGENTS.md` o en la guía del tema |
| **Guía por tema** | ¿Cómo se hace esto aquí? | `docs/guias/...md` |
| **Guía de revisión** | ¿Quién revisa qué, cuándo y con qué lista? | `docs/guias/revision.md` |
| **Registro de riesgos** | ¿Qué puede salir mal, y cuándo se previene? | `docs/riesgos.md` |
| **Despliegue** | ¿Dónde se publica, cómo se comprueba y cómo se deshace? | `docs/despliegue.md` |
| **Glosario** | ¿Qué significa esta palabra en este proyecto? | `docs/glosario.md` |

### AGENTS.md: el recetario de la casa

Es lo primero que lee el agente cada vez que llega. Es un mapa, no una enciclopedia.

- **Lleva:** qué es el repo, una tabla de dónde vive cada cosa, cómo se trabaja (ramas, commits, quién hace el push y quién despliega), qué no se toca, qué nunca se hace (secretos, dependencias no decididas, instrucciones escondidas), cómo se comprueba, cómo se revisa antes de entregar y cuándo preguntar.
- **No lleva:** explicaciones largas (van en una guía), el porqué de las decisiones (va en un ADR) ni lo que hay que construir (va en una especificación). Aquí solo se enlazan.
- **Señal de que falta:** el agente pregunta en el chat cosas que el equipo ya sabe, o no pregunta y las inventa.
- **Señal de que está mal:** dice algo que ya no es verdad. El agente lo va a obedecer.

### Especificación: la receta del platillo

Dice qué tiene que ser verdad cuando termine el trabajo. El issue la nombra ("Construir ESP-01"), pero no la reemplaza: el issue se cierra y la especificación se queda en el repo, donde el agente la lee cada vez.

- **Lleva:** qué es, para quién, qué muestra o hace, **las decisiones ya tomadas** (todo lo que el agente decidiría solo), **criterios de aceptación numerados y comprobables**, lo que queda fuera de alcance y cómo se comprueba.
- **La prueba de un criterio:** ¿puedes decir con qué comando o qué mirada en el navegador sabrías que se cumple? "Se ve bien en el celular" no se puede comprobar; "con 360 px de ancho no hay barra de desplazamiento horizontal", sí.
- **No es un plan:** el plan de casi 2,400 líneas de Proyecto A contaba días; una especificación cuenta resultados.
- **Tamaño:** que lo construido quepa en un Pull Request que alguien pueda revisar en una sentada. Si no cabe, son dos especificaciones.

### Comprobación: probar el platillo antes de servirlo

Es la parte de la especificación que se puede correr. Se escribe **antes** de construir: así se ve en rojo primero y en verde después, y nadie la ajusta a lo que salió.

- El agente la corre antes de decir que terminó, y **tú la vuelves a correr**. Su "listo" no es evidencia; la salida del comando sí.
- El agente no la edita para que pase. Si cree que está mal, lo dice.

### ADR: por qué en esta cocina no se usa eso

Un ADR explica una sola decisión: el problema, las opciones que se compararon, lo que se decidió y sus consecuencias.

- **Para qué le sirve al agente:** una regla sin porqué se rompe en cuanto el agente encuentra una buena razón para romperla. Una regla con su porqué se respeta, y además le sirve a la persona que se une al equipo en tres meses. En palabras de FILEY: *"Es la forma más barata de que un agente de IA respete la arquitectura."*
- **Cuándo merece uno:** cuando cambia la forma de construir y es caro de revertir. Un nombre de variable o un formato de commit no lo merecen.
- **El paso que más se olvida:** si la decisión cambia una regla escrita en otro lado, ese otro documento se corrige **en el mismo cambio**. En FILEY, un ADR retiró una regla el 29 de agosto y una de sus guías la siguió enunciando hasta el 3 de septiembre. En esos días, cualquier agente que leyera esa guía obedecía la regla vieja.

### Aviso "no lo arregles": la nota pegada en el recetario

Un agente que encuentra algo raro lo "arregla". Si lo raro es intencional, el arreglo es un error.

- **Lleva:** qué parece un error, por qué no lo es, desde cuándo y dónde está la historia completa.
- **Ejemplo de FILEY:** una pantalla de acceso revela algo que normalmente se esconde. El aviso dice que está decidido así, desde qué fecha, y que *"antes de «arreglarlo» hay que leer la historia"*: la decisión ya había dado tres vueltas.

### Guía por tema: cómo se hace esto aquí

Cuando la misma explicación aparece dos veces en el chat con el agente, merece una guía.

- **Lleva:** cuándo se usa (la frase que le dice al agente si aplica), qué documento manda si hay choque, las reglas concretas, un ejemplo bien y uno mal, y qué no es de esta guía.
- **Cada dato en un solo lugar:** si los colores de la página están en la guía de estilo, `AGENTS.md` enlaza a la guía y no los repite.
- **Algunos agentes las cargan solos** cuando las necesitan (las llaman *skills*). Con cualquier agente funciona una tabla en `AGENTS.md`: *"Si vas a... lee..."*.

### Guía de revisión: la revisión organizada, por escrito

Es la guía por tema más importante del ciclo: convierte "revisar" en algo que se puede repetir y comprobar.

- **Lleva:** las tres revisiones (documentos, implementación y pruebas), quién hace cada una, cuándo, con qué lista y cómo queda registrada en el PR.
- **La regla:** quien construye no prueba ni aprueba su propio trabajo.
- **El agente también la lee:** se revisa con ella antes de entregar y dice qué no pudo comprobar. Su revisión ayuda; nunca sustituye a la de una persona.

### Registro de riesgos y despliegue: lo que pasa después

- **El registro de riesgos** dice qué puede salir mal al trabajar con un agente, cómo se nota, cómo se mitiga y **en qué momento**. Crece igual que `AGENTS.md`: cada susto se vuelve una fila.
- **El documento de despliegue** dice dónde se publica, quién despliega (nunca el agente), la prueba de humo que se hace después y cómo se revierte. Se escribe antes del primer despliegue y se ensaya antes de necesitarlo.

### Glosario

Las palabras que en tu proyecto significan algo preciso. Proyecto B tenía uno, y sus contradicciones con los casos de uso fueron lo primero que hubo que corregir. FILEY escribe avisos para nombres que confunden, por ejemplo uno que aclara que el campo `estado` de una persona es el estado de su cuenta y no una entidad federativa.

---

## <font color="#179287">6. Una sola fuente, y que se compruebe sola</font>

Dos reglas que cruzan todos los documentos:

**Una sola fuente.** Cada dato vive en un lugar y los demás lo enlazan. Las instrucciones viven en `AGENTS.md`, y si un agente lee otro archivo, ese archivo solo apunta a `AGENTS.md`. FILEY genera las copias con un script, y aun así lo cuenta como lección: *"Editar la copia hace que dos agentes lean cosas distintas del mismo repositorio, y eso no se nota hasta que uno de los dos se equivoca."*

**Lo que se puede comprobar, se comprueba con un comando.** Que cada enlace lleve a un archivo que existe (contra los documentos fantasma de Proyecto A), que la página tenga una tarjeta por perfil, que nada se descargue de fuera. Lo que no se puede comprobar con un comando se revisa a mano, contra la lista de criterios.

---

## <font color="#179287">7. Cómo crece la documentación</font>

Nadie escribe todo esto el primer día. El ciclo es:

1. Empiezas con un `AGENTS.md` corto y una especificación para lo primero que vas a construir.
2. El agente construye y tú compruebas.
3. Cuando el agente se equivoca, te preguntas: **¿había una línea que lo hubiera evitado?**
   - Si la respuesta es sí, escríbela donde le toca: una regla en `AGENTS.md`, un criterio en la especificación, un ADR, un aviso o una guía.
   - Si se lo explicaste en el chat, esa explicación se va a perder al cerrar la sesión. Lo que se escribe en el repo, no.
4. Esa línea entra por Pull Request, como cualquier otro cambio, y alguien la revisa.

FILEY pasó de 166 a más de 1,200 líneas así: un aviso a la vez, cada uno con su fecha.

---

## <font color="#179287">8. Lista de comprobación de un documento para agentes</font>

Antes de integrar cualquiera de estos documentos, revisa:

- [ ] Todo lo que dice es verdad **hoy**. Cada afirmación se puede comprobar.
- [ ] No repite algo que ya está escrito en otro documento: lo enlaza.
- [ ] No contradice a otro documento. Si lo hace, uno de los dos se corrige en este mismo cambio.
- [ ] Cada enlace lleva a un archivo que existe.
- [ ] Cada criterio dice cómo se sabe que se cumple.
- [ ] Dice qué hacer cuando falta información: preguntar.
- [ ] Es lo bastante corto para que una persona lo lea completo.

---

## <font color="#179287">Fuentes para seguir leyendo</font>

- [agents.md](https://agents.md): el formato abierto de `AGENTS.md` y la lista de agentes que lo leen.
- Michael Nygard, *Documenting Architecture Decisions* (2011): el texto que popularizó los ADR.
- La documentación de tu agente, en la sección de instrucciones del proyecto (*project instructions*, *custom instructions* o *memory*).
