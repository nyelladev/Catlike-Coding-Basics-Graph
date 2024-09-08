Shader"Graph/Point Surface" {
	
	// Exposes Property to Unity to allow uses to configure
	Properties {
			_Smoothness ("Smoothness", Range(0,1)) = 0.5
	}

	SubShader 
	{

		CGPROGRAM
		// Tells the shader compiler to use standard lighting and Full support shadows 
		#pragma surface ConfigureSurface Standard fullforwardshadows
		#pragma target 3.0
		struct Input {
			float3 worldPos;
		};

		float _Smoothness;
		
		// inout is used to indicate its passed and used for the result of the function
		void ConfigureSurface(Input input, inout SurfaceOutputStandard surface){
			
			// Color is (R,G,B) Thus X Controls R. If X [-1,1] it wont fit in the range so we half it.
			surface.Albedo.rg = saturate(input.worldPos.xy * 0.5 + 0.5);
			surface.Smoothness = _Smoothness;
		}

		ENDCG
	}
	
FallBack"Diffuse"
}