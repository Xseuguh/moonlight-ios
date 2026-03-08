import AppIntents
import UIKit

@available(iOS 16.0, tvOS 16.0, *)
struct ApplicationEntity: AppEntity, Identifiable, Hashable {
    static var typeDisplayRepresentation: TypeDisplayRepresentation =
        "Application"

    var id: String
    var name: String
    var hostName: String
    var hostUUID: String

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(name)",
            subtitle: "\(hostName)"
        )
    }

    static var defaultQuery = ApplicationEntityQuery()

    init(host: HostPayload, app: AppPayload) {
        id = app.id
        name = app.name
        hostName = host.name
        hostUUID = host.uuid
    }
}

@available(iOS 16.0, tvOS 16.0, *)
struct ApplicationEntityQuery: EntityQuery {
    func suggestedEntities() async throws -> [ApplicationEntity] {
        try sortedApps()
    }

    func entities(for identifiers: [ApplicationEntity.ID]) async throws
        -> [ApplicationEntity]
    {
        let all = try sortedApps()
        let wanted = Set(identifiers)
        return all.filter { wanted.contains($0.id) }
    }

    private func sortedApps() throws -> [ApplicationEntity] {
        let hosts = WidgetSnapshotStore.getHosts()

        let applications = hosts.flatMap { host in
            host.apps.map { app in
                ApplicationEntity(host: host, app: app)
            }
        }
        .sorted(by: sortApplications)

        return applications
    }

    private func sortApplications(
        _ a: ApplicationEntity,
        _ b: ApplicationEntity
    ) -> Bool {
        if a.hostName == b.hostName {
            return a.name.localizedCaseInsensitiveCompare(b.name)
                == .orderedAscending
        }
        return a.hostName.localizedCaseInsensitiveCompare(b.hostName)
            == .orderedAscending
    }
}
