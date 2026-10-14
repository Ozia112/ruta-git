<div align="center">

# Construir software con un agente: documentar, revisar, probar y desplegar

Etapa 3 del curso de Git · AgenticFlow · 1 sesión de 4 horas + 2 autoestudios + proyecto final. Desde aquí llegas a todo lo que necesitas: qué preparar antes de la clase, la guía que seguirás durante la sesión, las plantillas, los autoestudios, el proyecto final y la lectura de apoyo.

<br>

<img src="../assets/logos/git.webp" width="80" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../assets/logos/github.png" width="80" alt="GitHub" />

<br><br>

<img src="../assets/logos/uady.webp" width="80" alt="UADY" />
<br>
<em>Facultad de Matemáticas de la UADY · Vinculación FMAT</em>

</div>

---

## <font color="#179287">De qué trata esta etapa</font>

En GitBasic aprendiste Git con botones. En GitFlow, en equipo y desde la terminal, con reglas que decidieron ustedes. Ahora llega al equipo un integrante nuevo: **un agente de IA que escribe código**. Es más rápido que todo el equipo junto, pero no recuerda nada de un día para otro, casi nunca pregunta y cree todo lo que lee. Y escribe más rápido de lo que nadie puede revisar.

En esta etapa aprendes a construir software de calidad con él, recorriendo un ciclo en el que cada paso deja algo escrito y tiene quién lo revise antes del siguiente:

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

El código lo escribe el agente. Tú escribes lo que el código debe ser, organizas cómo se revisa, compruebas que lo es y decides cuándo se publica. **GitFlow es lo que lo hace posible:** issues, ramas, Pull Requests, reglas de `main` y el robot son lo que ordena un trabajo tan masivo y tan rápido como el de un agente.

En la sesión recorren el ciclo una vez con la página web del equipo. Al final de la etapa lo recorren solos con su propio proyecto, y lo dejan **construido y desplegado** para la siguiente etapa: presentarlo a ingenieros egresados y con experiencia en el sector, que les darán mentoría.

Al terminar vas a poder:

- Escribir los documentos que guían a un agente: `AGENTS.md`, especificaciones con criterios comprobables, ADR, avisos de "no lo arregles", guías por tema, registro de riesgos y despliegue.
- Organizar tres revisiones (documentos, implementación y pruebas) con una lista cada una, hechas por quien no construyó y registradas en el PR.
- Comprobar el trabajo de un agente con evidencia, sin conformarte con su "listo".
- Desplegar con una prueba de humo y una forma ensayada de deshacerlo.
- Reconocer los riesgos de trabajar con IA y mitigarlos en el momento en que cuesta menos.
- Usar GitFlow para que la velocidad del agente sea avance y no caos.

---

## <font color="#179287">Qué hay en esta etapa</font>

| Qué | Para quién | Dónde |
|---|---|---|
| **Requisitos previos**: lo que necesitas listo antes de la clase, cómo comprobarlo, qué agente usar y cómo instalarlo | Alumnos | [`material/requisitos.md`](material/requisitos.md) |
| **Guía del alumno**: los 5 bloques de la sesión, paso a paso, con sus actividades y los acordeones | Alumnos | [`material/guia-alumno.md`](material/guia-alumno.md) |
| **Plantillas y comprobaciones**: `AGENTS.md`, especificación, guía de revisión, plantilla de PR, ADR, riesgos, despliegue, el robot y los scripts de comprobación | Alumnos | [`material/plantillas/`](material/plantillas/) |
| **Autoestudio 4**: decisiones y riesgos | Alumnos | [`material/autoestudio-4.md`](material/autoestudio-4.md) |
| **Autoestudio 5**: el ciclo completo, sin red | Alumnos | [`material/autoestudio-5.md`](material/autoestudio-5.md) |
| **Proyecto final**: su proyecto, construido y desplegado, listo para la mentoría | Alumnos | [`material/proyecto-final.md`](material/proyecto-final.md) |
| **Lectura de apoyo**: lo que enseñan tres proyectos reales construidos con agentes | Alumnos | [`material/lecturas/documentacion-para-agentes.md`](material/lecturas/documentacion-para-agentes.md) |
| **Guion**: el material guía del instructor, con tiempos, frases clave y notas | Instructores | [`guion/guion-instructor.md`](guion/guion-instructor.md) |
| **Guía de diapositivas**: qué debe llevar la presentación en cada bloque | Instructores | [`guion/guia-slides.md`](guion/guia-slides.md) |

**Vocabulario de esta etapa:**

| Término | Qué es |
|---|---|
| **Agente** | Una IA que lee los archivos de tu repositorio, los cambia y ejecuta comandos para cumplir lo que le pides |
| **`AGENTS.md`** | El archivo de instrucciones que el agente lee cada vez que empieza a trabajar en el repo |
| **Especificación** (`ESP-NN`) | Qué tiene que ser verdad cuando termine algo que se construye, con criterios comprobables |
| **Comprobación** | Un script o una prueba que dice si lo construido cumple su especificación |
| **Revisión organizada** | Una revisión con su lista, hecha por alguien que no construyó y registrada en el PR. El ciclo tiene tres |
| **Piloto, revisor, probador y líder** | Los papeles del equipo: quien maneja al agente, quien revisa, quien prueba y quien aprueba las pruebas y despliega |
| **Prueba de humo** | La revisión rápida de lo publicado, justo después de desplegar |
| **ADR** | Registro de una decisión: por qué se decidió así y qué se descartó |
| **Aviso "no lo arregles"** | Una nota sobre algo que parece un error y es intencional |
| **Guía por tema** | Cómo se hace algo concreto en el proyecto. Algunos agentes las llaman *skills* |
| **Registro de riesgos** | Qué puede salir mal al trabajar con un agente, cómo se nota, cómo se mitiga y en qué momento |

---

## <font color="#179287">Antes de la clase</font>

👉 **Revisa los [requisitos previos](material/requisitos.md) completos, hoy mismo.** Dicen qué necesitas, cómo comprobar que ya lo tienes y qué hacer si no. En resumen:

- [ ] **VS Code**, con una terminal **Git Bash** si usas Windows. El curso se da en VS Code: cualquier otro editor es bajo tu propio riesgo.
- [ ] **Git, GitHub y GitHub CLI** funcionando, con tu sesión iniciada.
- [ ] **El repositorio del equipo de GitFlow, completo:** público, con todos como colaboradores, un perfil por integrante en `integrantes/`, las plantillas, el robot, las reglas de `main` y el documento "Nuestras reglas del juego". Si algo quedó pendiente en GitFlow, los requisitos dicen cómo dejarlo listo.
- [ ] **Un agente de código en VS Code**: al menos el piloto, idealmente todos. Los requisitos comparan opciones gratuitas, económicas y estándar, y dicen cómo instalar cada una.
- [ ] **La solicitud del beneficio de estudiante de GitHub**, enviada: puede tardar días en activarse.
- [ ] **Los papeles del equipo** decididos: piloto, revisor, probador y líder.

> Si tu equipo no tiene agente o no logra hacerlo funcionar, avisa al instructor **antes** de la clase. Pueden escribir los documentos, revisar y probar de todas formas, y trabajar con el agente de otro equipo en los pasos que lo necesitan.

---

## <font color="#179287">Durante la clase</font>

Sigue la [**guía del alumno**](material/guia-alumno.md). La sesión recorre el ciclo completo una vez, en 5 bloques:

| # | Bloque | Paso del ciclo |
|---|---|---|
| 1 | Un cocinero sin memoria | Antes del ciclo: los riesgos a la vista |
| 2 | El recetario de la casa | Documentar |
| 3 | La receta, y la primera revisión | Documentar y Revisión 1 |
| ☕ | Descanso | |
| 4 | El agente implementa, y la segunda revisión | Implementar y Revisión 2 |
| 5 | Probar, la tercera revisión y desplegar | Probar, Revisión 3 y Desplegar |
| | Cierre: el ciclo completo | |

Al final de la guía están los **acordeones**: el ciclo y sus revisiones, los documentos del agente, los riesgos y su momento, y el ritual de trabajo con un agente.

---

## <font color="#179287">Después de la clase</font>

| Qué | De qué trata |
|---|---|
| [**Autoestudio 4**](material/autoestudio-4.md) | Provocan al agente para que rompa una decisión y lo evitan con un ADR y un aviso; auditan afirmaciones y escriben su registro de riesgos |
| [**Autoestudio 5**](material/autoestudio-5.md) | El ciclo completo sin guía: guía de estilo, despliegue documentado, el robot probando, una comprobación escrita antes del código y un simulacro de reversa |
| [**Proyecto final**](material/proyecto-final.md) | Su propio proyecto, construido con el ciclo completo, desplegado y con su paquete para la mentoría |

### Lo que sigue: la mentoría

En la siguiente etapa, cada equipo presenta su proyecto **ya construido y desplegado** a un grupo de ingenieros egresados y con experiencia en el sector, que les dan mentoría, consejos y respuestas a sus dudas. El proyecto final de esta etapa es su preparación: la dirección publicada, el repositorio que cuenta cómo lo construyeron y las preguntas que quieren hacerles.

---

## <font color="#179287">Recursos para seguir practicando</font>

- [Lectura de apoyo: lo que enseñan tres proyectos reales](material/lecturas/documentacion-para-agentes.md)
- [agents.md](https://agents.md): el formato abierto de `AGENTS.md` y los agentes que lo leen
- Michael Nygard, *Documenting Architecture Decisions* (2011): el texto que popularizó los ADR
- La documentación de tu agente, en la sección de instrucciones del proyecto
- [Documentación de GitHub Pages](https://docs.github.com/es/pages): publicar un sitio desde un repositorio
