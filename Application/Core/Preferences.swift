//
//  Preferences.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 16.02.2021.
//

import MetalKit


public enum ClearColors {
    static let White: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Green: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Grey: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Black: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let DarklatesGray: MTLClearColor = MTLClearColor(red: 0.18, green: 0.33, blue: 0.33, alpha: 1.0)
}


class Preferences {
    public static var ClearColor: MTLClearColor = ClearColors.DarklatesGray
    
    public static var MainPixelFormat: MTLPixelFormat = .bgra8Unorm_srgb
    
    public static var MainDepthPixelFormat: MTLPixelFormat = .depth32Float
    
    public static var StartingSceneType: SceneTypes = .Sandbox
    
    public static var TextureBundleURL: URL = Bundle.main.url(forResource: "Textures", withExtension: "bundle")!
}
