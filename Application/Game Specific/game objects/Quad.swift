//
//  Quad.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

import simd

class Quad: GameObject {
    
    init() {
        super.init(objectMeshType: .Quad_Custom)
        self.setName(name: "Quad")
    }
}
