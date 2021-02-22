//
//  GameView.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 15.02.2021.
//

import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        Engine.Ignite(device: device!)
        
        self.renderer = Renderer(self)
        
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.MainPixelFormat
        self.depthStencilPixelFormat = Preferences.MainDepthPixelFormat
        self.delegate = renderer
    }
}
