<div align="center">

# Git en equipo: trabajo colaborativo desde la terminal

Etapa 2 del curso de Git · GitFlow · ~11 horas y media de clase, en varias jornadas, + 2 autoestudios y una tarea. Desde aquí llegas a todo lo que necesitas: qué preparar antes de la clase, la guía que seguirás durante la sesión, las plantillas, los autoestudios, la tarea y los recursos para repasar por tu cuenta.

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

En GitBasic aprendiste Git con botones. En esta dejamos los botones y trabajamos **en equipo, sobre un repositorio compartido, desde la terminal**. No vas a programar nada: todo lo que escribas será texto en Markdown.

Al terminar vas a poder:

- Crear un repositorio desde la terminal y publicarlo en GitHub.
- Entender la diferencia entre tu copia **local** y la copia en **origin**, y mantenerlas sincronizadas.
- Organizar el trabajo del equipo con **issues**, **ramas** y **Pull Requests**.
- Proteger la rama principal para que nadie se salte las reglas, ni siquiera el dueño.
- Mantener un historial limpio y fácil de seguir con **rebase** y **squash**.
- Resolver conflictos sin pánico.
- Decidir qué reglas necesita tu equipo, y cuáles no.

---

## <font color="#179287">Qué hay en esta etapa</font>

| Qué | Para quién | Dónde |
|---|---|---|
| **Requisitos previos**: lo que necesitas listo antes de la clase, cómo comprobarlo y cómo arreglarlo si algo quedó pendiente de GitBasic | Alumnos | [`material/requisitos.md`](material/requisitos.md) |
| **Guía del alumno**: los 7 bloques de la sesión, paso a paso, con sus actividades y el acordeón | Alumnos | [`material/guia-alumno.md`](material/guia-alumno.md) |
| **Plantillas y robot**: plantillas de issue y de PR, y el robot revisor que copiará tu equipo | Alumnos | [`material/plantillas/`](material/plantillas/) |
| **Autoestudio 2**: los botones que faltaban, ahora con comandos | Alumnos | [`material/autoestudio-2.md`](material/autoestudio-2.md) |
| **Autoestudio 3**: el ciclo completo sin red, en equipo | Alumnos | [`material/autoestudio-3.md`](material/autoestudio-3.md) |
| **Tarea**: "Nuestras reglas del juego" | Alumnos | [`material/tarea.md`](material/tarea.md) |
| **Lectura de apoyo**: flujos de trabajo colaborativos con Git, útil para la tarea | Alumnos | [`material/lecturas/flujos-git-colaborativos.md`](material/lecturas/flujos-git-colaborativos.md) |
| **Presentación** de la etapa, en PDF | Alumnos | [`material/Git_y_GitHub_Terminal_Presentacion.pdf`](material/Git_y_GitHub_Terminal_Presentacion.pdf) |
| **Guion**: el material guía del instructor, con tiempos, frases clave y notas | Instructores | [`guion/guion-instructor.md`](guion/guion-instructor.md) |
| **Guía de diapositivas**: qué debe llevar la presentación en cada bloque | Instructores | [`guion/guia-slides.md`](guion/guia-slides.md) |

**Vocabulario del curso:**

| Término | Qué es |
|---|---|
| **Etapa** | Una parte del curso con su propio tema: GitBasic, GitFlow y AgenticFlow. Esta es la Etapa 2 (~11 horas y media de clase) |
| **Sesión** | Una clase. Una etapa puede ocupar varias sesiones |
| **Bloque** | Cada parte de la etapa donde se explica y practica un concepto principal. Esta etapa tiene 7 |
| **Autoestudio** | Práctica por tu cuenta, fuera de clase |
| **Guion** | El material guía del instructor |
| **Guía del alumno** | Lo que tú sigues durante la sesión, bloque por bloque |

---

## <font color="#179287">Antes de la clase</font>

👉 **Revisa los [requisitos previos](material/requisitos.md) completos.** Dicen qué necesitas, cómo comprobar que ya lo tienes y qué hacer si no; varias cosas vienen de GitBasic, por si no la terminaste o cambiaste de computadora. En resumen:

- [ ] **VS Code** con la extensión **GitLens**, sin iniciar sesión en ella. El curso se da en VS Code: cualquier otro editor es bajo tu propio riesgo.
- [ ] **Cuenta de GitHub** con correo verificado.
- [ ] **Git** con tu nombre y tu correo. Si vinculaste GitHub Desktop en GitBasic, ya los tiene.
- [ ] **GitHub CLI** instalado y con tu sesión iniciada: `gh auth status` responde bien.
- [ ] **Tu equipo** de 3 o 4 personas, con su líder.

> Si al empezar la clase `gh auth status` no responde bien, avísale a un asistente: te ayudará aparte sin detener al grupo.

---

## <font color="#179287">Durante la clase</font>

Sigue la [**guía del alumno**](material/guia-alumno.md). La sesión avanza en 7 bloques; cada uno explica qué vas a hacer, cómo hacer cada actividad y qué debes tener listo antes de pasar al siguiente.

| # | Bloque |
|---|---|
| 1 | El botón era un comando |
| 2 | Local y origin: el líder publica, el equipo clona |
| 3 | Tu primer issue |
| 4 | El ritual diario y tu primer Pull Request |
| ☕ | Descanso |
| 5 | Las reglas de la casa |
| 6 | Historia limpia: amend, pull --rebase y squash |
| 7 | Conflictos en equipo |
| | Cierre: no hay una sola forma correcta |

Al final de la guía está el **acordeón del ritual de trabajo en equipo**: la tabla de comandos para repasar el flujo por tu cuenta.

---

## <font color="#179287">Después de la clase</font>

| Qué | De qué trata | Cuándo |
|---|---|---|
| [**Autoestudio 2**](material/autoestudio-2.md) | Individual: los botones de GitBasic que en clase no se practican con comandos (merge, discard, undo, revert y abort merge), en tu `practica-terminal` | Desde el Bloque 1 |
| [**Autoestudio 3**](material/autoestudio-3.md) | En equipo: el ciclo completo sin guía, solo con el acordeón, y la prueba de la historia de `main` | Al terminar el Bloque 7, antes de la tarea |
| [**Tarea**](material/tarea.md) | En equipo: elegir una idea de proyecto, investigar qué estrategia de trabajo colaborativo le conviene, documentarla en su repositorio y explicarla en un video de 5 a 10 minutos | Antes de la siguiente sesión |

**La tarea es obligatoria y el video es necesario para acreditar los puntos de formación integral.**

---

## <font color="#179287">Recursos para seguir practicando</font>

- Ayuda de GitHub CLI desde la terminal: `gh help` y `gh [comando] --help`
- [Pro Git en español](https://git-scm.com/book/es/v2): libro oficial y gratuito (capítulos 3, *Ramificaciones en Git*, y 5, *Git en entornos distribuidos*)
- [Documentación de GitHub](https://docs.github.com/es): flujos de trabajo, rulesets y métodos de merge
- [Oh My Git!](https://ohmygit.org/): juego visual para practicar, incluido el rebase
