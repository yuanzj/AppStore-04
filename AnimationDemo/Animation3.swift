//
//  Animation3.swift
//  AnimationDemo
//
//  Created by 袁志健 on 2022/3/14.
//

import SwiftUI

struct Animation3: View {
    
    @Namespace var namespace
    @State var show: Bool = false
    @State var selectedIndex: Int = 0
    
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical) {
                
                VStack {
                    if show {
                        ForEach(0 ..< 100) { index in
                            Rectangle()
                                .fill(Color.clear)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .padding()
                                .background(Color.clear)
                                .padding()
                        }

                    } else {
                        ForEach(0 ..< 100) { index in
                            
                            HStack {
                                Image("111")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50 , height: 50, alignment: .center)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "Image\(index)", in: namespace, anchor: .center,  isSource: true)
                                
                                Text("测试\(index)")
                                    .matchedGeometryEffect(id: "Text\(index)", in: namespace, isSource:  true)
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .frame(height: 50)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                                            .matchedGeometryEffect(id: "background\(index)", in: namespace, isSource: true))
                            .padding()
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedIndex = index
                                    show = true
                                }
                            }
                        }
                    }
                }
            }
            
            if show {
                ModalView(namespace: namespace, show: $show, index: $selectedIndex)
                    .zIndex(1)
            }
        }
    }
}

struct ModalView: View {
    
    var namespace: Namespace.ID
    
    @Binding var show: Bool
    @Binding var index: Int
    
    var body: some View {
        ZStack {
            VStack {
                
                Image("111")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 50 , height: 50, alignment: .center)
                    .scaleEffect(2)
                    .matchedGeometryEffect(id: "Image\(index)", in: namespace, anchor: .center,  isSource: true)
                
                
                
                Text("测试\(index)")
                    .padding(.top, 40)
                    .matchedGeometryEffect(id: "Text\(index)", in: namespace, isSource: true)
                
                
                Button("关闭") {
                    withAnimation(.spring()) {
                        show = false
                    }
                }
                .padding(.top, 80)
                
                
                
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                            .matchedGeometryEffect(id: "background\(index)", in: namespace, isSource: true))
        }.ignoresSafeArea()
        
    }
}

struct Animation3_Previews: PreviewProvider {
    static var previews: some View {
        Animation3()
    }
}
