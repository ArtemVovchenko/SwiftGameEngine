//
//  Pointer.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

import MetalKit

class Pointer: GameObject {
    
    private var camera: Camera!
    init(camera: Camera) {
        super.init(objectMeshType: .Triangle_Custom)
        self.camera = camera
        self.setName(name: "Pointer")
    }
}
