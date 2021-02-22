//
//  CubeCollection.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

import MetalKit

class CubeCollection: InstancedGameObject {
    var cubesWide: Int = 0
    var cubesHigh: Int = 0
    var cubesBack: Int = 0
    
    var time: Float = 0.0
    
    init(cubesWide: Int, cubesHigh: Int, cubesBack: Int) {
        super.init(meshType: .Cube_Custom, instancesCount: cubesWide * cubesHigh * cubesBack)
        
        self.cubesWide = cubesWide
        self.cubesHigh = cubesHigh
        self.cubesBack = cubesBack
        
        print("CUBES COUNT: \(cubesWide * cubesHigh * cubesBack)")
        
        setColor(RGBAFloatCode: SIMD4<Float>(1.0, 0.5, 0, 1))
    }
    
    override func doUpdate() {
        let halfWide = Float(cubesWide / 2),
            halfHigh = Float(cubesHigh / 2),
            halfBack = Float(cubesBack / 2)
        
        let gap = cos(time / 2) * 7
        var index: Int = 0
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
                    let node = _nodes[index]
                    node.setPosition(SIMD3<Float>(posX, posY, posZ))
                    node.rotate(x: 0, y: -GameTime.DeltaTime * 2, z: -GameTime.DeltaTime * 2)
                    node.setScale(0.3)
                    index += 1
                }
            }
        }
    }
}
