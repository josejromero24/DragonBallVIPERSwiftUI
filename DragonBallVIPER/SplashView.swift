//
//  SplashView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 15/7/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("SplashImage")
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
