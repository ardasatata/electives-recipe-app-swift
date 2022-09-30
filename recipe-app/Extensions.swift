//
//  Extensions.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension View{
    func detailSection() -> some View{
        self.font(.system(size: Size.medium))
            .foregroundColor(AppColor.PrimaryColor)
    }
}

extension Text{
    func detailMainTitle() -> some View{
        self.font(.system(size: Size.large))
            .foregroundColor(AppColor.PrimaryColor)
            .fontWeight(.bold)
    }
    func detailTitleSection() -> some View{
        self.font(.system(size: Size.large))
            .foregroundColor(AppColor.PrimaryColor)
            .fontWeight(.medium)
    }
}
