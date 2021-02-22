import MetalKit

enum SamplerStateTypes {
    case None
    case Linear
}

class SamplerStateLibrary: Library<SamplerStateTypes, MTLSamplerState> {
    private var _library: [SamplerStateTypes: SamplerState] = [:]
    
    override func fillLibrary() {
        _library.updateValue(Linear_SamplerState(), forKey: .Linear)
    }
    
    override subscript(_ type: SamplerStateTypes) -> MTLSamplerState {
        return (_library[type]?.samplerState!)!
    }
}

protocol SamplerState {
    var name: String! { get }
    var samplerState: MTLSamplerState! { get }
}

class Linear_SamplerState: SamplerState {
    var name: String! = "Linear Sampler State"
    var samplerState: MTLSamplerState!
    
    init() {
        let samplerStateDescriptor = MTLSamplerDescriptor()
        samplerStateDescriptor.minFilter = .linear
        samplerStateDescriptor.magFilter = .linear
        samplerStateDescriptor.label = self.name
        self.samplerState = Engine.Device.makeSamplerState(descriptor: samplerStateDescriptor)
    }
}
