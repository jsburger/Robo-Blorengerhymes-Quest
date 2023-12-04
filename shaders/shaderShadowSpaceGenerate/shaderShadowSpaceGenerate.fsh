varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D pal;
uniform float color_count;

vec3 convertToWeird(vec3 color) {
	const float Xr = 95.047;
	const float Yr = 100.0;
	const float Zr = 108.883;
	
	float R = color.r;
	float G = color.g;
	float B = color.b;
	
	if (R > 0.04045) {
		R = pow((R + 0.055)/1.055,2.4);
	}
	else {
		R = R/12.92;
	}
	
    if (G > 0.04045) {
        G = pow((G+0.055)/1.055,2.4);
	}
	else {
        G = G/12.92;
	}
	
    if (B > 0.04045) {
        B = pow((B+0.055)/1.055,2.4);
	}
    else {
        B = B/12.92;
	}

    R *= 100.;
    G *= 100.;
    B *= 100.;

    float X =  0.4124*R + 0.3576*G + 0.1805*B;
    float Y =  0.2126*R + 0.7152*G + 0.0722*B;
    float Z =  0.0193*R + 0.1192*G + 0.9505*B;
	
	float xr = X/Xr;
    float yr = Y/Yr;
    float zr = Z/Zr;

    if ( xr > 0.008856 ) {
        xr = pow(xr, 1.0/3.0);
	}
    else {
        xr = ((7.787 * xr) + 16.0 / 116.0);
	}

    if ( yr > 0.008856 ) {
        yr = pow(yr, 1.0/3.0);
	}
    else {
        yr = ((7.787 * yr) + 16.0 / 116.0);
	}
	
    if ( zr > 0.008856 ) {
        zr = pow(zr, 1.0/3.0);
	}
    else {
        zr = ((7.787 * zr) + 16.0 / 116.0);
	}

	return vec3((116.0 * yr) - 16.0, 500.0 * (xr-yr), 200.0 *(yr-zr));
   	
}

void main()
{
     vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	 vec3 converted = convertToWeird(col.rgb);
	 
	 vec4 closest = vec4(0.0, 0.0, 0.0, 1.0);
	 vec3 close_converted = convertToWeird(closest.rgb);
	 float dif = distance(close_converted.rgb, converted.rgb);
	 //float dif = distance(col.rgb, closest.rgb);
	 vec4 testcase;
	 float testdif;
	 vec3 testconverted;
	 float _y = 0.0;
	 for (float i = 0.0; (i < color_count); i++) {
		 _y = (i + .01)/color_count;
		 // Light color
		 testcase = texture2D(pal, vec2(.2, _y));
		 testconverted = convertToWeird(testcase.rgb);
		 testdif = distance(converted, testconverted);
		 //testdif = distance(col.rgb, testcase.rgb);
		 if (testdif < dif) {
			 //Since this is a shadow generator, save the darker equivalient instead
			 closest = texture2D(pal, vec2(.7, _y));
			 dif = testdif;
		 }
		 
		 //Dark color
		 testcase = texture2D(pal, vec2(.7, _y));
		 testconverted = convertToWeird(testcase.rgb);
		 testdif = distance(converted, testconverted);
		 //testdif = distance(col.rgb, testcase.rgb);
		 if (testdif < dif) {
			 closest = testcase;
			 dif = testdif;
		 }
	 }
	 
	 gl_FragColor = closest;
	 //gl_FragColor = vec4(v_vTexcoord.x, v_vTexcoord.y, 0.0, 1.0);
	 //gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}
