//
//  ContentView.swift
//  FoodPicker
//
//  Created by 胡瑞兴 on 2024/7/29.
//

import SwiftUI

struct ContentView: View {
    let food: [String] = ["饺子","汉堡","馄饨","包子","关东煮"]
    @State var selectedFood: String?
    
    var body: some View {
        
        VStack(spacing:30) {
            Image("dragon")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("今天吃什么？")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)
                
                
            }
            
            
            /// 选择按钮
            Button(action: {
                selectedFood = food.shuffled().first{$0 != selectedFood}
            }, label: {
                Text(selectedFood == .none ? "告诉我" : "换一个")
                    .frame(width: 200)
                    .animation(.none, value: selectedFood) // selectedFood特定值更改时禁用动画
                    .id(selectedFood)
                    .transition(.asymmetric(
                        insertion: .opacity
                                   .animation(.easeInOut(duration: 0.5).delay(0.2)),
                        removal: .opacity
                                 .animation(.easeInOut(duration: 0.4))
                    ))
            })
            .padding(.bottom, -15) // 将与下面的间距减少15
            
            /// 重置按钮
            Button(action: {
                selectedFood = .none
            }, label: {
                Text("重置").frame(width: 200)
            })
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(content: {
            Color(.secondarySystemBackground)
        })
        .ignoresSafeArea()
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
    }
    
}




#Preview {
    ContentView()
}
