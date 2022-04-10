//
//  ContentView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appSettings: AppSettings
    
    @Namespace var namespace
    @State var show: Bool = false
    @State var showStateBar: Bool = true
    @State var selectedId = UUID()
    
    var body: some View {
        ZStack {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                TodayView(namespace: namespace, show: $show, selectedId: $selectedId)
                    .zIndex(1)
                    .tabItem {
                    Image(systemName: "doc.text.image.fill")
                        .imageScale(.large)
                    Text("今日")
                }.tag(1)
                Text("游戏")
                    .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("游戏")
                }.tag(2)
                Text("应用")
                    .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("应用")
                }.tag(3)
                Text("搜索")
                    .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("搜索")
                }.tag(4)
            }
            .zIndex(2)
            
            if show {
                ZStack {
                    ForEach(appList) { appInfo in
                        if appInfo.id == selectedId {
                            AppDetailView(appInfo: appInfo, namespace: namespace, show: $show, selectedId: $selectedId)
                                
                        }
                    }
                }.zIndex(3)
            }
            
        }
        .statusBar(hidden: !showStateBar)
        .onChange(of: show, perform: { newValue in
            withAnimation(.closeCard) {
                showStateBar = !newValue
            }
        })
        .accentColor(accentColorData[self.appSettings.accentColorSettings].color)
        .onAppear {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            switch self.appSettings.darkModeSettings {
            case 0:
                window?.overrideUserInterfaceStyle = .unspecified
            case 1:
                window?.overrideUserInterfaceStyle = .light
            case 2:
                window?.overrideUserInterfaceStyle = .dark
            default:
                window?.overrideUserInterfaceStyle = .unspecified
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(AppSettings())
    }
    
}
