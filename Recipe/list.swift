//
//  list.swift
//  Recipe
//
//  Created by Ravin on 2022/9/11.
//

import SwiftUI

var exampleTodo:[ingredient] =
[
    ingredient(name: "Potato"),
    ingredient(name: "Tomato"),
    ingredient(name: "Beef"),
    ingredient(name: "Pork"),
    ingredient(name: "Chicken")
    

]

struct list: View {
    @ObservedObject var main:Main
    var body: some View {
        NavigationView
        {
            ScrollView
            {
                ForEach(main.ingredient)
                {
                    ingredient in
                    VStack
                    {
                        if ingredient.i == 0 || Formatter.string(from: ingredient.dueDate) == Formatter.string(from:self.main.ingredient[ingredient.i - 1].dueDate)
                        {
                            HStack
                            {
                                Spacer().frame(width: 30)
                                Text(date2Word(date:ingredient.dueDate))
                                Spacer()
                            }
                        }
                        HStack
                        {
                            Spacer().frame(width:20)
                            ingredient
                        }
                    }
                }
            }
        }
        
    }
}

struct list_Previews: PreviewProvider {
    static var previews: some View {
        list()
    }
}
