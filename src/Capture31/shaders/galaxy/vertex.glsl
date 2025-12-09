uniform float uTime;
uniform float uSize;

attribute float aScale;
attribute vec3 aRandomness;

varying vec3 vColor;

void main() {
        /**
        * Position
        */
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //Spin 
    float angle = atan(modelPosition.z, modelPosition.x);
    float radius = length(modelPosition.xz);
    float angleOffset = (1.0 / radius) * uTime * 0.2;
    angle += angleOffset;
    modelPosition.x = cos(angle) * radius;
    modelPosition.z = sin(angle) * radius;


    // Randomness
    modelPosition.xyz += aRandomness;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

        /**
        * Size
        */
    gl_PointSize = uSize * aScale;
    gl_PointSize *= (1.0 / -viewPosition.z);

    /**
    * Color
    */
    vColor = color;
}