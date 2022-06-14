//
//  FactsCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import SwiftUI

struct FactsCardView: View {
//    all the tips collected so far
    let tips = ["Circa un miliardo di compresse vengono sprecate ogni anno perché le famiglie acquistano in quantità superiori al necessario", "In 20 anni la Giornata di Raccolta del Farmaco ha raccolto oltre 5.600.000 farmaci (valore 34 milioni di euro).", "Dal 2000, ogni anno, il secondo sabato di febbraio, i volontari di Banco Farmaceutico nelle farmacie aderenti, invitano i cittadini a donare farmaci per enti caritativi.", "Le sostanze derivanti dal cattivo smaltimento di farmaci, disperse nell’ambiente, permangono per circa 21 anni, affliggendo mare, cibo e noi stessi.", "In alcuni Paesi europei la legge permette di usare le ceneri derivate dalla combustione dei farmaci come substrato per l’asfalto di autostrade. ", "I fiumi del mondo sono contaminati: sono stati riscontrati livelli potenzialmente tossici di circa 61 medicinali in oltre 65 fiumi del mondo.", "Creme solari eco friendly: secondo la UNWTO, solo nei mari tropicali, vengono rilasciate dalle 6.000 alle 14.000 tonnellate di creme l’anno raggiungendo le barriere coralline.", "I farmaci scaduti vengono bruciati a temperature altissime: la combustione controllata scompone i principi attivi in componenti di base che non inquinano l’ecosistema", "Il 18 novembre è la giornata europea per un uso consapevole di antibiotici, nell'ambito della Settimana mondiale della consapevolezza anticicrobica promossa dall’OMS, 18-24 novembre.", "Prima del periodo covid il farmaco più venduto in assoluto in Italia, per vari anni, è stata la Tachipirina.", "La spesa media di farmaci per un cittadino italiano è di circa 482 euro mentre quella farmaceutica complessiva è circa 21 milioni di euro.", "Ogni anno, rimane inutilizzato circa il 30% di 24 miliardi di dosi di farmaco (otto miliardi di compresse) che ospedali e cittadini acquistano. ", "Nel 2019, l'Italia si è classificata prima in Europa per numero di morti legato all'antibiotico-resistenza (un antibiotico perde la sua efficacia nell’uccidere un batterio)."]
    
    let colors: [Color] = [.green, .red, .orange, .blue, .yellow]
    
   
    
    var body: some View {
        
        let randomtip = tips.randomElement()!
//        let randomColor = colors.
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(colors.randomElement())
                .opacity(0.6)
//            .fixedSize(horizontal: false, vertical: false)
           
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay( Text(LocalizedStringKey(String(randomtip))).font(.subheadline).fontWeight(.bold)
                .multilineTextAlignment(.center) .padding(35)
//                .foregroundColor(CustomColor.graytext)
                .foregroundColor(.white) )
//            randomize the tip in the summary section
           

        }

    }
}

//struct FactsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FactsCardView()
//    }
//}
