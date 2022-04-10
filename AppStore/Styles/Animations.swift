//
//  Animations.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/13.
//

import SwiftUI

var debugAnimations = false

extension Animation {
    static var openCard: Animation { debugAnimations ? debug : .spring(response: 0.5, dampingFraction: 0.7) }

    static var closeCard: Animation { debugAnimations ? debug : .spring(response: 0.6, dampingFraction: 0.8) }

    static var blur: Animation { debugAnimations ? debug : .linear(duration: 0.25) }
    
    static var debug: Animation { .linear }
}
