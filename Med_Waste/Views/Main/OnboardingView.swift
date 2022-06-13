//
//  OnboardingView.swift
//  Med_Waste
//
//  Created by Rosa Cimmino on 08/06/22.
//

import SwiftUI

struct Onboarding: View {
    @Binding var onboarding: Bool   //la devo apssare a tutte le onboaridng how it works e allo skipe deve divenatre true
    @State var onboardingState : Int = 1
    var body: some View {
        
//        onbording values meaning
//        1 is the first screen about taking care of nature
//        2 is the second screeen about not wasting money
//        3 is the third screen about the medicines
//        4 is the first screen of the section 'how it works' it describes the ...... feature
//        5 is the second screen of the section 'how it work' it describes the ....... feature
        
          
            switch onboardingState {
            case 1:
                OnboardingAwareness(onboardingState: $onboardingState, onboarding: $onboarding, immagine: Image("nature"))
            case 2:
                OnboardingAwareness(onboardingState: $onboardingState, onboarding: $onboarding, immagine: Image("savings"))
            case 3:
                OnboardingAwareness(onboardingState: $onboardingState, onboarding: $onboarding, immagine: Image("medicines"))
            case 4 :
                OnboardingHowItWorks(onboardingState: $onboardingState, onBoardingFatto: $onboarding)
            default:
                OnboardingHowItWorks(onboardingState: $onboardingState, onBoardingFatto: $onboarding)
            }

    }
}

struct OnboardingAwareness : View{
        @Binding var onboardingState : Int
    @Binding var onboarding: Bool
        var immagine : Image
        var body: some View{
            VStack{
                HStack{
                    Text("Skip")
                        .foregroundColor(CustomColor.graytext)
                }
                .onTapGesture {
                    onboardingState = 4
                }
                .frame(width: UIScreen.screenWidth-50, height: 50, alignment: .trailing)
                
                immagine
                    .resizable()
                    .scaledToFit()
                //            .ignoresSafeArea(.all, edges: .top)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.5, alignment: .center)
                   
                Text("\(onboardingState)/6")
                    .opacity(0.3)
                
                BottoneContinue(onboardingstate: $onboardingState, ONBoardingDone: $onboarding)
            }
        }
    }


struct OnboardingHowItWorks : View{
        @Binding var onboardingState : Int
    @Binding var onBoardingFatto : Bool
      
    @ObservedObject var statsviewmodel = StatsViewModel()
    
    
    
    
    
    func createStatInstances(){
    statsviewmodel.addStatData(index: 0, name: "Total", color: "BlueForm", value: 0.0)
    statsviewmodel.addStatData(index: 1, name: "Donabili", color: "DonatedGreen", value: 0.0)
    statsviewmodel.addStatData(index: 2, name: "Scaduti", color: "ExpiredRed", value: 0.0)
    statsviewmodel.addStatData(index: 3, name: "InScadenza", color: "RedForm", value: 0.0)
    }
    
        var body: some View{
            VStack {
                HStack{
                    Text("Skip")
                        .foregroundColor(CustomColor.graytext)
                }
                .onTapGesture {
                    
                  createStatInstances()
                    onBoardingFatto = true
                }
                .frame(width: UIScreen.screenWidth-50, height: 50, alignment: .trailing)
                
        
                switch onboardingState {
                case 4:
                    Image("medicines")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.5, alignment: .center)
                        .transition(AnyTransition.slide)
                       
                    
                case 5:
                    Image("nature")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.5, alignment: .center)
                        .transition(AnyTransition.slide)
                        
                    
                default:
                    Image("medicines")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.5, alignment: .center)
                }
                   
                Text("\(onboardingState)/6")
                    .opacity(0.3)
                   
                BottoneContinue(onboardingstate: $onboardingState, ONBoardingDone: $onBoardingFatto)
            }.onAppear{
                
            }
        }
    }

struct BottoneContinue : View{
    @Binding var onboardingstate : Int
    @Binding var ONBoardingDone : Bool
   
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .foregroundColor(CustomColor.blueform)
            .frame(width: UIScreen.screenWidth-50, height: 80, alignment: .center)
        
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay( VStack(alignment: .center, spacing: 10){
                
            if(onboardingstate < 4){
                
            Text("Continua") //.font(.subheadline)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            } else {
            Text("Prossimo") //.font(.subheadline)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
            }
            }.padding()
            )
            .onTapGesture {
                if (onboardingstate == 6){ //ultimo valore dlel'onboarding
                   
                     
                    
                    OnboardingHowItWorks(onboardingState: $onboardingstate, onBoardingFatto: $ONBoardingDone).createStatInstances()
                    ONBoardingDone = true //serve per aggiornare l avaribile per l'onboarding  first launch
                } else {
                onboardingstate += 1
            }
            }
        
    }
}


        


