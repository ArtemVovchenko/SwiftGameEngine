//
//  Entity.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

class Entities {
    
    private static var _meshLibrary: MeshLibrary!
    public static var Meshes: MeshLibrary { return self._meshLibrary }
    
    private static var _textureLibrary: TextureLibrary!
    public static var Textures: TextureLibrary { return self._textureLibrary }
    
    public static func Initialize() {
        self._meshLibrary = MeshLibrary()
        self._textureLibrary = TextureLibrary()
    }
}
