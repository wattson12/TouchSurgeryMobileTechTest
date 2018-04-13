//
//  AppCoordinator.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
        window.backgroundColor = .background
    }

    func start() {
        let procedures: [Procedure] = [
            Procedure.init(identifier: "", name: "Ankle ORIF", icon: "https://content.touchsurgery.com/41/0c/410c97d58c6a95983c4992f2713c19acf5198aa6a76a05dd2602796d59f6f327?Expires=1523710959&Signature=FwWKYi0jD~grfvbfGve0KNwZ73gY5r1aIk4vtE2-yP-OyQoBjFc~TX2Ty2k5ofKH70gqL4tH~JgtDONBPP8b0GgZ-yyvJDurITiYNViYr7~eSUErvitJCgjzUHi8zjjcPs4qcW0~aRaPeT3mHNwo42~ie6Wwf9HottKAUMrgTxfBPgEGfmtObzI2koMLNjkwIwHBUomyk-MvssYkmBJDECzG2fTjHbHaDc-Vgh-O22zoc7PkalVHAw0QhpM6M04OlAr6xaF-O4cf-gij7JDwEheU-vFxRwb5ZZd6yTTbfjokP9fTXMxyyx4bfzAwQdzR4y3PYOCZOJ0B27rkHVPL4g__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ"),
            Procedure.init(identifier: "", name: "Cemented Hip Cup", icon: "https://content.touchsurgery.com/5d/21/5d2178b3c0c2ed2d61197bc3f7f8c3940747af70e99ab51c2058fb55fe12698c?Expires=1523710959&Signature=mP1yH0ubkziCsMjsZnBuWB~BcunhImmos4JlFAsf6UWryYkik9oMcVkv3OyGtfCHBhhemD3Rz4xOr7Uj21giUk31EDyfPv7jEgbc1ypq9wQleNUTt1GFcDXNStfiu9j5uu4gVchy3jkUeBdpNm~JkOutzEX6qEjxx4K2J9sgLZXonvXgIhthgtjz6fKBiXDRXNUGChhIdK7zN5RUfR-khif2fFnzrbsWmEBQJ-VsJJUvqpC7C5iWqVCW0jTEEFttJMwf7UxZ2vm~vEmMnCgA7~X6on1XeOknGE1WxtRMGh4akVbYjGCkqHzdX7UHxcgRK2lgCHUZuYbMU7xdqN~KaA__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ"),
            Procedure.init(identifier: "", name: "Cemented Hip Hemiarthroplasty", icon: "https://content.touchsurgery.com/11/4c/114cbd9508e87d4f6e7d4e1266bfa975b1664489370d5e305646a3724dcd1c0c?Expires=1523710959&Signature=QE3SL6FWyfxC1422vlxgMr~TokqI-2Sz2zi1YJC8h~7VGcpYArMbIh4ZUUza8lAI5RcLDAWA3cPwQvCKy-056IZgR99YEzA4Y7PJ9zIRiKiAv6r3jlpixwxcaO8b3Agx50LQ7Cp~DrR6G6OY9R8Je7QH7aA3~RvgIGTwuzJQVzUHCbBH0gA-gYoYuA0bvaY1T05RL62LIP9GWfUfxVO7Ozw2~aLAFM72ltUC8Do7B65WRVHFTQcRvHIheSKQjp6Pke6s7M5gjjqjUMU99atSAWYVWGebWsUo1RuXjYXR4ELyqFWkbP3AJFBaNtYSj61Hi13jReiI~xVwOAIWX66vVQ__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ")
        ]
        let procedureListViewController = ProcedureListTableViewController(viewModel: ProcedureListViewModel(procedures: procedures))
        let rootNavigationController = UINavigationController(rootViewController: procedureListViewController)

        window.rootViewController = rootNavigationController

        window.makeKeyAndVisible()
    }
}
