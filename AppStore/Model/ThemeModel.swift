//
//  Theme.swift
//  AppStore
//
//  Created by 袁志健 on 2022/4/5.
//

import SwiftUI

//MARK: - Dark Model
struct MyDarkModel: Identifiable {
  let id: Int
  let image: String
  let name: String
}

//MARK: - Accent Color
struct MyAccentColor: Identifiable {
  let id: Int
  let name: String
  let color: Color
}
