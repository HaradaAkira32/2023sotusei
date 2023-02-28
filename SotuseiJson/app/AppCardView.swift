//
//  AppCardView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/27.
//

import SwiftUI

struct AppCardView2: View {
    
    @State var isShowing = false
    @State var isNice: Bool
    
    @ObservedObject var viewModel : ContentViewModel
    var app: AppData
    
    let screenWidth = UIScreen.main.bounds.width
    
    var width:CGFloat {
        let device = UIDevice.current.userInterfaceIdiom
        if device == .phone {
            return UIScreen.main.bounds.width * 0.9
        } else if device == .pad {
            return UIScreen.main.bounds.width * 0.9
        } else {
            return UIScreen.main.bounds.width
        }
    }
    
    init(viewModel : ContentViewModel, app: AppData) {
        self.viewModel = viewModel
        self.app = app
        isNice = app.isFavorite
    }
    
    
    var body: some View {
        
        ZStack {
            HStack{
                Spacer()
                //icon
                HStack {
                    //アイコン画像
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        Image(uiImage:app.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width / 3, height: width / 3)
                            .cornerRadius(20.0)
                            .foregroundColor(Color(uiColor: .systemMint))
                    } else if UIDevice.current.userInterfaceIdiom == .pad {
                        Image(uiImage:app.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width / 5.5, height: width / 5.5)
                            .cornerRadius(20.0)
                            .foregroundColor(Color(uiColor: .systemMint))
                    }
                    
                    // アプリ名、学生情報
                    VStack {
                        
                        Text(app.title)
                            .foregroundColor(.gray)
                            .font(.system(size: width / 14))
                            .frame(width: width / 2, alignment: .leading)
                        
                        Text(app.studentID)
                            .foregroundColor(Color(.lightGray))
                            .font(.system(size: width / 28))
                            .frame(width: width / 2, alignment: .leading)
                        
                        ForEach(app.studentName , id:\.self) { name in
                            Text(name)
                                .foregroundColor(Color(.lightGray))
                                .font(.system(size: width / 28))
                                .frame(width: width / 2, alignment: .leading)
                            
                        }
                        //タグ
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(app.tags ?? [""], id:\.self) { tag in
                                    Text(tag)
                                        .padding(5)
                                        .font(.system(size: width / 35))
                                        .foregroundColor(.white)
                                        .background(Color("ceramic"))
                                        .cornerRadius(5)
                                }
                            }
                        }
                        .frame(width: width / 2, alignment: .leading)
                    }
                    
                    .frame(width: width / 2, alignment: .leading)
                    
                    Spacer()
                    // ボタンでこのView使うと色変になるから防止のために色を指定する
                        .foregroundColor(.black)
                }// HStack
                //カードの背景
                .padding(.leading, width / 10)
                .frame(width: width, height: 180)
                .background(Color("appCardBackColor"))
                .cornerRadius(20)
                Spacer()
                
            }
            
            
            //Star
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Button {
                        if isNice {
                            viewModel.delete(id: app.id)
                            isNice = false
                        }else{
                            viewModel.seve(id: app.id)
                            isNice = true
                        }
                    } label: {
                        // いいねすると星が光る
                        Image(systemName:
                               isNice ? "star.fill" : "star")
                        .font(.system(size: 30.0))
                        // いいねすると星が光る
                        .foregroundColor(
                            isNice ? .yellow : .gray)
                    }
                }
                .padding(.bottom, width / 20)
                .padding(.trailing, width / 10)
            }
            
        }
        .onTapGesture {
            isShowing.toggle()
        }
        .fullScreenCover(isPresented: $isShowing) {
            IntroductionView(isShowFullScreen: $isShowing, appID: app.id)
        }
    }
}

