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
            .frame(width: 70, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 4)

            VStack(alignment: .leading, spacing: 6) {
                
                HStack {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.name)
                        .font(.headline)
                        .foregroundColor(.white)
                }

                HStack {
                    Text("Race:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(character.race)")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                }

                HStack {
                    Text("Affiliation:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.affiliation.rawValue)
                        .font(.caption)
                        .foregroundColor(character.affiliation.color)
                }
            }
            .padding(.vertical, 8)

            Spacer()
        }
        .padding()
        .background(Color(.darkGray))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

// MARK: - Preview

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
