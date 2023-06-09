//
//  ContentView.swift
//  WeSplit
//
//  Created by ashu sharma on 12/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [5, 10, 15,20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Amount", value: $checkAmount,
                              format:.currency(code: Locale.current.identifier)
                        
                    )
                    .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<50) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.identifier))
                }
            }.navigationTitle("WeSplit")
        }
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
