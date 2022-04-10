//
//  AppearanceSetView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/4/5.
//

import SwiftUI

struct AppearanceSetView: View {
    
    @EnvironmentObject var appSettings: AppSettings
        
    var body: some View {
        List {
            Section {
                HStack(spacing: 0) {
                    ForEach(darkModel) { item in
                        Button (action: {
                            appSettings.darkModeSettings = item.id
                        }) {
                            DarkPreviewView(imgName: item.image, title: item.name, check: appSettings.darkModeSettings == item.id)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        if item.id < 2 {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 4)
                .padding(.vertical)
            }
            
            Section(header: Text("界面强调色")) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 10) {
                    ForEach(accentColorData) { item in
                        Button {
                            appSettings.accentColorSettings = item.id
                        } label: {
                            Circle()
                                .fill(item.color)
                                .frame(width: 40, height: 40, alignment: .center)
                                .checkedStyle(check: appSettings.accentColorSettings == item.id)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .padding(.vertical)
            }
            
            Section(header: Text("应用程序图标")) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 24) {
                    ForEach(0..<appIconNames.count, id:\.self) { i in
                        Button {
                            appSettings.appIconSettings = i
                        } label: {
                            Image(appIconNames[i])
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(16)
                                .imageCheckedStyle(check: appSettings.appIconSettings == i, cornerRadius: 16)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

struct DarkPreviewView: View {
    
    let imgName: String
    let title: String
    let check: Bool
    var body: some View {
        VStack {
            Image(imgName)
                .resizable()
                .frame(width: 80.0, height: 173)
                .scaledToFit()
                .cornerRadius(8)
                .imageCheckedStyle(check: check)
            
            Text(title)
                .foregroundColor(Color.primary)
            
            Image(systemName: check ? "checkmark.circle.fill" : "circle")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(check ? Color.accentColor: Color("color_list_forward"))
        }
    }
}

struct AppearanceSetView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSetView()
            .environmentObject(AppSettings())
    }
}
