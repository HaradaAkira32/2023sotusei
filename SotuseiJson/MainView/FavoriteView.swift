//
//  FavoriteView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/24.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: ContentViewModel
    var isShowing: Bool
    @Environment(\.dismiss) private var dismiss
    var defaults = Defaults()
    
    let menuSize = UIScreen.main.bounds.width * 0.07
    
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
    var height:CGFloat {
        let device = UIDevice.current.userInterfaceIdiom
        if device == .phone {
            return UIScreen.main.bounds.height * 0.5
        } else if device == .pad {
            return UIScreen.main.bounds.height * 0.5
        } else {
            return UIScreen.main.bounds.height
        }
    }
    
    init(viewModel: ContentViewModel, isEmpty : Bool) {
        self.viewModel = viewModel
        if isEmpty{
            self.isShowing = true
        }else{
            self.isShowing = false
            //            viewModel.getFavoriteApps(ids: viewModel.parseIds(ids: ids))
        }
    }
    
    var body: some View{
        if isShowing{
            VStack{
                Text("お気に入りのアプリを入れてください")
                    .padding()
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "arrow.uturn.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: menuSize, height: menuSize)
                        .foregroundColor(Color("coffee"))
                }
            }
        }else{
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                if !viewModel.isGetData {
                    Spacer()
                    Text("取得失敗")
                    Spacer()
                } else if viewModel.favoriteApp.isEmpty {
                    Spacer()
                    Text("データがありません")
                    Spacer()
                }else{
                    
                    ZStack{
                        HStack(alignment: .center){
                            
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "arrow.uturn.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: menuSize, height: menuSize)
                                    .padding(.leading, menuSize / 2)
                                    .foregroundColor(Color("coffee"))
                            }.padding()
                            
                            Spacer()
                                .frame(width: width / 8)
                            
                            Text("お気に入りアプリ")
                                .foregroundColor(.gray)
                                .font(.system(size: width / 15))
                                .frame(width: width / 2, height: height / 5,alignment: .leading)
                            Spacer()
                        }
                    }.background(Color("ceramic").edgesIgnoringSafeArea(.all))
                    
                    //                     アプリ一覧を表示するView
                    
                    ScrollView{
                        ForEach(viewModel.favoriteApp){ appli in
                            AppCardView2(viewModel: viewModel, app: appli)
                        }
                    }.padding(.top)
                }
            }
        }
    }
}

//    struct FavoriteView_Previews: PreviewProvider {
//        static var previews: some View {
//            FavoriteView()
//        }
//    }
