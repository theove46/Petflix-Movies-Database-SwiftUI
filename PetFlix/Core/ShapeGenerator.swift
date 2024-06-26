//
//  ShapeGenerator.swift
//  PetFlix
//
//  Created by BS1098 on 21/5/24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

func roundedInfoBox(text: String) -> some View {
        Text(text)
        .font(.caption2)
            .foregroundColor(.white)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.white.opacity(0.5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    )
            )
    }


struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct VisualEffectBlur<Content: View>: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    var content: Content

    init(effect: UIBlurEffect.Style, @ViewBuilder content: () -> Content) {
        self.effect = effect
        self.content = content()
    }

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.contentView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.contentView.bottomAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

 func star(for rating: Double, at index: Int) -> some View {
        let filled = rating / 2.0
        if Double(index) < filled {
            if Double(index + 1) > filled {
                return AnyView(
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                )
            } else {
                return AnyView(
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                )
            }
        } else {
            return AnyView(
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
            )
        }
    }

