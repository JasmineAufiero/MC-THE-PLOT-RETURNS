//
//  FactsCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import SwiftUI

struct FactsCardView: View {
//    all the tips collected so far
    let tips = ["One billion tablets are wasted each year because families buy a bigger quantity then needed",
                "In 20 years, Medicines Collection National Day has collected over 5,600,000 medicines (worth 34 million euros).",
                "Since 2000, every year, on the second Saturday of February, Banco Farmaceutico volunteers, in participating pharmacies, invite citizens to donate mediiness to charitable organizations.",
                "The substances resulting from the bad disposal of medicines, dispersed in the environment, remain for about 21 years, afflicting the sea, food and ourselves.",
                 "In some European countries, the law allows the ashes derived from the combustion of drugs to be used as a substrate for the asphalt of motorways.",
                "The rivers of the world are contaminated: potentially toxic levels of approximately 61 medicines have been found in over 65 rivers around the world.",
                "Eco-friendly sun screens: according to UNWTO, only in tropical seas, 6,000 to 14,000 tons of creams are released, per year, reaching coral reefs.",
                "Expired drugs are burned at very high temperatures: controlled combustion breaks down the active ingredients into basic components that do not pollute the ecosystem.",
                "November 18 is the European day for the conscious use of antibiotics, as part of the World Week of Anti-microbial Awareness promoted by the WHO, November 18-24.",
                 "Before the covid period, the best-selling med in Italy for several years was Tachipirina.",
                 "The average cost of medicines for an Italian citizen is around 482 euros while the total pharmaceutical one is around 21 million euros.",
                 "Each year, about 30% of the 24 billion doses of the drug (eight billion tablets) that hospitals and citizens buy remain unused.",
                 "In 2019, Italy ranked first in Europe for the number of deaths linked to antibiotic resistance (an antibiotic loses its effectiveness in killing a bacterium)."]
    
    let colors: [Color] = [.green, .red, .orange, .blue, .yellow]
    
   
    
    var body: some View {
        
        let randomtip = tips.randomElement()!

           
            
            Text(LocalizedStringKey(String(randomtip))).font(.subheadline).fontWeight(.bold)
                           .foregroundColor(.white)
                           .multilineTextAlignment(.center)
                           .padding(35)
                           .background(colors.randomElement())
                           .cornerRadius(33)
                           .shadow(color: .gray, radius: 2, x: 0, y: 2)
                           

//        }

    }
}

//struct FactsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FactsCardView()
//    }
//}
