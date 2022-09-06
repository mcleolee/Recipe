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
    var dueDate:Date  = Date()

    
    init(name:String)
    {
        self.name = name
    }
}


var emptyIngredient:ingredient = ingredient(name: "") // 以自己的类为数据类型的变量

// 怎么存数据呢？
// 新建一个 home 文件





struct Recipe_ingredient: View {
    @ObservedObject var main: Main
    @Binding var ingredient_index:Int
    @State var checked:Bool = false
    
    var body: some View {
        HStack
        {
            Button(action:{
                edit_mode       = true
                edit_ingredient = self.main.ingredient[self.ingredient_index]
                edit_index      = self.ingredient_index
                
                self.main.details_name     = edit_ingredient.name
                self.main.details_due_date = edit_ingredient.dueDate
                self.main.details_showing  = true
                
                detailsShouldUpdateName   = true
                
            }){
                HStack
                {
                    VStack
                    {
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 8)
                    }
                    Spacer()
                        .frame(width:10)
                    VStack
                    {
                        Spacer()
                            .frame(height: 12)
                        HStack
                        {
                            Text(main.ingredient[ingredient_index].name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 4)
                        HStack
                        {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text(formatter.string(from: main.ingredient[ingredient_index].dueDate))
                                .font(.subheadline)
                            Spacer()
                        }
                        .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 12)
                    }
                }
            }
            
            Button(action:{
                self.main.ingredient[self.ingredient_index].checked.toggle()
                self.checked = self.main.ingredient[self.ingredient_index].checked
                do
                {
                    let archived_data = try NSKeyedArchiver.archivedData(withRootObject: self.main.ingredient, requiringSecureCoding: false)
                    UserDefaults.standard.set(archived_data, forKey: "ingredient")
                } catch {
                    print("error")
                }
                
            }){
                HStack
                {
                    Spacer()
                        .frame(width: 12)
                    
                    VStack
                    {
                        Spacer()
                        // 如果没被选，就用square图片，否则用前者
                        Image(systemName: self.checked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(width: 12)
                }
                
            }
            .onAppear{
                self.checked = self.main.ingredient[self.ingredient_index].checked
            }
        }
        .background(Color(self.checked ? "red" : "pink")) // 背景的颜色，勾选或没勾选
        // animation 是IOS 15.0 的，我用的 IOS 16.0 开发，于是用 withAnimation 或者 animation(_:value)
        .animation(.spring())
        
        
        Text("hi")
        
    }
}

struct Recipe_ingredient_Previews: PreviewProvider {
    static var previews: some View {
        Recipe_ingredient(main: Main(), ingredient_index: .constant(0))
    }
}
