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
/// ## Example
///
/// ```swift
/// let posX = Facet<3>(axis: .primary, direction: .positive)   // +X face
/// let negX = posX.opposite                                    // -X face
/// ```
public struct Facet<let N: Int>: Sendable, Hashable {
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

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Facet: Codable {}
#endif
