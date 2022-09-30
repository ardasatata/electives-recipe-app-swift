//
//  RecipeService.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import Foundation

class RecipeService: ObservableObject {
    
    @Published var categories: Categories = []
    @Published var recipes: Recipes = []
    
    init() {
        Task(priority: .medium){
            try? await fetchRecipesByCategory(categoryId: 1)
        }
    }
    
    func fetchAllCategories() async throws {
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json")
                    else {
                        print("Json file not found")
                        return
                    }
                
        let data = try? Data(contentsOf: url)
        let categories = try? JSONDecoder().decode(Categories.self, from: data!)
        self.categories = categories!
        print(self.categories)
    }
    
    func fetchRecipesByCategory(categoryId: Int) async throws {
        var categoryLabel = ""
        
        switch(categoryId){
        case 1:
            categoryLabel = "breakfast"
        case 2:
            categoryLabel = "lunch"
        case 3:
            categoryLabel = "dinner"
        case 4:
            categoryLabel = "dessert"
        default:
            categoryLabel = ""
        }
        
        
        guard let url = Bundle.main.url(forResource: categoryLabel, withExtension: "json")
                    else {
                        print("Json file not found")
                        return
                    }
                
        let data = try? Data(contentsOf: url)
        let recipes = try? JSONDecoder().decode(Recipes.self, from: data!)
        self.recipes = recipes!
        print(self.recipes)
    }
    
//    func mockDetailData() -> Recipe {
//        let dataString = "\"{\"id\":1,\"name\":\"Omelette\",\"time\":5,\"difficulty\":\"Easy\",\"calories\":120,\"ingredients\":[\"3eggs,beaten\",\"1tspsunfloweroil\",\"1tspbutter\"],\"steps\":[\"Seasonthebeateneggswellwithsaltandpepper.Heattheoilandbutterinanon-stickfryingpanoveramedium-lowheatuntilthebutterhasmeltedandisfoaming.\",\"Pourtheeggsintothepan,tiltthepaneversoslightlyfromonesidetoanothertoallowtheeggstoswirlandcoverthesurfaceofthepancompletely.Letthemixturecookforabout20secondsthenscrapealinethroughthemiddlewithaspatula.\",\"Tiltthepanagaintoallowittofillbackupwiththerunnyegg.Repeatonceortwicemoreuntiltheegghasjustset.\",\"Atthispointyoucanfilltheomelettewithwhateveryoulike–somegratedcheese,slicedham,freshherbs,sautéedmushroomsorsmokedsalmonallworkwell.Scatterthefillingoverthetopoftheomeletteandfoldgentlyinhalfwiththespatula.Slideontoaplatetoserve.\"],\"image\":\"https://user-images.githubusercontent.com/17568508/192869178-b09954dc-7dcf-4cb4-865d-6fcee6a1d005.png\"}\""
//        let data = dataString.data(using: .utf8)!
//
//        do {
//            return try JSONSerialization.jsonObject(with: data, options : .allowFragments) as! Recipe
//        } catch let error as NSError {
//            print(error)
//        }
//        return nil
//    }
}
