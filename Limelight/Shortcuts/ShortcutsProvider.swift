import AppIntents

@available(iOS 16.0, *)
struct ShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: LaunchAppIntent(),
            phrases: [
                "Launch \(\.$application) in \(.applicationName)",
                "Open \(\.$application) with \(.applicationName)",
            ],
            shortTitle: "Launch an app",
        )
    }
}
