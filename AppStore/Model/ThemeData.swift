//
//  ThemeData.swift
//  AppStore
//
//  Created by 袁志健 on 2022/4/5.
//

import SwiftUI

//MARK: - Dark Model
let darkModel: [MyDarkModel] = [
    MyDarkModel(id: 0, image: "img_dark_auto", name: "系统"),
    MyDarkModel(id: 1, image: "img_dark_off", name: "浅色"),
    MyDarkModel(id: 2, image: "img_dark_on", name: "深色"),
]

//MARK: - Accent Color
let accentColorData: [MyAccentColor] = [
    MyAccentColor(id: 0, name: "蓝色主题", color: Color.blue),
    MyAccentColor(id: 1, name: "青色主题", color: Color.cyan),
    MyAccentColor(id: 2, name: "绿色主题", color: Color.green),
    MyAccentColor(id: 3, name: "黄色主题", color: Color.yellow),
    MyAccentColor(id: 4, name: "橙色主题", color: Color.orange),
    MyAccentColor(id: 5, name: "红色主题", color: Color.red),
]

//MARK: - App Icons
let appIconNames: [String] = [
    "icon_1",
    "icon_2",
    "icon_3",
    "icon_4",
    "icon_5",
    "icon_6",
]
