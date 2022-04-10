//
//  AppInfo.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/13.
//

import Foundation

struct AppInfo: Identifiable {
    
    let id = UUID()
    let cover: String
    let title: String
    let subTitle: String
    let description: String
    
}

var appList = [
    AppInfo(cover: "img_app_bg_1", title: "Craft-笔记编辑器", subTitle: "编辑文件和想法", description: "Craft是一款用于创建漂亮的文档和笔记以及分享你的想法的工具。你在Craft中创建的所有东西都可以一键分享。Craft支持内联标记、反向链接、代码片段、图像、视频、附加PDF文件、和富链接预览。"),
    AppInfo(cover: "img_app_bg_2", title: "GoodNotes 5", subTitle: "手写笔记、手帐、PDF标注和整理", description: "让您的Mac变身智能数字纸张管理系统和强大文稿管理系统。\n在 Mac 上使用与 GoodNotes iPad 版相同的功能，随时随地使用自己的文稿。"),
    AppInfo(cover: "img_app_bg_3", title: "Notability", subTitle: "轻松笔记，轻松注解", description: "学生、教师、艺术人士和专业人士每天都使用Notability来丰富自己的生活。做笔记只是起点；用 Notability 寻找灵感、捕捉创意、释放创造力。")
]
