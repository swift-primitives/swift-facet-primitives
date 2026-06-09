# swift-facet-primitives

The oriented facet for the Swift Institute primitives layer.

`Facet<N>` pairs an `Axis<N>` with a `Direction` — one signed face direction of an
`N`-dimensional orthotope. In 3D those are the six faces +X, -X, +Y, -Y, +Z, -Z (`2N`
inhabitants). It is the composition `Axis × Direction`.

```swift
import Facet_Primitives

let posX = Facet<3>(axis: .primary, direction: .positive)   // +X face
let negX = posX.opposite                                    // -X face

Facet<3>.count                 // 6
for f in Facet<2>.allCases { print(f.ordinal) }  // 0, 1, 2, 3
```

The root `Facet Primitive` depends only on the two atom roots `Axis Primitive` and
`Direction Primitive` (both zero-dependency). The `Finite.Enumerable` conformance lives in
`Facet Enumerable Primitives`.

The all-axes-sign sibling `Orthant<N> = Directionᴺ` lives in `swift-orthant-primitives`.

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
