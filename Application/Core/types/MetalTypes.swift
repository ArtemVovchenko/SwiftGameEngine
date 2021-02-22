//
//  MetalTypes.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

import simd

protocol Sizeable {}

extension Sizeable {
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
    
    static var size: Int {
        return MemoryLayout<Self>.size
    }
    
    static var stride: Int {
        return MemoryLayout<Self>.stride
    }
}

struct Vertex: Sizeable{
    var position: SIMD3<Float>
    var color: SIMD4<Float>
    var textureCoordinate: SIMD2<Float>
}

struct ModelConstants: Sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizeable {
    var totalGameTime: Float = 0
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

struct Material: Sizeable {
    var color: SIMD4<Float> = SIMD4<Float>(0.8, 0.8, 0.8, 1.0)
    var useMaterialColor: Bool = false
    var useTexture: Bool = false
}

extension SIMD2: Sizeable {}
extension SIMD3: Sizeable {}
extension SIMD4: Sizeable {}

extension Float: Sizeable {}


