//
//  StatCardsCollection.swift
//  Med_Waste
//
//  Created by Irene Fernando on 15/06/22.
//

import SwiftUI

struct StatCardsCollection: View {
    var statsviewmodel : StatsViewModel
    var body: some View {
        
        VStack{
            
            
            StatCardView(Status: "total" , stat :  statsviewmodel.statValue(currentvalue: statsviewmodel.stats[0].value))
            StatCardView(Status: "donated", stat : statsviewmodel.statValue(currentvalue: statsviewmodel.stats[1].value) )
            StatCardView(Status: "expired", stat : statsviewmodel.statValue(currentvalue: statsviewmodel.stats[2].value) )
            
        }
    }
}

//struct StatCardsCollection_Previews: PreviewProvider {
//    static var previews: some View {
//        StatCardsCollection()
//    }
//}
