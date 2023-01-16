//
//  ContentView.swift
//  TaxCalculator
//
//  Created by Paul Onawola on 03/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var salary: Double?
    private var tax: Double {
        var base = salary ?? 0.00
        var instance = 0.00
        
        if base < 300000 {
            instance = base * 0.01
            return instance
        }
        
        if base >= 300000 {
            base -= 300000
            instance += 21000
            if base < 300000 {
                return instance
            }
        }
        
        if base >= 300000 {
            base -= 300000
            instance += 33000
            if base < 500000 {
                return instance
            }
        }
        
        if base >= 500000 {
            base -= 500000
            instance += 75000
            if base < 500000 {
                return instance
            }
        }
        
        if base >= 500000 {
            base -= 500000
            instance += 95000
            if base < 1600000 {
                return instance
            }
        }
        
        if base >= 1600000 {
            base -= 1600000
            instance += 240240
            if base > 0 {
                instance += (base * 0.24)
                return instance
            } else {
                return instance
            }
        }
        
        return instance
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Section {
                    Text(tax, format: .currency(code: "NGN"))
                        .font(.largeTitle)
                }
                .padding(.top)
                Form {
                    TextField("Salary", value: $salary, format: .currency(code: "NGN"))
                }
                
            }
            .navigationBarTitle("Tax Calculator")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
