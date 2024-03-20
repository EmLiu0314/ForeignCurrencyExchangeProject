//
//  ContentView.swift
//  ForeignCurrencyExchange
//
//  Created by Liu, Emily on 3/19/24.
//
/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
*/

import SwiftUI

struct ContentView: View {
    @State private var amount: String = ""
    @State private var selectedCurrencyIndex = 0
    let currencies = ["USD", "EUR", "GBP", "JPY"]
    let exchangeRates: [String: Double] = [
        "USD": 1.0,
        "EUR": 0.85,
        "GBP": 0.72,
        "JPY": 110.85
    ]
    
    var convertedAmount: Double {
        let amountToConvert = Double(amount) ?? 0
        let selectedCurrency = currencies[selectedCurrencyIndex]
        let exchangeRate = exchangeRates[selectedCurrency] ?? 1.0
        return amountToConvert * exchangeRate
    }
    
    var body: some View {
        VStack {
            TextField("Enter amount", text: $amount)
                .keyboardType(.decimalPad)
                .padding()
            
            Picker("Currency", selection: $selectedCurrencyIndex) {
                ForEach(0..<currencies.count) { index in
                    Text(self.currencies[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Text("Converted Amount: \(convertedAmount, specifier: "%.2f") \(currencies[selectedCurrencyIndex])")
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
