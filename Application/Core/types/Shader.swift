//
//  Shader.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

import MapKit

class Shader {
    var function: MTLFunction!
    
    init (name: String, functionName: String) {
        self.function = Engine.DefaultLibrary.makeFunction(name: functionName)
        self.function.label = name
    }
}
