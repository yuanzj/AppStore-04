//
//  Animation2.swift
//  AnimationDemo
//
//  Created by 袁志健 on 2022/3/14.
//

import SwiftUI

struct Animation2: View {
    @Namespace private var namespace
    @State private var show = false
    
    var body: some View {
        VStack {
            if show {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(maxWidth: .infinity,  maxHeight: .infinity)
                    .matchedGeometryEffect(id: "id1", in: namespace)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show = false
                        }
                    }
            } else {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 48, height: 48)
                    .overlay(Image(systemName: "plus")
                                .foregroundColor(Color.white))
                    .matchedGeometryEffect(id: "id1", in: namespace)
                    .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show = true
                        }
                    }
            }
        }.navigationViewStyle(.stack)
    }
}

struct Animation2_Previews: PreviewProvider {
    static var previews: some View {
        Animation2()
    }
}
