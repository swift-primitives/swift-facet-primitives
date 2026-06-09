# Facet Scope

The identity surface of `swift-facet-primitives` and what it deliberately excludes.

## Identity

`swift-facet-primitives` provides **the oriented facet** — `Facet<N>`, an `Axis<N>` paired
with a `Direction`, naming one signed face direction of an `N`-dimensional orthotope (`2N`
inhabitants). It is the composition `Axis × Direction`.

## Core targets

- `Facet Primitive` — the `Facet<N>` value type, `.opposite`, and conditional `Codable`.
  Depends only on the atom roots `Axis Primitive` + `Direction Primitive` (the [MOD-017]
  cross-namespace-root case); both are zero-dependency.
- `Facet Enumerable Primitives` — the `Finite.Enumerable` conformance (`2N` inhabitants,
  axis-major ordinal order). Depends on finite + ordinal.

## Out of scope

- The atoms themselves (`Axis<N>`, `Direction`): `swift-axis-primitives`,
  `swift-direction-primitives`.
- The all-axes sign composite `Orthant<N> = Directionᴺ`: `swift-orthant-primitives`.
- The general k-face `Orthotope.Face<N, K>` (of which `Facet` and `Orthant` are the two
  extremes): deferred.
- Named region views (`Compass.Cardinal`, `Boundary.Edge`) and their `.facet` lossless
  projections: the named-view packages plus carrier-projection bridge packages.

## Evaluation rule

Sub-target additions are evaluated against this scope. If a proposed addition is OUT of
scope, it extracts to a sibling package, not into this one.
