//
//  NavigationTabView.swift
//  PetFlix
//
//  Created by BS1098 on 23/5/24.
//


import SwiftUI

struct ContentView: View {
    
    init() {
        setupTabBarAppearance()
        setupNavigationBarAppearance()
    }
    
    var body: some View {
        TabView {
            let dataSource = HomeLocalDataSourceImpl()
            let repository = HomeRepositoryImpl(homeDataSource: dataSource)
            let viewModel = HomeViewModel(homeRepository: repository)
            
            HomeScreen(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            HomeScreen(viewModel: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            HomeScreen(viewModel: viewModel)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            HomeScreen(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color(hex: "#000000"))
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor(hex: "#28c7fa")
        itemAppearance.selected.iconColor = UIColor(hex: "#FFFFFF")
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(hex: "#28c7fa")]
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(hex: "#FFFFFF")]
        
        tabBarAppearance.stackedLayoutAppearance = itemAppearance
        tabBarAppearance.inlineLayoutAppearance = itemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    private func setupNavigationBarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(Color(hex: "#000000"))
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}



