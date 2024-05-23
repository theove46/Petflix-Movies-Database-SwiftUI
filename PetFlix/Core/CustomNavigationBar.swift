//
//  CustomNavigationBar.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import SwiftUI

struct CustomNavigationBarModifier: ViewModifier {
    var title: String

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor.clear 
                appearance.titleTextAttributes = [
                    .foregroundColor: UIColor.clear,
                    .font: UIFont.systemFont(ofSize: 16, weight: .bold)
                ]

                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance

                let backButtonAppearance = UIBarButtonItemAppearance()
                backButtonAppearance.normal.titleTextAttributes = [
                    .foregroundColor: UIColor.white,
                    .font: UIFont.systemFont(ofSize: 16)
                ]

                appearance.backButtonAppearance = backButtonAppearance
            }
    }
}

extension View {
    func customNavigationBar(title: String) -> some View {
        self.modifier(CustomNavigationBarModifier(title: title))
    }
}

