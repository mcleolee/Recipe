//
//  Recipe_ingredient.swift
//  Recipe
//
//  Created by Ravin on 2022/9/4.
//

import SwiftUI

// 继承的这两个特性可以使 name, checked 等变量保存下来
class ingredient: NSObject, NSCoding
{
    func encode(with coder: NSCoder) {
        // encode 要保存的变量，
        coder.encode(self.name, forKey: "name")
        coder.encode(self.checked, forKey: "checked")
    }
    
    required init?(coder: NSCoder) {
        self.name    = coder.decodeObject(forKey: "name") as? String ?? ""
        self.checked = coder.decodeBool(forKey: "checked")
    }
    
    var name:String   = ""
    var checked:Bool  = false
    var i:Int         = 0
    
    // 应该添加图标，可以用 Emoji
//    var icon:IconOnlyLabelStyle = 1
    
    // 如果要添加日期的话，这里可以写
//    var dueDate:Date  = Date()

    
    init(name:String)
    {
        self.name = name
    }
}






struct Recipe_ingredient: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Recipe_ingredient_Previews: PreviewProvider {
    static var previews: some View {
        Recipe_ingredient()
    }
}
