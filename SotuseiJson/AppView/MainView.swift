//
//  MainView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct MainView: View {
    @State private var searchText = ""
    
    @State private var showingSheet = false
    
    @ObservedObject var viewModel : ContentViewModel
    
    let menuSize = UIScreen.main.bounds.width * 0.07
    
    var body: some View {
        HStack{
            Button{
                self.showingSheet.toggle()
            } label: {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: menuSize, height: menuSize)
                    .padding(.leading, menuSize / 2)
                    .foregroundColor(Color("coffee"))
                
            }.sheet(isPresented: $showingSheet){
                YearView()
            }
            
           SearchBar(text: $searchText,viewModel: viewModel)
                .padding(.vertical, 8)
        }
    }
}

// サーチバーを自作
struct SearchBar: View {
    @Binding var text: String
    @ObservedObject var viewModel : ContentViewModel
    var body: some View {
        VStack {
            ZStack {
                // 背景
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("latte"))
                    .frame(height: 36)
                
                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)
                    
                    // 虫眼鏡
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                    
                    // テキストフィールド
                    TextField("Search", text: $text,onCommit: {
                        viewModel.searchName(from: text)
                    })
                        .foregroundColor(.white)
                        
                    
                    // 検索文字が空ではない場合は、クリアボタンを表示
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
