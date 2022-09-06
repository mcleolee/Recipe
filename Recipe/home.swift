//
//  home.swift
//  Recipe
//
//  Created by Ravin on 2022/9/4.
//

import SwiftUI

// 定义一些全局变量来存储状态
var edit_mode:Bool  = false
var edit_ingredient = emptyIngredient
var edit_index      = 0
var detailsShouldUpdateName:Bool = false // 当用户修改完的时候，这个变量变为 true 来提醒程序应该更新了

class Main: ObservableObject
{
    @Published var ingredient:[ingredient] = [] // 改变时，swift UI 可以实时更新，很强大的功能
    @Published var details_showing:Bool    = false
    @Published var details_name:String     = ""
    @Published var details_due_date:Date   = Date()
    
    func sort()
    {
        self.ingredient.sort(by: {$0.dueDate.timeIntervalSince1970 < $1.dueDate.timeIntervalSince1970})
        for i in 0 ..< self.ingredient.count
        {
            self.ingredient[i].i = i
        }
    }
    
}




struct home: View {
    var body: some View {
        Text("home page")
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
