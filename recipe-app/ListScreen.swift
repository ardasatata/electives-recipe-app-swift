//
//  ListScreen.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import SwiftUI

struct ListScreen: View {
    
    @EnvironmentObject private var recipeservice: RecipeService
    
    @State private var selectedCategory: Int = 1
    
    var body: some View {
        NavigationView {
            GeometryReader { metrics in
                VStack{
                    TopSectionView(width: metrics.size.width, height: metrics.size.height * 0.35 , categories: recipeservice.categories,
                                   selectedCategory: selectedCategory,
                                   onCategoryClick: { id in selectedCategory = id })
                    VStack{
                        ScrollView(showsIndicators: false) {
                            VStack{
                                ForEach(recipeservice.recipes){ recipe in
                                    NavigationLink(destination: RecipeDetailScreen(recipe: recipe)
                                        .navigationBarTitle("", displayMode: .inline)
                                        .navigationBarHidden(true)){
                                        VStack{
                                            HStack{
                                                Text(recipe.name)
                                                    .font(.system(size: 32))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(AppColor.AccentColor)
                                                Spacer()
                                            }
                                            Spacer()
                                            HStack{
                                                Text(String(recipe.time))
                                                    .font(.system(size: 24))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(AppColor.AccentColor)
                                                Spacer()
                                                Text(recipe.difficulty)
                                                    .font(.system(size: 24))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(AppColor.AccentColor)
                                            }
                                        }
                                        .frame(maxWidth: .infinity, minHeight: 64, alignment: .topLeading)
                                        .padding()
                                        .background(AppColor.PrimaryColor)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 24.0)
                        Spacer()
                    }
                    .frame(width: metrics.size.width, height: .infinity)
                }
                .background(AppColor.AccentColor)
            }
            .ignoresSafeArea()
            .onAppear{
                Task {
                    try? await recipeservice.fetchAllCategories()
                    try? await recipeservice.fetchRecipesByCategory(categoryId: selectedCategory)
                }
            }
            .onChange(of: selectedCategory, perform: { _ in
                print(String(selectedCategory))
                Task {
                    try? await recipeservice.fetchRecipesByCategory(categoryId: selectedCategory)
                }
            })
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    @State static var recipeservice = RecipeService()
    
    static var previews: some View {
        ListScreen()
            .environmentObject(recipeservice)
            .previewDevice("iPhone 12")
    }
}
