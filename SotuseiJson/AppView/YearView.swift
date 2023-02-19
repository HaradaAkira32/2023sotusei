//
//  FullScreenView..swift
//  demoApp
//
//  Created by cmStudent on 2022/12/08.
//

import SwiftUI

struct YearView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State private var showYear = false
    
    @State var selectYear : String = ""
    
    @State var selctTag : String = ""
    
    let years = ["2021","2022","2023","2024","2025"]
    
    let width = UIScreen.main.bounds.width
    
    
    var body: some View {
        
        VStack {
            
            Text("どの年度の作品を見ますか？")
                .font(.title2)
            
            ForEach(years, id: \.self) { year in
                Button {
                    showYear.toggle()
                    selectYear = year
                    viewModel.getData(year: year, event: nil)
                } label: {
                    ListCell(text: year)
                        .frame(width: width,height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                        .padding(3)
                }.fullScreenCover(isPresented: $showYear) {
                    //メイン画面に飛ぶ
                    ContentView(viewModel: viewModel, year: selectYear)
                }
                
            }
        }
        
    }
}
//struct FullScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        YearView()
//    }
//}

struct ListCell: View {
    var text: String
    var body: some View {
        HStack{
            Text(text)
                .padding()
            Spacer()
        }
    }
}
