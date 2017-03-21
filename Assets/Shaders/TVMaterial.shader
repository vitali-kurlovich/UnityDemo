Shader "Custom/TVMaterial" {


	Properties {
		_Color ("Color", Color) = (1, 1, 1, 1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0, 1)) = 0.5
		_Metallic ("Metallic", Range(0, 1)) = 0.0
		_Emission ("Emission", 2D) = "white" {}
	}
	SubShader {
		Tags {"RenderType" = "Opaque"}
		LOD 200
		
		CGPROGRAM
		#include "UnityCG.cginc"
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex; 
		sampler2D _Emission;

		struct Input {
			float2 uv_MainTex; 
		}; 

		half _Glossiness; 
		half _Metallic; 
		fixed4 _Color; 

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color; 
			o.Albedo = c.rgb; 
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic; 
			o.Smoothness = _Glossiness; 
			o.Alpha = c.a; 
			


float2 q = IN.uv_MainTex; 

float2 uv = float2(0.5, 0.5) + (q-0.5) * (0.9 + 0.1 * sin(0.12 * _Time.y)); 
float3 col = half3(
		tex2D(_Emission, float2(uv.x + 0.003, uv.y)).x, 
	tex2D(_Emission, float2(uv.x + 0.000, uv.y)).y, 
tex2D(_Emission, float2(uv.x-0.003, uv.y)).z); 
col = clamp(col * 0.5 + 0.5 * col * col * 1.2, 0.0, 1.0); 
col *= (0.5 + 0.5 * 16.0 * uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y)); 
col *= 0.9 + 0.1 * sin(10.0 * _Time.y + uv.y * 300.0); 
col *= 0.99 + 0.01 * sin(110.0 * _Time.y); 


o.Emission =  col; // half3(0.0, 0.4, 0.0); 

		}
		ENDCG
	}
	FallBack "Diffuse"
}
