//
//  YearViewModel.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/24.
//

import Foundation

class YearViewModel : ObservableObject {
    //    @Published var isEmpty = false
    
    var defaults = Defaults()
    func isCheckEmpty() -> Bool{
        let checkList = defaults.load()
        if checkList == []{
            return true
        }else{
            return false
        }
    }
    
    func parseIds(ids: [Int]) -> String {
        var parameter = ""
        //        var ids = defaults.load()
        for id in ids{
            parameter += String(id)
            parameter += ","
        }
        if parameter.isEmpty{
            
        }else{
            parameter.removeLast()
        }
        return parameter
    }
}
