//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Teemo Norman on 7/21/21.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModel: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            //MARK: - CARD IMAGE
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                            .font(Font.title.weight(.bold))
                            .foregroundColor(Color.white)
                            .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0.0, y: 0.0)
                                .padding(.trailing, 20)
                                .padding(.top, 22)
                            Spacer()
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                //MARK: - TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                
                //MARK: - HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(Color.gray)
                    .italic()
                
                
                //MARK: - RATES
                RecipeRatingView(recipe: recipe)
                
                //MARK: - COOKING
                RecipeCookingView(recipe: recipe)
                
                
            } // MAINVSTACK
            .padding()
            .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0.0, y: 0.0)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModel = true
        }
        .sheet(isPresented: self.$showModel) {
            RecipeDetailView(recipe: self.recipe)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[1])
            .previewLayout(.sizeThatFits)
    }
}
