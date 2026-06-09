// Facet+Finite.Enumerable.swift
// Finite.Enumerable conformance for Facet<N> (2N inhabitants).

import Axis_Primitive
import Direction_Primitive
import Facet_Primitive
import Finite_Primitives
import Ordinal_Primitives

// MARK: - Facet: Finite.Enumerable

extension Facet: Finite.Enumerable {
    /// The number of facets of an N-dimensional orthotope: `2N` (`N` axes × 2 directions).
    @inlinable
    public static var count: Cardinal { Cardinal(integerLiteral: UInt(2 * N)) }

    /// Ordinal of this facet in `0..<2N`, ordered axis-major then direction
    /// (`+axis0`, `-axis0`, `+axis1`, `-axis1`, …).
    @inlinable
    public var ordinal: Ordinal {
        let directionBit = direction == .positive ? 0 : 1
        return Ordinal(UInt8(2 * axis.underlying + directionBit))
    }

    /// Reconstructs a facet from its ordinal without bounds checking.
    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        let value = Int(bitPattern: ordinal)
        let direction: Direction = (value % 2 == 0) ? .positive : .negative
        self.init(axis: Axis(_unchecked: (), value / 2), direction: direction)
    }
}
