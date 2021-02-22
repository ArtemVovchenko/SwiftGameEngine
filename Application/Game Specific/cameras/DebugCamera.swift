//
//  DebugCamera.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

import simd

class DebugCamera: Camera {
    
    override var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.Perspective(degreesFov: 45,
                                           aspectRatio: Renderer.AspectRatio,
                                           near: 0.1,
                                           far: 1000)
    }
    
    init() {
        super.init(cameraType: .Debug)
    }
}
