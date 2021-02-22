//
//  Cube.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

import MetalKit

class Cube: GameObject {
    
    init() {
        super.init(objectMeshType: .Cube_Custom)
        self.setName(name: "Cube")
    }
    
    override func doUpdate() {
        self.rotateX(delta: GameTime.DeltaTime)
        self.rotateY(delta: GameTime.DeltaTime)
    }
}
