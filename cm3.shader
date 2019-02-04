Shader "Custom/CubemapShader" {
    Properties {
        _Cube("cm3", CUBE) = "" {}
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 200
        
        CGPROGRAM
        #pragma surface surf Lambert
 
        struct Input {
            float2 uv_MainTex;
            float3 worldRefl;
        };
 
        samplerCUBE _Cube;
 
    void surf(Input IN, inout SurfaceOutput o) {
        o.Emission = texCUBE(_Cube, IN.worldRefl).rgb;
    }
        ENDCG
    }
    FallBack "Diffuse"
}