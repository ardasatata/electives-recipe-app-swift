//
//  recipe_appApp.swift
//  recipe-app
//
//  Created by Arda on 9/25/22.
//

import SwiftUI

@main
struct recipe_appApp: App {
    
    let recipeservice = RecipeService()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen().environmentObject(recipeservice)
        }
    }
}

struct MainApp_Previews: PreviewProvider {
    @State static var recipeservice = RecipeService()
    static var previews: some View {
        SplashScreen()
            .environmentObject(recipeservice)
            .previewDevice("iPhone 12")
    }
}
