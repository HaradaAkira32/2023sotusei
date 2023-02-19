//
//  ImageSlideView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/03.
//

import SwiftUI

/// アプリの写真を横並びで表示するView
struct ImageSlideView: View {
    @State var selection: Int = 0
    var images : [UIImage] = []
    var body: some View {
        VStack{
            TabView(selection: $selection) {
//                ForEach(0..<images.count) { index in
//                    Image(uiImage: images[index])
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .tag(index)
//                }
                
                ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(index)
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            PageControlBar(count: images.count, selected: $selection)
            
        }
    }
}


struct ImageSlideView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlideView()
    }
}
