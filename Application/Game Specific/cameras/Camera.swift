//
//  Camera.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

import simd

enum CameraTypes {
    case Debug
}

class Camera: Node {
    var cameraType: CameraTypes!
    
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        viewMatrix.translate(direction: -getPosition())
        return viewMatrix
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    init(cameraType: CameraTypes) {
        super.init(withName: "Camera")
        self.cameraType = cameraType
    }
}
