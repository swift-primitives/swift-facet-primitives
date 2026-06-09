// Facet Tests.swift

import Testing

import Facet_Primitives

// MARK: - Facet - Construction

@Suite
struct `Facet - Construction` {
    @Test
    func `stores axis and direction`() {
        let facet = Facet<3>(axis: .secondary, direction: .negative)
        #expect(facet.axis == Axis<3>.secondary)
        #expect(facet.direction == .negative)
    }
}

// MARK: - Facet - Opposite

@Suite
struct `Facet - Opposite` {
    @Test
    func `opposite flips direction and keeps axis`() {
        let facet = Facet<3>(axis: .tertiary, direction: .positive)
        let opposite = facet.opposite
        #expect(opposite.axis == facet.axis)
        #expect(opposite.direction == .negative)
    }

    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite is involution`(direction: Direction) {
        let facet = Facet<2>(axis: .primary, direction: direction)
        #expect(facet.opposite.opposite == facet)
    }
}

// MARK: - Facet - Conformances

@Suite
struct `Facet - Conformances` {
    @Test
    func `Equatable distinguishes axis and direction`() {
        #expect(
            Facet<2>(axis: .primary, direction: .positive)
                == Facet<2>(axis: .primary, direction: .positive))
        #expect(
            Facet<2>(axis: .primary, direction: .positive)
                != Facet<2>(axis: .primary, direction: .negative))
        #expect(
            Facet<2>(axis: .primary, direction: .positive)
                != Facet<2>(axis: .secondary, direction: .positive))
    }

    @Test
    func `Hashable distinguishes all four 2D facets`() {
        let set: Set<Facet<2>> = [
            Facet(axis: .primary, direction: .positive),
            Facet(axis: .primary, direction: .negative),
            Facet(axis: .secondary, direction: .positive),
            Facet(axis: .secondary, direction: .negative),
            Facet(axis: .primary, direction: .positive),  // duplicate
        ]
        #expect(set.count == 4)
    }
}
