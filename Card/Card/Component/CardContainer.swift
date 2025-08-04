import SwiftUI

public struct CardContainer<Content: View>: View {
    public var body: some View {
        content
            .padding(appearance.padding)
            .background(appearance.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: backgroundCornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: backgroundCornerRadius)
                    .stroke(appearance.strokeColor, lineWidth: appearance.strokeWidth)
            )
    }

    private let backgroundCornerRadius: CGFloat
    private let content: Content

    @Environment(\.cardContainerAppearance) private var appearance

    public init(backgroundCornerRadius: CGFloat = 10, @ViewBuilder content: () -> Content) {
        self.backgroundCornerRadius = backgroundCornerRadius
        self.content = content()
    }
}
