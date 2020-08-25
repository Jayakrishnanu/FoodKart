//
//  ItemDetail.swift
//  FoodKart
//
//  Created by Jayakrishnan u on 8/24/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            Text(item.image).font(Font.system(size: 150))
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
        
    }
}
