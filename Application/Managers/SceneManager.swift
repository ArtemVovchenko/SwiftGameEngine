//
//  SceneManager.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 17.02.2021.
//

import MetalKit

enum SceneTypes {
    case Sandbox
}

class SceneManager {
    
    private static var _curentScene: Scene!
    
    public static func Initialize(sceneType: SceneTypes) {
        SetScene(sceneType: sceneType)
    }
    
    public static func SetScene(sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            _curentScene = SandboxScene()
        }
    }
    
    public static func TickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        GameTime.UpdateTime(deltaTime)
        
        _curentScene.updateCameras()
        _curentScene.update()
        _curentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
