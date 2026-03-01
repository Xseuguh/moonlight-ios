//
//  AppIntent.swift
//  MoonlightQuickLaunch
//
//  Created by Hugues Baratgin on 01/03/2026.
//  Copyright © 2026 Moonlight Game Streaming Project. All rights reserved.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
