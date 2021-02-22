import MetalKit

class InstancedGameObject: Node {
    private var _mesh: Mesh!
    
    var material = Material()
    
    internal var _nodes: [Node] = []
    private var _modelConstantsBuffer: MTLBuffer!
    
    init(meshType: MeshTypes, instancesCount: Int) {
        super.init(withName: "Instanced Game Object")
        self._mesh = Entities.Meshes[meshType]
        self._mesh.setInstanceCount(instancesCount)
        self.generateInstances(instancesCount)
        self.createBuffers(instancesCount)
    }
    
    private func generateInstances(_ instanceCount: Int) {
        for _ in 0..<instanceCount {
            _nodes.append(Node())
        }
    }
    
    func createBuffers(_ instanceCount: Int) {
        _modelConstantsBuffer = Engine.Device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
    }
    
    private func updateModelConstants() {
        // It is expencive to generate new buffers
        // so we can iterate over buffer's memory and change it's content
        var buffreContentPointer = _modelConstantsBuffer.contents().bindMemory(to: ModelConstants.self, capacity: _nodes.count)
        
        for node in _nodes {
            buffreContentPointer.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
            buffreContentPointer = buffreContentPointer.advanced(by: 1)
        }
    }
    
    override func update() {
        updateModelConstants()
        super.update()
    }
}

// Rendering
extension InstancedGameObject: Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipeleineStates[.Instanced])
        renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
        
        renderCommandEncoder.setVertexBuffer(_modelConstantsBuffer, offset: 0, index: 2)
        
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        _mesh.drawPrimitives(renderCommandEncoder: renderCommandEncoder)
    }
}

// Material dealing
extension InstancedGameObject {
    public func setColor(RGBAFloatCode color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
