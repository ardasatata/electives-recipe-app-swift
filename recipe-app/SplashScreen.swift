//
//  ContentView.swift
//  recipe-app
//
//  Created by Arda on 9/25/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isLoading = true
    
    private let icon : some View = Image(systemName: "fork.knife")
        .font(.system(size: Size.huge * 2))
        .foregroundColor(AppColor.PrimaryColor)
    
    var body: some View {
        if (isLoading) {
            VStack(){
                icon
                Text("CookIt")
                    .font(.system(size: Size.huge))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("PrimaryColor"))
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColor.AccentColor)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isLoading = false
                }
            }
        } else {
            ListScreen()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .previewDevice("iPhone 12")
    }
}
