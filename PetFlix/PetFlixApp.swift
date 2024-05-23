//
//  PetFlixApp.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import SwiftUI

@main
struct PetFlixApp: App {
    var body: some Scene {
        WindowGroup {
            let dataSource = HomeLocalDataSourceImpl()
            let repository = HomeRepositoryImpl(homeDataSource: dataSource)
            let viewModel = HomeViewModel(homeRepository: repository)
            HomeScreen(viewModel: viewModel)
        }
    }
}
