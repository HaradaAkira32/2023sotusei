//
//  IntroductionView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/31.
//

import SwiftUI

struct IntroductionView: View {
    @Binding var isShowFullScreen: Bool
    @Environment(\.dismiss) private var dismiss
    var appID : Int
    var body: some View {
        
        Button {
            dismiss()
        } label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
        }
    }
}

//struct IntroductionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroductionView(isShowFullScreen: false)
//    }
//}
