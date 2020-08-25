//
//  RatingView.swift
//  FoodKart
//
//  Created by Jayakrishnan u on 8/24/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    var max: Int = 5
    
    var body: some View {

            
            HStack {
                ForEach(1..<(max + 1), id: \.self) { index in
                    Image(systemName: self.starType(index: index))
                        .foregroundColor(Color.orange)
                        .onTapGesture {
                            print("Tap gesture")
                            print(index)
                            self.rating = index
                    }
                }
            }
        

    }
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(5), max: 5)
    }
}
