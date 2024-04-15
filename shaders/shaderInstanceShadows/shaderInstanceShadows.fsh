varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D Palette; //Color map texture
uniform sampler2D Shadow; // Shadow surface
uniform sampler2D Lights; // Lights surface
uniform float ShadowMaskValue;
uniform float AmbientLight;
uniform int Flashing;
// Corresponds to camera position divided by surface size
uniform vec4 RelativeCoords; //Left, Top, Right, Bottom
uniform vec2 ScreenSize;

void main()
{
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
	if (col.a <= 0.0) {
		discard;
	}
	

	if (Flashing > 0) {
		col = (any(greaterThan(col.rgb, vec3(0.0, 0.0, 0.0)))) ? vec4(1.0, 1.0, 1.0, 1.0) : col;
	}
	
	vec2 shadowPos = vec2(
		clamp(mix(RelativeCoords.r, RelativeCoords.b, gl_FragCoord.x/ScreenSize.x), 0.0, 1.0),
		clamp(mix(RelativeCoords.g, RelativeCoords.a, gl_FragCoord.y/ScreenSize.y), 0.0, 1.0)
		//gl_FragCoord.x,
		//gl_FragCoord.y
	);
	//gl_FragColor = vec4(shadowPos.xy, 0.0, 1.0);
	//return;
	float shadowValue = texture2D(Shadow, shadowPos).r;
	if (shadowValue <= 0.0 && AmbientLight <= 0.0) {
		gl_FragColor = col;
		return;
	}
	
	float dif = (shadowValue - ShadowMaskValue);
	float intensity = AmbientLight;
	
	intensity -= texture2D(Lights, shadowPos).r;
	
	//If shadow is greater than mask;
	if (dif > 0.001) {
		intensity = 1.0;
	}
	//Subtract Light from intensity here
	if (intensity > 0.0) {
		
		vec2 pos = vec2(
			(0.0625 * col.r) + floor(col.b * 16.0)/16.0 - 0.00390625/2.0,
			(1.0 * col.g)
		);
		vec4 pal_color = vec4(texture2D(Palette, pos).rgb, col.a);
		gl_FragColor = mix(col, pal_color, intensity);
		return;
		//vec4 sub = texture2D(gm_BaseTexture, v_vTexcoord) - texture2D(Mask, v_vTexcoord);
		//gl_FragColor = vec4(sub.r, sub.g, sub.b, 1.0);
	}
	gl_FragColor = col;
}
