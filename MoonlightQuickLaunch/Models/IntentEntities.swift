import AppIntents
import SwiftUI

enum WidgetLayout: String, AppEnum {
    case small
    case medium
    case large

    static var typeDisplayRepresentation: TypeDisplayRepresentation =
        "Widget layout"

    static var caseDisplayRepresentations:
        [WidgetLayout: DisplayRepresentation] = [
            .small: "Small",
            .medium: "Medium",
            .large: "Large",
        ]
}

enum BackgroundColorOption: String, AppEnum {
    case red, green, orange, blue, yellow, black, gray, white, pink

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Background color"
    static var caseDisplayRepresentations: [BackgroundColorOption: DisplayRepresentation] = [
        .black: "Black",
        .red: "Red",
        .green: "Green",
        .orange: "Orange",
        .blue: "Blue",
        .yellow: "Yellow",
        .gray: "Gray",
        .white: "White",
        .pink: "Pink",
    ]

    var color: Color {
        switch self {
        case .black:
            return .black
        case .red:
            return .red
        case .green:
            return .green
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .gray:
            return .gray
        case .white:
            return .white
        case .pink:
            return .pink
        }
    }
}
