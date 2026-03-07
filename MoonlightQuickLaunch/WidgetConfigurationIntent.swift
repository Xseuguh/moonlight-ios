import AppIntents
import Foundation
import WidgetKit

struct ConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Moonlight" }
    static var description = IntentDescription(
        "Choose the applications to display on the widget."
    )

    @Parameter(
        title: "Applications",
        size: [
            IntentWidgetFamily.systemSmall: IntentCollectionSize(min: 0, max: 1),
            IntentWidgetFamily.systemMedium: IntentCollectionSize(min: 0, max: 3),
            IntentWidgetFamily.systemLarge: IntentCollectionSize(min: 0, max: 6),
        ]
    )
    var applications: [ApplicationEntity]?

    var selectedApplications: [ApplicationEntity] {
        var seen = Set<ApplicationEntity.ID>()

        return (applications ?? []).filter { app in
            seen.insert(app.id).inserted
        }
    }
}
