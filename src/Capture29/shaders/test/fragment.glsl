#define PI 3.1415926535897932384626433832795

uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;



varying vec2 vUv;
varying float vElevation;

void main() {
    float maxStrength = (vElevation + uColorOffset) * uColorMultiplier;
    vec3 color = mix(uDepthColor, uSurfaceColor, maxStrength);

    gl_FragColor = vec4(color, 1.0);
    //Black or white verion
    // gl_FragColor = vec4(vec3(noise), 1.0);
}