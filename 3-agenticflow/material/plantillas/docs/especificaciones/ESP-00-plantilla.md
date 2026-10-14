---
id: ESP-00
estado: propuesta   # propuesta → aceptada → construida
---

# ESP-00 · [Nombre corto de lo que se construye]

<!--
  Plantilla de especificación. Cópiala con el siguiente número libre
  (ESP-01, ESP-02...) y un nombre corto en kebab-case:
  docs/especificaciones/ESP-01-pagina-del-equipo.md

  Una especificación dice QUÉ debe ser verdad cuando termine el trabajo.
  No dice cómo se van a pasar los días ni cuánto se va a tardar: eso es un plan.

  Borra los comentarios cuando termines.
-->

## Qué es

<!-- Una frase. Si no cabe en una frase, probablemente son dos especificaciones. -->

## Para quién

<!-- Quién lo va a usar o a ver, y qué necesita lograr. -->

## Qué debe mostrar o hacer

<!-- La lista de lo que sí entra. Con datos reales cuando los haya: de dónde salen y
     dónde viven. -->

-

## Decisiones ya tomadas

<!-- Todo lo que el agente decidiría solo si no lo escribes: tecnología, ubicación de
     los archivos, de dónde salen los datos, qué no se usa. Si una decisión vale para
     todo el proyecto y no solo para esta especificación, va en un ADR y aquí se enlaza. -->

-

## Criterios de aceptación

<!-- Numerados. Cada uno tiene que poder responder "¿cómo lo sé?" con un comando o con
     algo que se ve en el navegador. Si no sabes cómo lo comprobarías, reescríbelo:
       ✘ "La página se ve bien en el celular"
       ✔ "Con 360 px de ancho no aparece barra de desplazamiento horizontal"
     Si lo que se construye recibe datos de usuarios o guarda datos de personas, agrega
     criterios de seguridad y privacidad: qué pasa con un dato vacío, muy largo o
     malicioso, y quién puede ver qué. -->

<!-- Si este trabajo no cabe en un PR que se revise en una sentada (como referencia, unas
     400 líneas cambiadas), son dos especificaciones. -->

1.
2.
3.

## Fuera de alcance

<!-- Lo que alguien podría creer que entra y no entra. Es lo que evita que el agente
     haga de más. -->

-

## Cómo se comprueba

<!-- El comando que comprueba lo automático y la lista de lo que se mira a mano. -->

```bash
sh pruebas/[comprobacion].sh
```

A mano, en el navegador:

- [ ] Criterio ...
