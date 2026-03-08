import AppIntents
import UIKit

@available(iOS 16.0, *)
struct LaunchAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Launch an app"
    static var description = IntentDescription("Open one of your available apps.")

    static var openAppWhenRun: Bool = true

    @Parameter(title: "App")
    var application: ApplicationEntity

    @available(iOS 19.0, *)
    static var supportedModes: IntentModes = .foreground

    func perform() async throws -> some IntentResult {
        var components = URLComponents()
        components.scheme = "moonlight"
        components.host = "launch"
        components.queryItems = [
            URLQueryItem(name: "host", value: application.hostUUID),
            URLQueryItem(name: "app", value: application.id),
        ]

        guard let url = components.url else {
            return .result()
        }
        
        await UIApplication.shared.open(url)
        return .result()
    }
}
