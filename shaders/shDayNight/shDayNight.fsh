//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 col;
uniform float modifier[5];

#define CONTRAST			modifier[0]
#define SATURATION			modifier[1]
#define BRIGHTNESS			modifier[2]
#define POP_STRENGTH		modifier[3]
#define POP_THRESHOLD		modifier[4]

void main()
{
	vec3 out_col	= texture2D( gm_BaseTexture, v_vTexcoord ).rgb;
	
	float gray		= dot(out_col, vec3(0.114, 0.587, 0.299));
	
	// Contrast, saturation, and brightness:
	out_col			= (out_col - 0.5) * CONTRAST + 0.5;
	out_col			= mix(vec3(gray), out_col, SATURATION);
	out_col			= out_col + BRIGHTNESS;
	
	// Moon Lighting:
	out_col			= out_col + POP_STRENGTH * max(gray - POP_THRESHOLD, 0.0);
	
    gl_FragColor	= v_vColour * vec4(out_col * col, 1.0);
}
