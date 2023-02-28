//
//  EventButtonView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct EventButtonView: View {
    @Binding var selectEvent : Int
    
    @ObservedObject var viewModel: ContentViewModel
    
    var year : String
    
    let width = UIScreen.main.bounds.width
    
    init(selectEvent: Binding<Int>, viewModel: ContentViewModel, year: String) {
        self._selectEvent = selectEvent
        self.viewModel = viewModel
        self.year = year
    }
    
    //選択された時の色
    let selectColor = Color("coffee")
    //    Color.orange.opacity(0.5)
    //選択されてない時の色
    let unselectColor = Color("latte")
    
    var body: some View {
        HStack{
            Spacer()
            Button(action : {
                viewModel.getData(year: year, event: nil)
                selectEvent = 0
                
            }){
                Text("すべて")
                    .frame(width: width / 4)
                    .padding(5)
                    .background(selectEvent == 0 ? selectColor : unselectColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Spacer()
            Button(action : {
                viewModel.getData(year: year, event: 1)
                selectEvent = 1
            }){
                Text("文化祭")
                    .frame(width: width / 4)
                    .padding(5)
                    .background(selectEvent == 1 ? selectColor : unselectColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Spacer()
            Button(action : {
                viewModel.getData(year: year, event: 2)
                selectEvent = 2
            }){
                Text("卒業制作")
                    .frame(width: width / 4)
                    .padding(5)
                    .background(selectEvent == 2 ? selectColor : unselectColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Spacer()
        }
    }
}

//struct EventBtn_Previews: PreviewProvider {
//    @State static var a = 0
//    static var previews: some View {
//        EventButtonView(selectEvent: $a)
//    }
//}
