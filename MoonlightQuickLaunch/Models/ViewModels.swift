struct WidgetApp: Identifiable {
    var id: String { "\(host.uuid)-\(app.id)" }
    let app: AppPayload
    let host: HostPayload
}
