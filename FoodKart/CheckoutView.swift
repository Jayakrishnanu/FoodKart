//
//  CheckoutView.swift
//  FoodKart
//
//  Created by Jayakrishnan u on 8/24/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    static let paymentType = ["Cash", "Credit", "Apple Pay"]
    static let numberOfBags = [0, 1, 2, 3, 4]
    @State private var paymentType = 0
    @State private var addLoyaltyDetail = false
    @State private var loyaltyNumber = ""
    @State private var bagsSelection = 0
    @State private var rating: Int?
    
    var totalPrice: Double {
        let total = Double(order.total)
        return total + Double(bagsSelection) * 0.1
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0..<Self.paymentType.count) {
                        Text(Self.paymentType[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetail.animation(Animation.linear)) {
                   Text("Add loyality Card")
                }
                if addLoyaltyDetail {
                   TextField("Enter your loyalityNumber", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Number of bags used today?")) {
                Picker("Number of bags", selection: $bagsSelection) {
                    ForEach(0..<Self.numberOfBags.count) {
                        Text("\(Self.numberOfBags[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Rate your experience")) {
               HStack {
                    Text(rating != nil ? "You rating: \(rating!)" : "")
                    RatingView(rating: $rating, max: 5)
                    
                }
            }
            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")") ) {
                Button("Confirm Order") {
                    
                }
            }
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
             CheckoutView().environmentObject(order)
        }
       
    }
}
