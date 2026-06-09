# ``Facet_Primitives``

@Metadata {
    @DisplayName("Facet Primitives")
    @TitleHeading("Swift Institute — Primitives Layer")
}

The oriented facet — `Facet<N>`, an `Axis<N>` paired with a `Direction` (2N inhabitants).

## Overview

`Facet Primitives` ships ``Facet_Primitive/Facet``, the composition `Axis<N> × Direction`. A facet names one signed face direction of an `N`-dimensional orthotope — in 3D the six faces +X, -X, +Y, -Y, +Z, -Z. It has exactly `2N` inhabitants and is the codimension-1 extreme of the general k-face: an ``Orthant`` fixes a sign on *every* axis, a `Facet` on exactly *one*.

`Facet<N>` conforms to `Finite.Enumerable` (in the `Facet Enumerable Primitives` sub-target), ordered axis-major then direction. The root `Facet Primitive` depends only on the two atom roots `Axis Primitive` and `Direction Primitive`.

## Topics

### Essentials

- <doc:Facet-Scope>

### Core Type

- ``Facet_Primitive/Facet``
