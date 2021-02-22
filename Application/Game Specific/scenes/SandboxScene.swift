//
//  SandboxScene.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 17.02.2021.
//

import MetalKit


class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    var cube = Cube()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)
        
        addChild(cube)
    }
    
    override func doUpdate() {
        cube.rotateY(delta: GameTime.DeltaTime)
    }
}
