// Facet+Comparison.Protocol.swift
// Conformance of Facet to Comparison.Protocol — unconditional.
//
// The `<` / `<=` / `>` / `>=` witnesses live in the root (Facet.swift). On Swift 6.4+,
// `Comparison.Protocol` is a typealias to `Swift.Comparable` per SE-0499. The stdlib
// `extension Facet: Comparable {}` below is guarded `#if swift(<6.4)`.

public import Comparison_Primitives
public import Facet_Primitive

extension Facet: Comparison.`Protocol` {}

#if swift(<6.4)
    extension Facet: Comparable {}
#endif
