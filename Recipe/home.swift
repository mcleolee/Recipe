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
var detailsShouldUpdateTitle:Bool = false // 当用户修改完的时候，这个变量变为 true 来提醒程序应该更新了

class main:ObservedObject
{
    @Published var ingredient:[ingredient] = [] // 改变时，swift UI 可以实时更新，很强大的功能
    @Published var details_showing:Bool    = false
    @Published var details_name            = ""
    @Published var 
}




struct home: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
