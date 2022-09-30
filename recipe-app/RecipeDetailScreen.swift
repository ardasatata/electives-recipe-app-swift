//
//  RecipeDetailScreen.swift
//  recipe-app
//
//  Created by Arda on 9/30/22.
//

import SwiftUI

struct RecipeDetailScreen: View {
    var recipe: Recipe
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "arrow.turn.up.left")
                            .font(.system(size: Size.medium))
                            .foregroundColor(AppColor.PrimaryColor)
                            .onTapGesture {
                                self.presentation.wrappedValue.dismiss()
                            }
                        Spacer()
                    }.padding()
                    VStack{
                        Text(recipe.name)
                            .detailMainTitle()
                        AsyncImage(url: URL(string: recipe.image),content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: .infinity, maxHeight: 240)
                        },
                        placeholder: {
                            Text("loading")
                        })
                    }
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "clock")
                                .detailSection()
                                .frame(width: 24)
                            Text("\(recipe.time) min")
                                .detailSection()
                        }
                        HStack{
                            Image(systemName: "fork.knife")
                                .detailSection()
                                .frame(width: 24)
                            Text(recipe.difficulty)
                                .detailSection()
                        }
                        HStack{
                            Image(systemName: "heart")
                                .detailSection()
                                .frame(width: 24)
                            Text(String(recipe.calories))
                                .detailSection()
                        }
                    }.padding()
                    
                    VStack(alignment: .leading){
                        Text("Ingredients")
                            .detailTitleSection()
                        ForEach(recipe.ingredients, id: \.self ){ item in
                            Text("• \(item)")
                                .detailSection()
                        }
                    }.padding()
                    
                    VStack(alignment: .leading){
                        Text("Steps")
                            .detailTitleSection()
                        ForEach(0 ..< recipe.steps.count){ index in
                            Text("\(String((index+1))). \(recipe.steps[index])")
                                .detailSection()
                        }
                    }.padding()
                    
                }
            }
            .background(AppColor.AccentColor)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}
