//
//  AppCardView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct CardButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(), value: configuration.isPressed ? 0.9 : 1.0)
    }
    
}

struct AppCardView: View {
    
    var appInfo: AppInfo = appList[0]
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var selectedId: UUID
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.openCard) {
                show  = true
                selectedId = appInfo.id
            }
            
        }) {
            VStack(alignment: .leading, spacing: 0) {
                
                Image(appInfo.cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "cover\(appInfo.id)", in: namespace, isSource: true)
                    .frame(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.width - 40)  / 4.0 * 3)
                    
                Spacer()
                
                Text(appInfo.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 20)
                    .matchedGeometryEffect(id: "title\(appInfo.id)", in: namespace, isSource: true)
                
                Spacer()
                
                Text(appInfo.subTitle)
                    .font(.callout)
                    .foregroundColor(Color.secondary)
                    .padding(.horizontal, 20)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.width - 40)  / 4.0 * 3 + 100)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(appInfo.id)", in: namespace, isSource: true))
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("color_card_bg"))
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                            .matchedGeometryEffect(id: "background\(appInfo.id)", in: namespace, isSource: true))
            .padding(.horizontal, 20)
        
        }
        .buttonStyle(CardButtonStyle())
    }
}

struct AppCardView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        AppCardView(namespace: namespace, show: .constant(false), selectedId: .constant(UUID()))
    }
}
