//
//  Styles.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/7.
//
import SwiftUI

struct CardStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
}

struct ImageCheckedModifier: ViewModifier {
    
    var check: Bool
    var cornerRadius:CGFloat
    
    func body(content: Content) -> some View {
        if check {
            content
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
        } else {
            content
        }
    }
    
}

struct CheckedModifier: ViewModifier {
    
    var check: Bool
    
    func body(content: Content) -> some View {
        if check {
            content
                .overlay(
                    Image(systemName: "checkmark")
                        .imageScale(.medium)
                        .foregroundColor(Color.white)
                )
        } else {
            content
        }
    }
    
}

extension View {
    
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
    
    func imageCheckedStyle(check: Bool, cornerRadius:CGFloat = 8.0) -> some View {
        modifier(ImageCheckedModifier(check: check, cornerRadius: cornerRadius))
    }
    
    func checkedStyle(check: Bool) -> some View {
        modifier(CheckedModifier(check: check))
    }
    
}


