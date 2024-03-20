//
//  SelectionView.swift
//  ForeignCurrencyExchange
//
//  Created by Liu, Emily on 3/19/24.
//

import SwiftUI

struct CurrencySelectionView: View {
    let currencies = ["USD", "EUR", "GBP", "JPY"]
    @Binding var selectedCurrencyIndex: Int
    
    var body: some View {
        VStack {
            Picker("Currency", selection: $selectedCurrencyIndex) {
                ForEach(0..<currencies.count) { index in
                    Text(self.currencies[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView(selectedCurrencyIndex: .constant(0))
    }
}
