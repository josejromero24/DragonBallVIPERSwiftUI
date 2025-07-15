//
//  CharacterRowView.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Item

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

            VStack(alignment: .leading, spacing: 8) {
                Text(character.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                HStack(spacing: 4) {
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.yellow)
                    Text(character.race)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.yellow)
                }

                HStack(spacing: 4) {
                    Image(systemName: "flag.fill")
                        .foregroundColor(character.affiliation.color)
                    Text(character.affiliation.rawValue)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(character.affiliation.color)
                }
            }
            .padding(.vertical, 8)

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors(for: character.race)),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 6)
    }

    // MARK: - Gradient helper

    private func gradientColors(for race: String) -> [Color] {
        switch race {
        case "Saiyan":
            return [Color.orange, Color.red]
        case "Angel":
            return [Color.cyan, Color.blue]
        case "God":
            return [Color.purple, Color.indigo]
        case "Human":
            return [Color.gray, Color.black]
        case "Frieza Race":
            return [Color.purple, Color.pink]
        case "Android":
            return [Color.green, Color.mint]
        default:
            return [Color(.darkGray), Color.gray]
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        let example = Item(
            id: 1,
            name: "Vegeta",
            ki: "54.000.000",
            maxKi: "19.84 Septillion",
            race: "Saiyan",
            gender: .male,
            description: "Príncipe de los Saiyans y orgulloso guerrero.",
            image: "https://dragonball-api.com/characters/vegeta_normal.webp",
            affiliation: .zFighter,
            deletedAt: nil
        )

        CharacterRowView(character: example)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
