//
//  InstancedShaders.metal
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 20.02.2021.
//

#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

// I didn't understand what is [[ instance_id ]] exactly
vertex RasterizerData instanced_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                             constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                             constant ModelConstants *modelConstants [[ buffer(2) ]],
                                             uint instanceId [[ instance_id ]]) {
    ModelConstants modelConstant = modelConstants[instanceId];
    
    RasterizerData outputData;
    outputData.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstant.modelMatrix * float4(vIn.position, 1);
    outputData.color = vIn.color;
    
    return outputData;
}

