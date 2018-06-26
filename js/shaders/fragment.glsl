precision mediump float;

uniform vec4 iMouse;
uniform vec2 iResolution;
uniform float iTime;

float smin(float, float, float);
vec3 estimateNormal(vec3);

//#define EPSILON = 0.0000001
const float EPSILON = 0.0001;

float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 p){
    vec2 ip = floor(p);
    vec2 u = fract(p);
    u = u*u*(3.0-2.0*u);
    
    float res = mix(
        mix(rand(ip),rand(ip+vec2(1.0,0.0)),u.x),
        mix(rand(ip+vec2(0.0,1.0)),rand(ip+vec2(1.0,1.0)),u.x),u.y);
    return res*res;
}

void main()
{
    gl_FragColor = vec4(1., 0, 0, 1.);
}

vec3 estimateNormal(vec3 p) {
    // return normalize(vec3(        
    //     sphereFunc(vec3(p.x + EPSILON, p.y, p.z)) - sphereFunc(vec3(p.x - EPSILON, p.y, p.z)),
    //     sphereFunc(vec3(p.x, p.y + EPSILON, p.z)) - sphereFunc(vec3(p.x, p.y - EPSILON, p.z)),
    //     sphereFunc(vec3(p.x, p.y, p.z  + EPSILON)) - sphereFunc(vec3(p.x, p.y, p.z - EPSILON))
    // ));
    return vec3(0);
}

//from inigo iquliez
// polynomial smooth min (k = 0.1);
float smin( float a, float b, float k )
{
    float h = clamp( 0.5+0.5*(b-a)/k, 0.0, 1.0 );
    return mix( b, a, h ) - k*h*(1.0-h);
}
