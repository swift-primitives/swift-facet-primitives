// Facet+Equation.Protocol.swift
// Conformance of Facet to Equation.Protocol — unconditional.
//
// The `==` witness (axis-major rank) lives in the root (Facet.swift). On Swift 6.4+,
// `Equation.Protocol` is a typealias to `Swift.Equatable` per SE-0499; the stdlib
// `extension Facet: Hashable {}` in `Facet Hash Primitives` (which implies `Equatable`) is
// guarded `#if swift(<6.4)` to avoid duplicate-conformance.

public import Equation_Primitives
public import Facet_Primitive

extension Facet: Equation.`Protocol` {}
