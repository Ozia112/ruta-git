---
tema: despliegue
---

# Despliegue

<!--
  Cópiala a docs/despliegue.md y llénala. Dice cómo se publica lo construido, cómo se
  comprueba que quedó bien y cómo se deshace si no. Borra los comentarios al terminar.
-->

## Dónde está publicado

<!-- La dirección pública. Ejemplo: https://[usuario-del-líder].github.io/equipo-[nombre]/ -->

## Qué se despliega y cuándo

<!-- Ejemplo para GitHub Pages desde main: -->

Se publica la rama `main`. Desde que se activó el despliegue, **cada merge a `main` es un despliegue**. Por eso las tres revisiones de la [guía de revisión](guias/revision.md) pasan antes del merge, nunca después.

## Quién despliega

Una persona del equipo, después de la Revisión 3. **El agente nunca despliega**, ni hace push a `main`, ni cambia la configuración del servicio.

## Cómo se comprueba después: la prueba de humo

<!-- Lo mínimo que se revisa en la dirección publicada, en dos minutos, después de cada
     despliegue. Ejemplo: -->

- [ ] La dirección abre sin errores.
- [ ] Se ve el título y una tarjeta por integrante.
- [ ] Las fotos cargan y los enlaces llevan a los perfiles.

Quien la hace deja un comentario en el PR: *"Desplegado y comprobado en [dirección]"*.

## Cómo se revierte

1. En el PR que causó el problema, botón **Revert**. GitHub crea un PR que lo deshace.
2. Ese PR pasa por la Revisión 3 (que se compruebe que vuelve a funcionar) y se integra con **Squash and merge**.
3. Prueba de humo otra vez.
4. El arreglo de verdad vuelve a empezar el ciclo, con su especificación corregida si hacía falta.

Nunca se arregla directo en `main`: las reglas del repo lo impiden, y además el arreglo se saltaría las revisiones.

## Secretos y configuración

<!-- Si el servicio necesita contraseñas o claves, dónde viven (nunca en el repositorio) y
     quién puede verlas. Si no hay ninguna, escribe "No hay secretos". -->
