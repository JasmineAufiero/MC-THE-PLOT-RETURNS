//
//  StepperView.swift
//  Med
//
//  Created by Jasmine Aufiero on 04/06/22.
//

import SwiftUI

struct StepperView: View {
    

    @State private var value = 1 // stepper value
    @Binding var expirationDates :[Date] // array of expiration dates
    @Binding var numerobox :Int
   
    
    // function that define the behaviour of the stepper while increasing its value
    // increasing the number of box, it will appear a new box item that needs a new expiration date
    func incrementStep() {
        
//        if value >= 50 { value = 50 }  //
        if value >= 5 { value = 5 }  
        
        else {
            value += 1
            numerobox = value
            expirationDates.insert(Date.now, at: value-1) // create an array of expiration dates based on the number of box that the user add inside the page
        }
        
    }
    
    // function that define the behaviour of the stepper while decreasing its value
    // decreasing the number of box, it will delete a box item
    func decrementStep() {
        
        if value <= 1 { value = 1 }
        
        else {
            value -= 1
            numerobox = value
            expirationDates.remove(at: value-1) // removing an array item form the expiration dates
        }
    }
    
    var body: some View {
        Stepper {
            Text("")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
    }
}


//struct StepperView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepperView()
//    }
//}
