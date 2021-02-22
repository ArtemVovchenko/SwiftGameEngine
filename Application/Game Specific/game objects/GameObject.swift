import MetalKit

class GameObject : Node {
    
    var modelConstants = ModelConstants()
    private var material = Material()
    private var _textureType: TextureTypes = .None
    
    var mesh: Mesh!
    
    var deltaPosition: Float = 0
    
    init(objectMeshType: MeshTypes) {
        mesh = Entities.Meshes[objectMeshType]
    }
    
    override func update() {
        updateModelConstants()
        super.update()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
}

// Rendering object
extension GameObject : Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipeleineStates[.Basic])
        renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
        
        renderCommandEncoder.setFragmentSamplerState(Graphics.SamplerStates[.Linear], index: 0)
        if (material.useTexture) {
            renderCommandEncoder.setFragmentTexture(Entities.Textures[self._textureType], index: 0)
        }
        
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        mesh.drawPrimitives(renderCommandEncoder: renderCommandEncoder)
    }
}

// Material dealing
extension GameObject {
    public func setColor(RGBAFloatCode color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
    
    public func setTexture(_ textureType: TextureTypes) {
        self.material.useTexture = true
        self.material.useMaterialColor = false
        self._textureType = textureType
    }
}
