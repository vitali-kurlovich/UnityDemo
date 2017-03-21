Shader "Hidden/TVEffectShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;

			float3 frag (v2f i) : SV_Target
			{
    float2 q = i.uv;
    float2 uv = float2(0.5,0.5) + (q-0.5)*(0.9 + 0.1*sin(0.12*_Time.y));
    float3 col = float3( 
		tex2D(_MainTex, float2(uv.x+0.003, uv.y)).x,
	tex2D(_MainTex,float2(uv.x+0.000,uv.y)).y,
     tex2D(_MainTex,float2(uv.x-0.003,uv.y)).z);
    col = clamp(col*0.5+0.5*col*col*1.2,0.0,1.0);
    col *= 0.5 + 0.5*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y);
    col *= 0.9+0.1*sin(10.0*_Time.y+uv.y*1000.0);
    col *= 0.99+0.01*sin(110.0*_Time.y);
				return col;
			}
			ENDCG
		}
	}
}
