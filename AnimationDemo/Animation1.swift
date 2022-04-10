//
//  Animation1.swift
//  AnimationDemo
//
//  Created by 袁志健 on 2022/3/14.
//

import SwiftUI

struct Animation1: View {
    
    @State private var zoomValue = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(zoomValue)
                
            Spacer()
            HStack(alignment: .center) {
                Button("放大") {
                    withAnimation(.spring()) {
                        zoomValue = 1.5
                    }
                }
                Color.clear.frame(width: 32)
                Button("缩小") {
                    withAnimation(.spring()) {
                        zoomValue = 0.8
                    }
                }
            }
            .frame(height: 48)
        }
    }
}

//struct Animation1_Previews: PreviewProvider {
//    static var previews: some View {
//        Animation1()
//    }
//}
