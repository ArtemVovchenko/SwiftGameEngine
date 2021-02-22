import simd

class Quad: GameObject {
    
    init() {
        super.init(objectMeshType: .Quad_Custom)
        self.setName(name: "Quad")
    }
}
