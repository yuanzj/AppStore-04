//
//  AppDetailView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/12.
//

import SwiftUI

struct AppDetailView: View {
    
    var appInfo: AppInfo = appList[0]
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var selectedId: UUID
    @State var translationWidth: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                cover
                content
            }
            .coordinateSpace(name: "DetailScrollView")
            
            closeButton
                .opacity(show ? 1.0 : 0.0)
                .opacity((120 - translationWidth)/120.0)
            
        }
        .mask(RoundedRectangle(cornerRadius: translationWidth / 3, style: .continuous)
            .matchedGeometryEffect(id: "mask\(appInfo.id)", in: namespace, isSource: true))
        .background(RoundedRectangle(cornerRadius: translationWidth / 3, style: .continuous)
            .fill(Color("color_card_bg"))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            .matchedGeometryEffect(id: "background\(appInfo.id)", in: namespace, isSource: true))
        .scaleEffect(1 - translationWidth / 500)
        .background(.ultraThinMaterial)
        .gesture(show ? drag : nil)
        .ignoresSafeArea()
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("DetailScrollView")).minY
            Image(appInfo.cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "cover\(appInfo.id)", in: namespace, isSource: true)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width + (scrollY > 0 ? scrollY / 2.0 : 0))
                .offset(y: scrollY > 0 ? -scrollY : 0)
        }
    }
    
    var content: some View {
        
        VStack(alignment: .leading) {
            
            Text(appInfo.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .matchedGeometryEffect(id: "title\(appInfo.id)", in: namespace, isSource: true)
            
            Text(appInfo.description)
                .font(.callout)
                .foregroundColor(Color.secondary)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .opacity(show ? 1.0 : 0.0)
            
            Color.clear.frame(height: 500)
        }
        .padding(.top, UIScreen.main.bounds.width)
        
    }
    
    var closeButton: some View {
        Button(action: {
            close()
        }) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color.white)
                .frame(width: 32, height: 32)
                .padding(8)
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding( 20)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                if value.startLocation.x < 100 || value.startLocation.x > UIScreen.main.bounds.width - 100 {
                    withAnimation(.closeCard) {
                        translationWidth = abs(value.translation.width)
                    }
                }
                
                if translationWidth > 120 {
                    close()
                }
                
            }
            .onEnded { value in
                if translationWidth > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        translationWidth = 0
                    }
                }
            }
    }
    
    func close() {
        withAnimation(.closeCard) {
            show = false
            selectedId = UUID()
        }
        
        withAnimation(.openCard) {
            translationWidth = 0
        }
    }
}

struct AppDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        AppDetailView(namespace: namespace, show: .constant(false), selectedId: .constant(UUID()))
    }
}
