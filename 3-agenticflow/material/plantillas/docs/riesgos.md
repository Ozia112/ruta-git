---
tema: riesgos
---

# Registro de riesgos de trabajar con un agente

<!--
  Cópialo a docs/riesgos.md. Ya trae los riesgos generales: borra los que de verdad no
  apliquen, ajusta las mitigaciones a su proyecto y agrega los propios. Cada riesgo
  dice en qué momento se mitiga: el más temprano posible es el más barato.
  Borra este comentario al terminar.
-->

Un riesgo se mitiga en el momento más temprano en que cuesta poco. Antes de escribirle al agente no cuesta nada; en un documento cuesta una línea; en una revisión, una corrección; en producción, una reversa.

| # | Riesgo | Cómo se nota | Cómo lo mitigamos | Momento |
|---|---|---|---|---|
| R1 | **Inventa** datos, archivos, cifras o funciones que no existen | Menciona algo que no encuentras en el repo | Documentos que dicen solo la verdad; *Cuándo preguntar* en `AGENTS.md`; comprobar cada afirmación | Al documentar y en cada revisión |
| R2 | **Decide solo** lo que nadie escribió | Tecnología, estructura o estilo que nadie eligió | *Decisiones ya tomadas* en la especificación; ADR para lo de todo el proyecto | Al documentar (Revisión 1) |
| R3 | Dice **"listo" sin evidencia** | "Ya pasan todas las pruebas" | El probador corre la comprobación; evidencia en el PR | Al probar (Revisión 3) |
| R4 | **Trabajo demasiado grande** para revisarlo | Un PR de miles de líneas | Una especificación por PR; plan antes del código | Al pedir |
| R5 | **Hace de más**: toca lo que no se le pidió | Archivos fuera de alcance en *Files changed* | *Fuera de alcance* en la especificación; *Lo que no se toca* en `AGENTS.md` | Al documentar y en la Revisión 2 |
| R6 | **Debilita o borra pruebas** para que pasen | Cambios en `pruebas/` | `pruebas/` está en *Lo que no se toca*; la Revisión 3 lo revisa | Revisión 3 |
| R7 | Ejecuta **comandos peligrosos** | Pide `git push`, `git reset` o borrar algo | Leer cada permiso; nunca "permitir siempre"; las reglas de `main` | Durante la implementación |
| R8 | **Secretos y datos personales** donde no deben estar | Contraseñas o tokens en el chat, en el código o en un commit | No pegarlos nunca en el chat; `.gitignore`; la Revisión 2 los busca | Antes de escribirle y en la Revisión 2 |
| R9 | **Dependencias que nadie decidió** (o que ni siquiera existen) | Un paquete, framework o CDN nuevo | ADR de dependencias; la Revisión 2 revisa cada una nueva | Al documentar y en la Revisión 2 |
| R10 | **Código que nadie del equipo entiende** | Nadie puede explicar un archivo | Si el revisor no lo puede explicar, no se integra | Revisión 2 |
| R11 | **Código que funciona pero es inseguro** | Acepta cualquier entrada; muestra datos que no debe | Criterios de seguridad y privacidad en la especificación; probar entradas raras | Al documentar y al probar |
| R12 | Obedece **instrucciones escondidas** en lo que lee | Un archivo o una página le pide "ignorar sus instrucciones" | No darle a leer contenido de fuera de confianza con permisos amplios; `AGENTS.md` le dice que se detenga y avise | Durante la implementación |
| R13 | **Olvida lo que se le corrigió** en el chat | Repite un error que ya se había arreglado | La corrección se escribe en el repo (especificación, `AGENTS.md`, aviso), no solo en el chat | Después de cada error |
| R14 | **Algo roto llega a producción** | La dirección publicada falla | Solo se integra lo que pasó las tres revisiones; prueba de humo; Revert | Al desplegar |
| R15 | **El equipo pierde el protagonismo** | Nadie sabe ya por qué el proyecto es como es | El equipo escribe las decisiones y revisa; los papeles rotan | Todo el ciclo |

## Riesgos propios de este proyecto

| # | Riesgo | Cómo se nota | Cómo lo mitigamos | Momento |
|---|---|---|---|---|
| P1 | | | | |
