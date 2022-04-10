//
//  ProfileView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/4/5.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode)    var presentationMode
    @EnvironmentObject                  var appSettings: AppSettings
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    headPortrait
                }
                
                Section{
                    NavigationLink(destination: AppearanceSetView()) {
                        SettingItemView(iconName: "paintpalette.fill", title: "外观设置", bgColor: Color.accentColor)
                    }
                }
            }
            .listRowSeparator(.hidden)
            .navigationBarTitle("账户", displayMode: .inline)
            .toolbar {
                Button("完成", action: close)
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(accentColorData[self.appSettings.accentColorSettings].color)
    }
    
    var headPortrait: some View {
        HStack {
            Image("img_head_default")
                .resizable()
                .frame(width: 60, height: 60.0).cornerRadius(30)
            VStack(alignment: .leading, spacing: 4.0) {
                Text("法外狂徒")
                    .font(.title3)
                Text(verbatim: "zhangsan@qq.com")
                    .foregroundColor(Color.secondary)
            }
            .padding(.leading, 8.0)
        }
        .padding(.vertical, 8.0)
    }
    
    func close() {
        presentationMode.wrappedValue.dismiss()
    }
}


struct SettingItemView: View {
    
    // MARK: - icon
    var iconName: String
    
    // MARK: - title
    var title: String
    
    // MARK: - bg color
    var bgColor: Color
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.medium)
                .scaledToFit()
                .frame(width: 28, height: 28, alignment: .center)
                .background(bgColor)
                .foregroundColor(Color.white)
                .cornerRadius(6)
    
            Text(title)
                .foregroundColor(Color.primary)
                .font(.body)
                .padding(.leading, 4.0)
                
        }
        .padding(.vertical, 8.0)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AppSettings())
    }
}
