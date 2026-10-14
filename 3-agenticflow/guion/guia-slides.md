<div align="center">

# Guía para armar las diapositivas

Etapa 3 del curso de Git · AgenticFlow · Material del instructor

<br>

<img src="../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

> Guía orientativa para construir la presentación a partir de [`guion-instructor.md`](guion-instructor.md). Para cada bloque dice **qué diapositivas hacen falta, qué debe llevar cada una y qué visual la acompaña**. No es el texto final de las slides: es la lista de lo que no puede faltar.

---

## <font color="#179287">Criterios generales</font>

- **El ciclo es el hilo visual.** Una franja fija con los siete pasos (*Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar*) aparece en todas las slides de contenido, con el paso del bloque resaltado. Al cierre, la franja completa se ilumina.
- **Las slides acompañan; el repo enseña.** La mayor parte de la clase ocurre en VS Code, en el chat del agente y en GitHub.com. Las diapositivas abren cada bloque, fijan la idea clave y muestran **la evidencia de los proyectos reales**, que es lo que no se puede improvisar en vivo.
- **Una idea por slide.** Si una slide necesita dos frases clave, son dos slides.
- **La evidencia se muestra como dato, no como chisme.** Proyecto A y Proyecto B **no se nombran** y no se muestra nada que revele su dominio (nombres de archivos de negocio, capturas de la aplicación, nombres de personas). Bastan las cifras y los fragmentos de la [lectura de apoyo](../material/lecturas/documentacion-para-agentes.md). FILEY sí se nombra, solo como ejemplo de buen trabajo.
- **Etiquetas fijas:** una lupa para "¿cómo lo sé?" junto a cada evidencia, y una etiqueta **R1…R15** cada vez que aparece un riesgo, con el mismo color en toda la presentación.
- **La cocina sigue:** comanda (issue), recetario (`AGENTS.md`), receta (especificación), el chef que prueba (probador), la mesa donde se sirve (`main`, ya desplegado). Íconos simples y consistentes.
- **Recursos visuales disponibles:** logos en [`assets/logos/`](../../assets/logos/) (Git, GitHub, UADY). Los diagramas Mermaid del guion se pueden exportar tal cual (mermaid.live) o redibujar.
- **Slides fijas:** la tabla de papeles, la tabla de la Actividad 1, la prueba de un criterio (✘ → ✔), la lista de cada revisión y la tabla de pruebas deben poder quedarse proyectadas mientras los equipos trabajan: letra grande y sin animaciones.

**Conteo estimado:** 28 a 32 diapositivas.

---

## <font color="#F05032">Apertura (3 slides)</font>

### Slide 0.1: Portada
- Título: *Construir software con un agente*. Subtítulo: Etapa 3 del curso de Git · AgenticFlow.
- Logos de UADY, Git y GitHub. Nombre del instructor.

### Slide 0.2: El ciclo que se llevan (slide fija)
- La franja de los siete pasos, grande.
- Debajo: *Hoy lo recorremos una vez. Al final de la etapa, solos, con su proyecto. Después, lo presentan desplegado a ingenieros con experiencia.*
- Tres columnas pequeñas al pie: **GitBasic** (botones) → **GitFlow** (terminal, equipo y reglas) → **AgenticFlow** (un agente, ordenado por GitFlow).

### Slide 0.3: Los papeles (slide fija)
- Tabla: piloto, revisor, probador y líder, con lo que hace cada uno y lo que nunca hace.
- La regla, en grande: *Quien construye no prueba ni aprueba su propio trabajo.*
- La regla de permisos y la pregunta del día: **¿Cómo lo sé?**

> Antes del Bloque 1: check-in del agente en cada equipo (*"¿Qué archivos hay en este repositorio?"*).

---

## <font color="#F05032">Bloque 1: Un cocinero sin memoria (5 slides)</font>

### Slide 1.1: La pregunta pendiente
- Cita del reto final de GitBasic: *"¿Cómo puedes usar la IA en tu carrera sin perder el protagonismo?"*
- Subtítulo: *Hoy la contestamos con hechos.*

### Slide 1.2: El cocinero nuevo
- Ilustración de la cocina de GitFlow con un cocinero nuevo.
- Cuatro rasgos: brillante · rapidísimo · sin memoria · nunca dice "no sé".
- La frase que van a escribir, en grande: *"Haz una página web para presentar a nuestro equipo."*

### Slide 1.3: Actividad 1 (slide fija)
- La tabla de seis filas, con la columna de riesgos.

### Slide 1.4: Evidencia: un README que nadie comprobó (Proyecto A)
- Izquierda, el fragmento: *"🧪 100% Testeado"*, la cobertura desglosada (15 + 10 + 8 + 5 = 38 pruebas), *"Testabilidad aumentada en 850%"*, el enlace a `DOCUMENTATION.md`.
- Derecha, lo que había: **4 pruebas**, ningún `DOCUMENTATION.md`, ninguna medición.
- Etiquetas **R1** y **R3**.
- Frase clave: *"Lo que no está escrito, el agente lo inventa. Y lo que inventa, lo afirma con la misma seguridad que lo que sabe."*

### Slide 1.5: Lo firmas tú (Proyecto B) + transición
- Lista de permisos acumulados con "permitir siempre": `git push *`, `git reset *`, `git checkout *`. Etiqueta **R7**.
- Frase clave: *"Lo que el agente ejecuta, lo firmas tú."*
- Transición: *"¿Dónde le escribimos lo que el equipo sabe, para que lo lea cada vez que llegue?"*

---

## <font color="#F05032">Bloque 2: El recetario de la casa · Documentar (4 slides)</font>

### Slide 2.1: Portada de bloque
- `AGENTS.md`: *lo que el agente lee cada vez que llega, antes de hacer nada*.
- Diagrama: tres sesiones distintas → *lee AGENTS.md* → trabaja.
- Recordatorio de GitFlow: *"La configuración es un archivo."*

### Slide 2.2: Tres reglas, y así empieza el de FILEY
- **Un mapa, no una enciclopedia** · **Verdad hoy** · **Una sola fuente**.
- El fragmento de FILEY (tabla *Dónde / Qué es* y *"La arquitectura la mandan `docs/adr/`..."*). Nota visible: *"Empezó con 166 líneas."*
- Contraste de una línea: los cuatro archivos de instrucciones de Proyecto B frente al archivo único de FILEY.

### Slide 2.3: Lo que nunca se hace (slide fija durante la Actividad 2)
- Las cuatro líneas de la plantilla, cada una con su riesgo: secretos (**R8**), dependencias (**R9**), despliegue, instrucciones escondidas (**R12**).
- Frase: *"Cada línea aquí es un riesgo mitigado en el momento más barato: antes de que exista una sola línea de código."*

### Slide 2.4: Entrevista al agente + transición
- El prompt de la entrevista.
- Frase clave: *"Sus preguntas son los huecos de su documentación."*
- Transición: *"Ya sabe dónde está. ¿Sabe qué construir? ¿Y quién revisa lo que le escribimos antes de que lo obedezca?"*

---

## <font color="#F05032">Bloque 3: La receta, y la primera revisión · Documentar y Revisión 1 (5 slides)</font>

### Slide 3.1: Comanda contra receta
- Tabla de dos columnas: issue (se cierra, dice "Construir ESP-01") contra especificación (se queda, dice qué debe ser verdad).
- Las dos evidencias en una línea cada una: el plan de casi 2,400 líneas sin una línea migrada (Proyecto A) y el glosario contradictorio (Proyecto B).

### Slide 3.2: La prueba de un criterio (slide fija)
- Dos o tres pares ✘ → ✔: "que se vea bonita" → "usa los colores #179287 y #F05032"; "que funcione en el celular" → "con 360 px de ancho no hay barra horizontal".
- Frase clave: *"Si no sabes cómo lo comprobarías, no es un criterio, es un deseo."*

### Slide 3.3: La comprobación en rojo
- Captura de la terminal: *"✘ no hay index.html en la raíz del repositorio"*.
- Frase clave: *"La comprobación existe antes que la página."*

### Slide 3.4: Revisión organizada
- Tabla de las tres revisiones: cuándo, quién y cómo queda en GitHub.
- Los tres requisitos: **una lista**, **alguien que no construyó**, **registrada en el PR**.

### Slide 3.5: Revisión 1 · Documentos (slide fija) + transición
- La lista de la Revisión 1.
- Frase: *"Un error aquí cuesta una línea. En el código, una vuelta del agente. En producción, una reversa."*
- Transición: *"Que cocine. Pero escribe más rápido de lo que podemos revisar. ¿Cómo lo dejamos trabajar sin perder el control?"*

---

## <font color="#F05032">Bloque 4: El agente implementa, y la segunda revisión · Implementar y Revisión 2 (4 slides)</font>

### Slide 4.1: El plan antes que el código
- El prompt del plan. Etiqueta **R4**.
- Frase clave: *"Si tienes que explicárselo en el chat, faltaba en el repo."* Etiqueta **R13**.

### Slide 4.2: Evidencia: un PR que nadie podía revisar (Proyecto B)
- Tres cifras grandes: **15,134** líneas en un commit · **32,759** líneas en el PR · **0** revisiones.
- Debajo: *19 de los 28 commits siguientes fueron correcciones. El PR nunca se integró.*
- La cita de la tarea que tuvo que abrir el equipo: *"No existe documentación interna que explique qué hace cada módulo [...]. Sin ese análisis, cualquier colaborador nuevo [...] parte desde cero."* Etiqueta **R10**.

### Slide 4.3: Revisión 2 · Implementación (slide fija)
- La lista de la Revisión 2, con las cuatro preguntas que más importan resaltadas: ¿cabe en una sentada?, ¿solo lo que pide la especificación?, ¿algo de fuera o algún secreto?, ¿puedo explicar cada archivo?
- Frase clave: *"Si no lo puedes explicar, no se integra."*

### Slide 4.4: Si da vueltas
- Tres caminos: nombrar la regla o el criterio · tirar la rama y mejorar la especificación · nunca perseguir el error.
- Frase: *"La rama existe para esto: si el agente se pierde, `main` ni se entera."*

---

## <font color="#F05032">Bloque 5: Probar, la tercera revisión y desplegar (5 slides)</font>

### Slide 5.1: Actividad 5 (slide fija)
- La tabla de pruebas: criterio, ✔ / ✘ y cómo se comprobó.
- `gh pr checkout [número]`.
- Frase clave grande: *"El agente dice 'listo'. ¿Cómo lo sabes?"* Etiqueta **R3**.

### Slide 5.2: Revisión 3 · Pruebas (slide fija)
- La lista de la Revisión 3, con *nadie tocó `pruebas/`* resaltado. Etiqueta **R6**.
- Quién la hace: alguien que no construyó ni probó.

### Slide 5.3: Desplegar
- Los pasos de GitHub Pages y la prueba de humo.
- Frase clave, grande: ***"Desde ahora, cada merge a `main` es un despliegue. Por eso las tres revisiones pasan antes del merge."***
- La cocina: *la mesa ya es pública*.

### Slide 5.4: Si algo falla en producción
- El botón **Revert** de un PR integrado → PR de reversa → Revisión 3 → merge → prueba de humo. Etiqueta **R14**.
- *"El `git revert` de GitFlow, con botón. Nunca un arreglo directo en `main`."*

### Slide 5.5: Antes y después
- Dos espacios para que cada equipo ponga su captura del Bloque 1 y su página publicada (o un ejemplo del repo de demostración).
- Frase: *"El agente es el mismo. Cambió lo que encontró escrito y las tres veces que alguien revisó antes de servir."*

---

## <font color="#F05032">Cierre (4 slides)</font>

### Slide 6.1: La conclusión
- La franja del ciclo, completa e iluminada.
- El texto, casi textual: *"Saber construir los documentos que guían al agente, revisarlos de forma organizada, implementar, revisar de forma organizada, probar, revisar de forma organizada y desplegar."*

### Slide 6.2: GitFlow ordena la velocidad
- La tabla *Lo que aprendieron en GitFlow → lo que ordena cuando escribe un agente* (issue, rama, PR, reglas, robot, squash, revert).
- Contraste: *5 commits para todo un proyecto* · *un PR de 32,759 líneas sin revisar* · *un ciclo con tres revisiones por PR*.
- Frase: *"Sin GitFlow, la velocidad del agente es caos. Con GitFlow, es avance."*

### Slide 6.3: Riesgos en su momento, y la respuesta
- El acordeón de riesgos agrupado por momento, como una línea de tiempo sobre el ciclo.
- Frase: *"Ningún riesgo desaparece. Todos se hacen pequeños si se atienden en su momento."*
- La pregunta de GitBasic y debajo, en grande: ***"El protagonismo no está en teclear el código. Está en decidir qué debe ser, en organizar cómo se revisa y en comprobar que lo es, antes de que llegue a nadie."***

### Slide 6.4: Lo que sigue
- Autoestudio 4 (decisiones y riesgos) → Autoestudio 5 (el ciclo sin red) → Proyecto final (construido y desplegado) → **Mentoría con ingenieros en ejercicio**.
- Recordatorio: el video es necesario para acreditar, y es el ensayo de la mentoría.
- Frase de despedida: *"Lleguen con algo que funcione, que puedan explicar línea por línea, y con preguntas que valga la pena hacerles."*
