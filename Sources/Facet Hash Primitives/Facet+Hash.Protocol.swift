// Facet+Hash.Protocol.swift
// Conformance of Facet to Hash.Protocol — unconditional.
//
// The `hash(into:)` and `==` witnesses live in the root (Facet.swift). `Facet` is a struct
// (not auto-Hashable), so the stdlib `Hashable` conformance is declared here, guarded
// `#if swift(<6.4)`.

public import Facet_Primitive
public import Hash_Primitives

extension Facet: Hash.`Protocol` {}

#if swift(<6.4)
    extension Facet: Hashable {}
#endif
