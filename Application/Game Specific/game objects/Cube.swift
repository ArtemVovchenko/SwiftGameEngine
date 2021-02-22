import MetalKit

class Cube: GameObject {
    
    init() {
        super.init(objectMeshType: .Cube_Custom)
        self.setName(name: "Cube")
    }
    
    override func doUpdate() {
        self.rotateX(delta: GameTime.DeltaTime)
        self.rotateY(delta: GameTime.DeltaTime)
    }
}
