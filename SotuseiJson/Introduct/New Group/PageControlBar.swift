//
//  PageControlBar.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/03.
//

import SwiftUI

// ImageSlideViewで使う自作のコントロールバー
struct PageControlBar: View {
    var count : Int
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< count, id: \.self) { num in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(num == selected ? .white : .black)
                    .onTapGesture {
                        selected = num
                    }
            }
        }
        .cornerRadius(8)
    }
}

//struct PageControlBar_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControlBar()
//    }
//}
