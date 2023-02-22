//
//  layoutView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/03.
//

import SwiftUI

struct LayoutView: View {
    var title: String?
    
    let width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            Text(title ?? "取得できませんでした")
                .padding(10)
                .frame(width: width * 0.8,height: 50)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15)
        }
    }
}
struct layoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView(title: "sample")
    }
}
