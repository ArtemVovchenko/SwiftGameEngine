//
//  TextureLibrary.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 22.02.2021.
//

import MetalKit

enum TextureTypes {
    case None
    case PartyPirateParot
}

class TextureLibrary: Library<TextureTypes, MTLTexture> {
    private var _library: [TextureTypes: Texture] = [:]
    
    override func fillLibrary() {
        _library.updateValue(Texture(textureFileName: "PartyPirateParot"), forKey: .PartyPirateParot)
    }
    
    override subscript(type: TextureTypes) -> MTLTexture? {
        return _library[type]?.texture
    }
}

enum TextureOrigin {
    case TopLeft
    case BotoomLeft
}

class Texture {
    var texture: MTLTexture!
    
    init(textureFileName: String, fileExtention: String = "png", origin: TextureOrigin = .TopLeft) {
        let textureLoader = TextureLoader(textureFileName: textureFileName, fileExtention: fileExtention, origin: origin)
        let texture = textureLoader.loadTextureFromBundle()
        self.setTexture(texture)
    }
    
    func setTexture(_ texture: MTLTexture) {
        self.texture = texture
    }
}

class TextureLoader {
    private var _textureFileName: String!
    private var _textureFileExtention: String!
    private var _origin: MTKTextureLoader.Origin!
    private var _textureBundle: Bundle!
    
    init(textureFileName: String, fileExtention: String = "png", origin: TextureOrigin = .TopLeft) {
        self._textureBundle = Bundle.init(url: Preferences.TextureBundleURL)
        self._textureFileName = textureFileName
        self._textureFileExtention = fileExtention
        self.setTextureOrigin(specifiedOriginType: origin)
        
    }
    
    private func setTextureOrigin(specifiedOriginType: TextureOrigin) {
        switch specifiedOriginType {
        case .BotoomLeft:
            self._origin = MTKTextureLoader.Origin.bottomLeft
        case .TopLeft:
            self._origin = MTKTextureLoader.Origin.topLeft
        }
    }
    
    public func loadTextureFromBundle() -> MTLTexture {
        var result: MTLTexture!
        print(Bundle.main.bundlePath)
        
        if let url = self._textureBundle.url(forResource: self._textureFileName, withExtension: self._textureFileExtention) {
            
            let textureLoader = MTKTextureLoader(device: Engine.Device)
            let loadOptions: [MTKTextureLoader.Option: Any] = [MTKTextureLoader.Option.origin: self._origin!]
             
            do {
                result = try textureLoader.newTexture(URL: url, options: loadOptions)
            } catch {
                print("ERROR_CREATING_TEXTURE::\(String(describing: self._textureFileName))::\(error)\n")
            }
            
        } else {
            print("ERROR_CREATING_TEXTURE::\(String(describing: self._textureFileName))::FILE DOES NOT EXIST\n")
        }
        
        return result
    }
}

