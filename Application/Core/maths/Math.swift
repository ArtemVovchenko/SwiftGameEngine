import simd


public var X_AXIS: SIMD3<Float> {
    return SIMD3<Float>(1, 0, 0)
}

public var Y_AXIS: SIMD3<Float> {
    return SIMD3<Float>(0, 1, 0)
}

public var Z_AXIS: SIMD3<Float> {
    return SIMD3<Float>(0, 0, 1)
}

extension Float {
    var toRadians: Float {
        return (self / 180.0) * Float.pi
    }
    
    var toDegrees: Float {
        return self * (180.0 / Float.pi)
    }
    
    static var randomZeroToOne: Float {
        return Float(arc4random()) / Float(UINT32_MAX)
    }
}

extension matrix_float4x4 {
    mutating func translate(direction: SIMD3<Float>) {
        var result = matrix_identity_float4x4
        
        let x: Float = direction.x,
            y: Float = direction.y,
            z: Float = direction.z
        
        result.columns = (
            SIMD4<Float>(1, 0, 0, 0),
            SIMD4<Float>(0, 1, 0, 0),
            SIMD4<Float>(0, 0, 1, 0),
            SIMD4<Float>(x, y, z, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func scale(axis: SIMD3<Float>) {
        var result = matrix_identity_float4x4
        
        let x: Float = axis.x,
            y: Float = axis.y,
            z: Float = axis.z
        
        result.columns = (
            SIMD4<Float>(x, 0, 0, 0),
            SIMD4<Float>(0, y, 0, 0),
            SIMD4<Float>(0, 0, z, 0),
            SIMD4<Float>(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotate(axis: SIMD3<Float>, angle: Float) {
        var result = matrix_identity_float4x4
        
        let x = axis.x,
            y = axis.y,
            z = axis.z
        
        let c = cos(angle),
            s = sin(angle),
            d = 1 - c
        
        let r1c1 = c + d * x * x,
            r1c2 = d * x * y - s * z,
            r1c3 = d * x * z + s * y,
            
            r2c1 = d * x * y + s * z,
            r2c2 = c + d * y * y,
            r2c3 = d * y * z - s * x,
            
            r3c1 = d * z * x - s * y,
            r3c2 = d * z * y + s * x,
            r3c3 = c + d * z * z
        
        result.columns = (
            SIMD4<Float>(r1c1, r1c2, r1c3, 0),
            SIMD4<Float>(r2c1, r2c2, r2c3, 0),
            SIMD4<Float>(r3c1, r3c2, r3c3, 0),
            SIMD4<Float>(   0,    0,    0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    static func Perspective(degreesFov: Float, aspectRatio: Float, near:Float, far: Float) -> matrix_float4x4 {
        let fov = degreesFov.toRadians
        
        let t: Float = tan(fov / 2)
            
        let x: Float = 1 / (aspectRatio * t),
            y: Float = 1 / t,
            z: Float = -((far + near) / (far - near)),
            w: Float = -((2 * far * near) / (far - near))
        
        var result = matrix_identity_float4x4
        result.columns = (
            SIMD4<Float>(x, 0, 0,  0),
            SIMD4<Float>(0, y, 0,  0),
            SIMD4<Float>(0, 0, z, -1),
            SIMD4<Float>(0, 0, w,  0)
        )
        return result
    }
}
