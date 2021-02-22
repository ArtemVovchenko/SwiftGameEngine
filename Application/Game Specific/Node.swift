//
//  Node.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 17.02.2021.
//

import MetalKit

class Node {
    private var _name:String = "Node"
    private var _id: String!
    
    private var _position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    private var _scale: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    private var _rotation: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    var parentModelMatrix = matrix_identity_float4x4
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: _position)
        modelMatrix.rotate(axis: X_AXIS, angle: _rotation.x)
        modelMatrix.rotate(axis: Y_AXIS, angle: _rotation.y)
        modelMatrix.rotate(axis: Z_AXIS, angle: _rotation.z)
        modelMatrix.scale(axis: _scale)
        return matrix_multiply(parentModelMatrix, modelMatrix)
    }
    
    var children: [Node] = []
    
    init(withName name: String = "Node") {
        self._name = name
        self._id = UUID().uuidString
    }
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    // Update Function for overrifing
    func doUpdate() {}
    
    func update() {
        doUpdate()
        for child in children {
            child.parentModelMatrix = self.modelMatrix
            child.update()
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.pushDebugGroup("Rendering \(_name)")
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder: renderCommandEncoder)
        }
        
        for child in children{
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        renderCommandEncoder.popDebugGroup()
    }
}

extension Node {
    func setName(name: String) { self._name = name }
    func getName() -> String { return self._name }
    func getID() -> String { return self._id }
    
    func setPosition(_ position: SIMD3<Float>) { self._position = position }
    func setPositionX(_ xPosition: Float) { self._position.x = xPosition }
    func setPositionY(_ yPosition: Float) { self._position.y = yPosition }
    func setPositionZ(_ zPosition: Float) { self._position.z = zPosition }
    func getPosition() -> SIMD3<Float> { return self._position }
    func getPositionX() -> Float { return self._position.x }
    func getPositionY() -> Float { return self._position.y }
    func getPositionZ() -> Float { return self._position.z }
    func move(x: Float, y: Float, z: Float) { self._rotation += SIMD3<Float>(x, y, z) }
    func moveX(delta: Float) { self._position.x += delta }
    func moveY(delta: Float) { self._position.y += delta }
    func moveZ(delta: Float) { self._position.z += delta }
    
    func setRotation(_ rotation: SIMD3<Float>) { self._rotation = rotation }
    func setRotationX(_ xRotation: Float) { self._rotation.x = xRotation }
    func setRotationY(_ yRotation: Float) { self._rotation.y = yRotation }
    func setRotationZ(_ zRotation: Float) { self._rotation.z = zRotation }
    func getRotation() -> SIMD3<Float> { return self._rotation }
    func getRotationX() -> Float { return self._rotation.x }
    func getRotationY() -> Float { return self._rotation.y }
    func getRotationZ() -> Float { return self._rotation.z }
    func rotate(x: Float, y: Float, z: Float) { self._rotation += SIMD3<Float>(x, y, z) }
    func rotateX(delta: Float) { self._rotation.x += delta }
    func rotateY(delta: Float) { self._rotation.y += delta }
    func rotateZ(delta: Float) { self._rotation.z += delta }
    
    func setScale(_ scale: SIMD3<Float>) { self._scale = scale }
    func setScale(_ scale: Float) { self.setScale(SIMD3<Float>(repeating: scale)) }
    func setScaleX(_ scaleX: Float) { self._scale.x = scaleX }
    func setScaleY(_ scaleY: Float) { self._scale.y = scaleY }
    func setScaleZ(_ scaleZ: Float) { self._scale.z = scaleZ }
    func getScale() -> SIMD3<Float> { return self._scale }
    func getScaleX() -> Float { return self._scale.x }
    func getScaleY() -> Float { return self._scale.y }
    func getScaleZ() -> Float { return self._scale.z }
    func scale(x: Float, y: Float, z: Float) { self._scale += SIMD3<Float>(x, y, z) }
    func scaleX(delta: Float) { self._scale.x += delta }
    func scaleY(delta: Float) { self._scale.y += delta }
    func scaleZ(delta: Float) { self._scale.z += delta }
}
