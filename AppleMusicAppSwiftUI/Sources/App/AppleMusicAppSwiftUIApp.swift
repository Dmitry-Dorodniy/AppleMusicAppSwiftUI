//
//  AppleMusicAppSwiftUIApp.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

 @main
struct AppleMusicAppSwiftUIApp: App {
   @StateObject var currentMusic = CurrentMusic()
    var body: some Scene {
        WindowGroup {
            GeneralView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                .environmentObject(currentMusic)
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = (connectedScenes.first as? UIWindowScene)?.windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

struct ImageCoversModifier: ViewModifier {
    func body (content: Content) -> some View {
        content
        //            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: (UIScreen.main.bounds.width - 50) / 2,
                   height: 180)
            .cornerRadius(15)
    }
}

extension View{
    func imageCoverStyle() -> some View {
        self.modifier(ImageCoversModifier())
    }
}

