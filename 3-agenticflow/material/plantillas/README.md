<div align="center">

# Plantillas y comprobaciones

Etapa 3 del curso de Git · AgenticFlow · Los documentos que tu equipo escribe para el agente y para revisarlo

<br>

<img src="../../../assets/logos/git.webp" width="70" alt="Git" />
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../../../assets/logos/github.png" width="70" alt="GitHub" />

</div>

---

En GitFlow copiaste plantillas para que el equipo no escribiera a ciegas. Aquí es igual, con una diferencia: estos documentos los va a leer un agente, que no pregunta, no recuerda nada de la vez anterior y obedece lo que lee. Por eso las plantillas son cortas y cada sección pide algo que se pueda comprobar.

Cada archivo sirve a un paso del ciclo de la etapa:

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

| Archivo | Para qué sirve | Paso del ciclo | Dónde va en tu repo | Cuándo se usa |
|---|---|---|---|---|
| [`plantilla-AGENTS.md`](plantilla-AGENTS.md) | El recetario de la casa: qué es el repo, dónde vive cada cosa, cómo se trabaja, qué no se toca, qué nunca se hace y cómo se comprueba | Documentar | `AGENTS.md`, en la raíz | Bloque 2 |
| [`docs/especificaciones/ESP-00-plantilla.md`](docs/especificaciones/ESP-00-plantilla.md) | La receta de una cosa que se construye: qué debe ser verdad al terminar | Documentar | `docs/especificaciones/` | Bloque 3 |
| [`pruebas/verificar-sitio.sh`](pruebas/verificar-sitio.sh) | Comprueba la página del equipo: que exista, que tenga una tarjeta por perfil, que sus archivos existan y que no descargue nada de fuera salvo las fotos | Probar | `pruebas/` | Bloque 3 (en rojo) y Bloque 5 (en verde) |
| [`docs/guias/revision.md`](docs/guias/revision.md) | Las tres revisiones: quién las hace, cuándo y con qué lista. **Ya viene llena** | Las tres revisiones | `docs/guias/` | Bloques 3, 4 y 5 |
| [`.github/pull_request_template.md`](.github/pull_request_template.md) | La plantilla de PR de GitFlow, ahora con **Cómo lo comprobé** y el registro de las tres revisiones. Reemplaza a la anterior | Las tres revisiones | `.github/` | Bloque 3 (se estrena en el Bloque 4) |
| [`docs/adr/0000-plantilla.md`](docs/adr/0000-plantilla.md) | Una decisión que el agente no debe volver a discutir: el porqué | Documentar | `docs/adr/` | Autoestudio 4 |
| [`docs/riesgos.md`](docs/riesgos.md) | Los riesgos de trabajar con un agente, cómo se notan, cómo se mitigan y en qué momento. **Ya viene lleno** con los generales | Todo el ciclo | `docs/` | Autoestudio 4 |
| [`docs/guias/plantilla-guia.md`](docs/guias/plantilla-guia.md) | Cómo se hace algo concreto en el proyecto | Documentar | `docs/guias/` | Autoestudio 5 |
| [`pruebas/verificar-enlaces.sh`](pruebas/verificar-enlaces.sh) | Comprueba que cada enlace de la documentación lleve a un archivo que existe | Probar | `pruebas/` | Autoestudio 5 |
| [`.github/workflows/comprobaciones.yml`](.github/workflows/comprobaciones.yml) | El robot de GitFlow con trabajo nuevo: corre las comprobaciones en cada PR | Probar | `.github/workflows/` | Autoestudio 5 |
| [`docs/despliegue.md`](docs/despliegue.md) | Dónde se publica, quién despliega, la prueba de humo y cómo se revierte | Desplegar | `docs/` | Autoestudio 5 |

Todas se vuelven a usar en el [proyecto final](../proyecto-final.md). Las plantillas de especificación, ADR y guía se quedan en tu repo aunque ya hayas escrito las tuyas: le dicen al agente qué forma tiene cada tipo de documento, para que no invente una.

---

## <font color="#179287">Qué archivo lee tu agente</font>

`AGENTS.md` es un formato abierto que leen la mayoría de los agentes de código ([agents.md](https://agents.md)). **El que manda es siempre `AGENTS.md`**: si tu agente necesita otro archivo, ese otro archivo solo apunta a `AGENTS.md` y no repite nada.

Cómo lo lee cada agente, y qué hacer si no lo lee solo, está en los [requisitos previos](../requisitos.md#42-cómo-instalarlo), junto con su instalación. Vive en un solo lugar para que no se desactualice en dos.

> Para comprobar que tu agente leyó `AGENTS.md`, pregúntale algo que solo diga ese archivo: *"¿Qué carpeta no puedes tocar en este repositorio?"*.

---

## <font color="#179287">Cómo copiar un archivo</font>

1. Abre el archivo en GitHub y presiona **Copy raw file** (el ícono de copiar, arriba a la derecha del contenido).
2. En tu repo, crea el archivo con la ruta y el nombre de la tabla y pega el contenido.
3. **Solo para los `.sh`:** mira la barra inferior de VS Code. Debe decir **LF**. Si dice **CRLF**, haz clic ahí y elige **LF** antes de guardar: con CRLF el script falla en Git Bash con errores raros como `$'\r': command not found`.

## <font color="#179287">Cómo correr una comprobación</font>

Desde la raíz del repositorio:

```bash
sh pruebas/verificar-sitio.sh
```

En Windows, en una terminal **Git Bash** (en VS Code: flecha junto al **+** de la terminal → **Git Bash**). PowerShell no conoce `sh`.

Cada línea con ✔ o ✘ es una comprobación, y al final dice cuántas fallaron. **Las comprobaciones no se editan para que pasen:** si una falla, se arregla lo construido. Si lo que está mal es la comprobación, el equipo lo discute y la cambia en su propio Pull Request.
