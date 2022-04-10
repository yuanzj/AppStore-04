//
//  ContentView.swift
//  AnimationDemo
//
//  Created by 袁志健 on 2022/3/14.
//

import SwiftUI

struct ContentView: View {
    
 
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: Animation1()) {
                    Text("同一个View动画")
                        .padding()
                    
                }
                Divider()
                NavigationLink(destination: Animation2()) {
                    Text("同一图层不同View动画（替换关系）")
                        .padding()
                    
                }
                Divider()
                NavigationLink(destination: Animation3()) {
                    Text("不同图层不同View动画（非替换关系）")
                        .padding()
                    
                }
            }
            
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
