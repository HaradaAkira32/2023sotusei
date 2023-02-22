//
//  TagView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct TagView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    var tags = ["iOS", "Android","Iot","AR","firebase","Bluetooth"]
    
//    var selectTag : Stringc
    
    
    
    var body: some View {
        ScrollView([.horizontal],showsIndicators: false){
            HStack{
                Spacer()
//                ForEach(0..<self.tags.count) { tag in
//                    Button(action: {
//                        print(tags[tag])
//                    }){
//                        Text(tags[tag])
//                            .frame(width: 80,height: 40)
//                            .background(Color("slate"))
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                    }
//                }
                
                ForEach (Array(tags.enumerated()), id: \.offset) { index, tag in
                    Button(action: {
                        viewModel.repackApps(in: tag)
                        print(tag)
                    }){
                        Text(tag)
                            .frame(width: 80,height: 40)
                            .background(Color("tagcolor"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                Spacer()
            }
        }
    }
}

//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView()
//    }
//}
