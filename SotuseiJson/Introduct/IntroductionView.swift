//
//  IntroductionView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/31.
//

import SwiftUI

struct IntroductionView: View {
    @Binding var isShowFullScreen: Bool
    @ObservedObject var viewModel : InfoViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showingSheet = false
    @State var selectionText : Int = 0
    
    let width = UIScreen.main.bounds.width
    
    var appID : Int
    
    init(isShowFullScreen: Binding<Bool>, appID: Int) {
        self._isShowFullScreen = isShowFullScreen
        self.appID = appID
        self.viewModel = InfoViewModel(AppID: appID)
        print("viewModel: " + String(appID))
    }
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all)
            
            if viewModel.isProgress {
                ProgressView()
            } else if viewModel.infoData != nil {
                VStack{
                    // Backボタンとアプリタイトル
                    HStack{
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "chevron.backward")
                                .padding(.horizontal, 8)
                        }
                        LayoutView(title: viewModel.infoData?.title)
                    }
                    
                    // ImageSliderViewが押されたら、Sheetで大きくImageSlideViewを表示する
                    Button{
                        self.showingSheet.toggle()
                    } label: {
                        ImageSlideView(images: viewModel.AppImage)
                            .sheet(isPresented: $showingSheet) {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ImageSlideView(images: viewModel.AppImage)
                                }
                            }
                    }
                    
                    TextChangeView(selection: $selectionText)
                    
                    ScrollView {
                        if selectionText == 0{
                            TextView(os: viewModel.infoData?.appOs ?? "",
                                     language: viewModel.infoData?.language ?? "",
                                     developmentChance: viewModel.infoData?.developmentBG ?? "",
                                     appPoint: viewModel.infoData?.opusPoint ?? "")
                        }else if selectionText == 1{
                            UserText(idea: viewModel.infoData?.idea ?? "",
                                     notFunction: viewModel.infoData?.notFunction ?? "",
                                     site: viewModel.infoData?.site ?? "")
                        }
                    }
                    .frame(width: width)
                }
            } else {
                VStack{
                    Text("エラー")
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.backward")
                            .padding()
                            .font(.system(size: 30))
                    }
                }
            }
        }
    }
}
//struct IntroductionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroductionView(isShowFullScreen: false)
//    }
//}
