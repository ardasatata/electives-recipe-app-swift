//
//  TopSectionView.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import SwiftUI

struct CategoryButton: View {
    var label: String
    var isSelected: Bool
    
    var body: some View {
        Text(label)
            .font(.system(size: 32))
            .fontWeight(.medium)
            .frame(width: 140, height: 20)
            .foregroundColor(isSelected ? AppColor.AccentColor : AppColor.SecondaryColor)
            .padding(20)
            .background(isSelected ? AppColor.SecondaryColor : AppColor.AccentColor)
//            .cornerRadius(Size.large)
    }
}

struct TopSectionView: View {
    var width: CGFloat
    var height: CGFloat
    var categories: Categories
    var selectedCategory: Int
    
    var onCategoryClick: (Int) -> Void?
    
    var body: some View {
        VStack{
            Spacer()
            Text("What would\nyou cook today?")
                .font(.system(size: 42))
                .fontWeight(.bold)
                .foregroundColor(AppColor.PrimaryColor)
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(categories){ cat in
                        CategoryButton(label: cat.label, isSelected: self.selectedCategory ==  cat.id).onTapGesture {
                            onCategoryClick(cat.id)
                        }
                    }
                }
            }
            Spacer()
        }
            .frame(width: width, height: height)
            .background(AppColor.TertiaryColor)
            .cornerRadius(Size.huge, corners: [.bottomLeft, .bottomRight])
    }
}

struct TopSectionView_Previews: PreviewProvider {
    @State static var recipeservice = RecipeService()
    
    static var previews: some View {
        VStack{
            TopSectionView(width: .infinity, height: 320, categories: recipeservice.categories,
                           selectedCategory: 1,
                           onCategoryClick: { id in print(id) })
            .onAppear{
                Task {
                    try await recipeservice.fetchAllCategories()
                }
            }
            CategoryButton(label: "active", isSelected: false)
            CategoryButton(label: "inactive", isSelected: true)
        }

    }
}
