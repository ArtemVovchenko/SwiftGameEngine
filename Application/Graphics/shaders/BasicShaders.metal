#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    RasterizerData outputData;
    outputData.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    outputData.color = vIn.color;
    outputData.textureCoordinate = vIn.textureCoordinate;
    outputData.totalGameTime = sceneConstants.totalGameTime;
    
    return outputData;
}

fragment half4 basic_fragment_shader(RasterizerData rasterizedData [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]],
                                     sampler sampler2d [[ sampler(0) ]],
                                     texture2d<float> texture [[ texture(0) ]]) {
    float2 txCoord = rasterizedData.textureCoordinate;
    float4 color;
    
    if (material.useTexture) {
        color = texture.sample(sampler2d, txCoord);
    } else if (material.useMaterialColor) {
        color = material.color;
    } else {
        color = rasterizedData.color;
    }

    return half4(color.r, color.g, color.b, color.a);
}
