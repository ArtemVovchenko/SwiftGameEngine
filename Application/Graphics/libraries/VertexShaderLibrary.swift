//
//  VertexShaderLibrary.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

import MetalKit

enum VertexShaderTypes {
    case Basic
    case Instanced
}

class VertexShaderLibrary: Library<VertexShaderTypes, MTLFunction> {
    
    private var _library: [VertexShaderTypes: Shader] = [:]
    
    override func fillLibrary() {
        _library.updateValue(Shader(name: "Basic Verex Shader",
                                    functionName: "basic_vertex_shader"),
                             forKey: .Basic)
        _library.updateValue(Shader(name: "Instanced Verex Shader",
                                    functionName: "instanced_vertex_shader"),
                             forKey: .Instanced)
    }
    
    override subscript(_ type: VertexShaderTypes) -> MTLFunction {
        return (_library[type]?.function)!
    }
}

