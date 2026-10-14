---
tema: revisión
---

# Guía: cómo se revisa en este equipo

<!--
  Esta guía ya viene llena: cópiala a docs/guias/revision.md y ajústala a su equipo
  por PR, como cualquier otro documento.
  Si todavía no tienen docs/despliegue.md o docs/riesgos.md, borren las líneas que los
  mencionan y vuelvan a ponerlas cuando existan: todo lo que dice tiene que ser verdad hoy.
  Borra este comentario.
-->

## Cuándo se usa

Úsala cada vez que revises un Pull Request y antes de pedir una revisión. El agente también la usa para revisar su trabajo antes de entregarlo, pero **su revisión nunca sustituye a la de una persona**.

## Qué manda

Las especificaciones y los ADR mandan sobre esta guía. Aquí se revisa que se cumplan; no se vuelven a decidir.

## El ciclo y sus tres revisiones

```text
Documentar → Revisión 1 → Implementar → Revisión 2 → Probar → Revisión 3 → Desplegar
```

| Revisión | Cuándo | Quién la hace | Cómo queda en GitHub |
|---|---|---|---|
| **1 · Documentos** | Antes de construir | Alguien que no escribió los documentos | *Approve* o *Request changes* en el PR de documentos |
| **2 · Implementación** | Cuando el agente termina, antes de probar | El **revisor**, nunca el piloto | *Comment* o *Request changes* en el PR de implementación |
| **3 · Pruebas** | Después de probar, antes de desplegar | Alguien que no construyó ni probó | *Approve* en el mismo PR, con la evidencia del **probador** |

**La regla que ordena todo:** quien construye no prueba ni aprueba su propio trabajo.

**Cómo se deja constancia:** quien revisa copia la lista de su revisión en el comentario de la revisión y marca cada punto. Lo que no marque lo explica en una línea.

---

## Revisión 1 · Documentos

- [ ] Todo lo que dicen es verdad hoy. Ninguna afirmación sin forma de comprobarla.
- [ ] Cada criterio de aceptación dice cómo se comprueba.
- [ ] Lo que el agente decidiría solo está escrito: tecnología, dónde van los archivos, de dónde salen los datos y qué dependencias se permiten.
- [ ] Existe **Fuera de alcance**.
- [ ] Lo que se va a construir cabe en un PR que se revisa en una sentada (como referencia, unas 400 líneas cambiadas).
- [ ] No repite ni contradice otro documento: lo enlaza.
- [ ] Si lo que se construye recibe datos de usuarios o datos de personas, hay criterios de seguridad y privacidad.
- [ ] La comprobación existe, prueba los criterios que dice probar y hoy está en rojo (su salida está en el PR). Todavía no entra al robot: entra con la implementación.

## Revisión 2 · Implementación

- [ ] El PR construye **una** especificación y cabe en una sentada.
- [ ] En **Files changed** solo aparecen archivos que la especificación pide, y nada de **Lo que no se toca**.
- [ ] Ninguna dependencia nueva (paquete, framework, CDN) que no esté decidida en un documento.
- [ ] Ningún secreto, contraseña, token ni dato personal nuevo.
- [ ] Puedo explicar qué hace cada archivo. Si no, se pide que se simplifique o que se explique en el PR.
- [ ] Probé mentalmente lo raro: ¿qué pasa con un dato vacío, muy largo o malicioso?
- [ ] Los commits siguen nuestro formato y citan la especificación.
- [ ] El robot está en verde.

## Revisión 3 · Pruebas

- [ ] El **probador** (no el piloto ni el agente) corrió la comprobación automática, y su salida está en el PR.
- [ ] Cada criterio de aceptación tiene su resultado, ✔ o ✘, con la evidencia de cómo se comprobó.
- [ ] Nadie debilitó ni borró pruebas: **Files changed** no toca `pruebas/`, o el cambio se discutió y se aprobó aparte.
- [ ] Si el agente escribió pruebas nuevas, prueban los criterios: fallarían si el criterio no se cumpliera.
- [ ] Si la especificación trae una comprobación automática, el robot ya la corre en este PR, en verde.
- [ ] La especificación dice `estado: construida`.

## Despliegue

- [ ] Las tres revisiones están en el PR antes del merge. Una vez activado el despliegue, **cada merge a `main` es un despliegue**.
- [ ] Después del merge, la prueba de humo en la dirección publicada (la lista está en `docs/despliegue.md`).
- [ ] Si algo falla en producción: **Revert** del PR y otra vuelta al ciclo. Nunca un arreglo directo en `main`.

---

## Lo que no es de esta guía

- Qué se construye y cuándo está terminado: la especificación.
- Cómo se despliega y se revierte paso a paso: `docs/despliegue.md`.
- Qué puede salir mal al trabajar con un agente y en qué momento se previene: `docs/riesgos.md`.
