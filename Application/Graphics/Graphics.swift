class Graphics {
    private static var _vertexShaderLibrary: VertexShaderLibrary!
    public static var VertexShaders: VertexShaderLibrary { return self._vertexShaderLibrary }
    
    private static var _fragmentShaderLibrary: FragmentShaderLibrary!
    public static var FragmentShaders: FragmentShaderLibrary { return self._fragmentShaderLibrary }
    
    private static var _vertexDescriptorLibrary: VertexDescriptorLibrary!
    public static var VertexDescriptors: VertexDescriptorLibrary { return self._vertexDescriptorLibrary }
    
    private static var _renderPipelineDescriptorLibrary: RenderPipelineDescriptorLibrary!
    public static var RenderPipelineDescriptors: RenderPipelineDescriptorLibrary { return self._renderPipelineDescriptorLibrary }
    
    private static var _renderPipelineStateLibrary: RenderPipelineStateLibrary!
    public static var RenderPipeleineStates: RenderPipelineStateLibrary { return self._renderPipelineStateLibrary }
    
    private static var _depthStencilStateLibrary: DepthStencilStateLibrary!
    public static var DepthStencilStates: DepthStencilStateLibrary { return self._depthStencilStateLibrary }
    
    private static var _samplerStateLibrary: SamplerStateLibrary!
    public static var SamplerStates: SamplerStateLibrary { return self._samplerStateLibrary }
    
    public static func Initialize() {
        self._vertexShaderLibrary = VertexShaderLibrary()
        self._fragmentShaderLibrary = FragmentShaderLibrary()
        self._vertexDescriptorLibrary = VertexDescriptorLibrary()
        self._depthStencilStateLibrary = DepthStencilStateLibrary()
        self._renderPipelineDescriptorLibrary = RenderPipelineDescriptorLibrary()
        self._renderPipelineStateLibrary = RenderPipelineStateLibrary()
        self._samplerStateLibrary = SamplerStateLibrary()
    }
}
