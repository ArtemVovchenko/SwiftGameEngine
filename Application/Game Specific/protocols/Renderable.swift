//
//  Renderable.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 17.02.2021.
//

import MetalKit

protocol Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder)
}
