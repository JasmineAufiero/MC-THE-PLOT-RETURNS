//
//  CustomColors.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//

import Foundation
import SwiftUI


struct CustomColor {
    static let darkblue = Color("DarkBlue")
    static let medcardgray = Color("MedCardGray")
    static let graytext = Color("GreyText")
    static let expiredred = Color("ExpiredRed")
    static let donnatedgreen = Color("DonatedGreen")
    static let blueform = Color("BlueForm")
    static let redform = Color("RedForm")
}


extension Color{
    static let systemBlue = Color(UIColor.systemBlue)
       static let systemPurple = Color(UIColor.systemPurple)
       static let systemGreen = Color(UIColor.systemGreen)
       static let systemYellow = Color(UIColor.systemYellow)
       static let systemOrange = Color(UIColor.systemOrange)
       static let systemPink = Color(UIColor.systemPink)
       static let systemRed = Color(UIColor.systemRed)
       static let systemTeal = Color(UIColor.systemTeal)
       static let systemIndigo = Color(UIColor.systemIndigo)
}


class Theme {
    static func navigationBarColors( titleColor : UIColor? = nil ){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
    }
}
        








//  EXTRA ARGUMENTS FOR THE TITLE BAR THEME
//        background : UIColor?,
//       , tintColor : UIColor? = nil
        
//        navigationAppearance.configureWithOpaqueBackground()
//        navigationAppearance.backgroundColor = background ?? .clear
        
        
//        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? CustomColor.darkblue]
//
//        UINavigationBar.appearance().standardAppearance = navigationAppearance
//        UINavigationBar.appearance().compactAppearance = navigationAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
//
////        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black

