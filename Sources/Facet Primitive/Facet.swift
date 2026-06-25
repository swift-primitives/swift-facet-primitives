// Facet.swift
// An oriented face of an N-dimensional orthotope: an axis paired with a direction.

import Axis_Primitive
import Direction_Primitive

/// An oriented facet of an N-dimensional orthotope: one `Axis<N>` paired with a `Direction`.
///
/// `Facet<N>` names a signed face direction — e.g. in 3D the six faces +X, -X, +Y, -Y, +Z,
/// -Z. It has exactly `2N` inhabitants (`N` axes × 2 directions) and is the codimension-1
/// extreme of the general k-face: an `Orthant<N>` fixes a sign on *every* axis, whereas a
/// `Facet<N>` fixes a sign on exactly *one*.
///
/// Equality, hashing, and ordering are provided through the institute twins
/// `Equation.Protocol` / `Hash.Protocol` / `Comparison.Protocol` (in the
/// `Facet Equation/Hash/Comparison Primitives` sub-targets), ordered by the axis-major
/// rank that also indexes ``Facet`` under `Finite.Enumerable`.
///
/// ## Example
///
/// ```swift
/// let posX = Facet<3>(axis: .primary, direction: .positive)   // +X face
/// let negX = posX.opposite                                    // -X face
/// ```
public struct Facet<let N: Int>: Sendable {
    /// The axis this facet is normal to.
    public let axis: Axis<N>

    /// The direction along that axis.
    public let direction: Direction

    /// Creates a facet from an axis and a direction.
    @inlinable
    public init(axis: Axis<N>, direction: Direction) {
        self.axis = axis
        self.direction = direction
    }
}

// MARK: - Opposite

extension Facet {
    /// The opposite facet: the same axis with the flipped direction.
    @inlinable
    public var opposite: Facet {
        Facet(axis: axis, direction: direction.opposite)
    }
}

// MARK: - Equality, Hashing, Ordering

// The full ==/</<=/>/>= operator set + hash(into:) is declared here in the type's own
// module so it witnesses both any stdlib conformance and the institute
// `Equation.Protocol` / `Hash.Protocol` / `Comparison.Protocol` twins. Facets order by the
// axis-major rank in `0..<2N` (positive before negative), which is a bijection onto the
// facets and equals the `Finite.Enumerable` ordinal.

extension Facet {
    @usableFromInline
    var _rank: Int { 2 * axis.underlying + (direction == .positive ? 0 : 1) }

    /// Two facets are equal when they share the same axis-major rank.
    @inlinable
    public static func == (lhs: Facet, rhs: Facet) -> Bool { lhs._rank == rhs._rank }

    /// Orders facets by ascending axis-major rank.
    @inlinable
    public static func < (lhs: Facet, rhs: Facet) -> Bool { lhs._rank < rhs._rank }

    /// Orders facets by axis-major rank, treating equal ranks as ordered.
    @inlinable
    public static func <= (lhs: Facet, rhs: Facet) -> Bool { lhs._rank <= rhs._rank }

    /// Orders facets by descending axis-major rank.
    @inlinable
    public static func > (lhs: Facet, rhs: Facet) -> Bool { lhs._rank > rhs._rank }

    /// Orders facets by descending axis-major rank, treating equal ranks as ordered.
    @inlinable
    public static func >= (lhs: Facet, rhs: Facet) -> Bool { lhs._rank >= rhs._rank }

    /// Hashes the facet by feeding its axis-major rank into the hasher.
    @inlinable
    public func hash(into hasher: inout Hasher) { hasher.combine(_rank) }
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Facet: Codable {}
#endif
