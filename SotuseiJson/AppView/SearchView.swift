//
//  SearchView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct SearchView: View {
    ///true: 文化祭　false:卒業制作
    @State var selectEvent : Int = 0
    
    @State var searchText: String = ""
    
    @ObservedObject var viewModel: ContentViewModel
    
    var year : String
    
    var body: some View{
        ZStack{
            
            VStack{
                // ハンバーガと検索窓
                MainView(viewModel: viewModel)
                // タグ
                TagView(viewModel: viewModel)
                // イベント（すべて、文化祭、卒制）
                EventButtonView(selectEvent: $selectEvent, viewModel: viewModel,year: year)
                    .padding(.bottom, 10)
                
            }
            
        }.background(Color("ceramic").edgesIgnoringSafeArea(.all))
    }
}
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
