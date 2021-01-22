//
//  ApplicationCoordinator.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/20/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import SwiftEntryKit

class ApplicationCoordinator: Coordinator {

    let window: UIWindow
    var device = UIDevice.current.screenType
    var attributes: EKAttributes = EKAttributes()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupTopViewController()
    }
}
