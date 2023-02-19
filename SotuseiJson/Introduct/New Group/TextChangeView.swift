//
//  TextChangeView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/09.
//

import SwiftUI

// 表示切り替えのPicker
struct TextChangeView: View {
    @Binding var selection : Int
    var body: some View {
        VStack{
            Picker("", selection: self.$selection) {
                Text("基本情報").tag(0)
                   
                Text("作者コメント").tag(1)
             
            }
            .pickerStyle(SegmentedPickerStyle())
        }.padding(.horizontal, 10)
    }
}

//struct TextChangeView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextChangeView()
//    }
//}
