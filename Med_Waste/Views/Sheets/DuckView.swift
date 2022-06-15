//
//  DuckView.swift
//  Med_Waste
//
//  Created by Francesco on 13/06/22.
//

import SwiftUI
import AVFoundation

var player : AVAudioPlayer!

//func playSound() {
//    let url = Bundle.main.url(forResource: "quack", withExtension: "mp3")
//    player = try! AVAudioPlayer(contentsOf: url!)
//    player.play()
// }

struct DuckView: View {
    
    var body: some View {
        Image("duck")
            .resizable()
            .scaledToFit()
            .onTapGesture {
//                playSound()
                print("QUACK")
            }
    }
}



struct DuckView_Previews: PreviewProvider {
    static var previews: some View {
        DuckView()
    }
}
