//
//  ContentView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/16.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    @State var isShowing = false
    @Environment(\.dismiss) private var dismiss
    var year: String
    init(viewModel: ContentViewModel, year: String) {
        self.viewModel = viewModel
        self.year = year
    }
    
    var body: some View {
        ZStack {
            //            Color("umber").ignoresSafeArea(.all)
            
            VStack{
                // 上の操作するView
                SearchView(viewModel: viewModel,year: year)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    if !viewModel.isGetData {
                        Spacer()
                        Text("取得失敗")
                        Spacer()
                    } else if viewModel.apps.isEmpty {
                        Spacer()
                        Text("データがありません")
                        Spacer()
                    }else{
                        // アプリ一覧を表示するView
                        ScrollView{
                            ForEach(viewModel.apps){ appli in
                                AppCardView2(app: appli)
                            }
                        }
                    }
                }
            }
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(selectYear: "2022")
//    }
//}
