//
//  CameraManager.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

class CameraManager {
    
    private var _cameras:[CameraTypes: Camera] = [:]
    
    public var currentCamera: Camera!
    
    public func registerCamera(camera: Camera) {
        self._cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    public func setCamera(cameraType: CameraTypes) {
        self.currentCamera = _cameras[cameraType]
    }
    
    internal func update() {
        for camera in _cameras.values {
            camera.update()
        }
    }
}
