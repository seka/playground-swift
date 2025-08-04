import SwiftUI

// MARK: - Appearance definitions

public protocol CardContainerAppearance: Sendable {
    var padding: EdgeInsets { get }
    var backgroundColor: Color { get }
    var strokeColor: Color { get }
    var strokeWidth: CGFloat { get }
}

public struct DefaultCardContainerAppearance: CardContainerAppearance {
    public let padding: EdgeInsets
    public let backgroundColor: Color
    public let strokeColor: Color
    public let strokeWidth: CGFloat

    public init(spacing: CGFloat, backgroundColor: Color, strokeColor: Color = Color.clear, strokeWidth: CGFloat = 0) {
        padding = EdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        self.backgroundColor = backgroundColor
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor
    }

    public static let `default` = DefaultCardContainerAppearance(spacing: 16, backgroundColor: Color.gray)
}

// MARK: - Appearance environment definitions

struct CardContainerAppearanceEnvironmentKey: EnvironmentKey {
    public typealias Value = CardContainerAppearance

    public static let defaultValue: any Value = DefaultCardContainerAppearance.default
}

public extension EnvironmentValues {
    var cardContainerAppearance: any CardContainerAppearance {
        get {
            self[CardContainerAppearanceEnvironmentKey.self]
        }
        set {
            self[CardContainerAppearanceEnvironmentKey.self] = newValue
        }
    }
}

public extension View {
    func cardContainerAppearance(_ appearance: any CardContainerAppearance) -> some View {
        environment(\.cardContainerAppearance, appearance)
    }
}
