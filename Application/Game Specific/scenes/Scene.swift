import MetalKit

class Scene: Node {
    
    var cameraManager = CameraManager()
    var sceneConstants = SceneConstants()
    
    init() {
        super.init(withName: "Scene")
        buildScene()
    }
    
    func buildScene() {}
    
    func addCamera(_ camera: Camera, isCurrentCamera: Bool = true) {
        cameraManager.registerCamera(camera: camera)
        if (isCurrentCamera) {
            cameraManager.setCamera(cameraType: camera.cameraType)
        }
    }
    
    func updateSceneConstants() {
        sceneConstants.totalGameTime = GameTime.TotalGameTime
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
        sceneConstants.projectionMatrix = cameraManager.currentCamera.projectionMatrix
    }
    
    func updateCameras() {
        cameraManager.update()
    }
    
    override func update() {
        updateSceneConstants()
        super.update()
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.size, index: 1)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
}
