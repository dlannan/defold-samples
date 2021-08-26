varying mediump vec2 var_texcoord0;

uniform lowp sampler2D mask0;
uniform lowp sampler2D tex0;
uniform lowp vec4 tint;
uniform lowp vec4 maskpos;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    lowp vec4 color = texture2D(tex0, var_texcoord0.xy) * tint_pm;
    lowp vec4 color_mask = texture2D(mask0, var_texcoord0.xy + maskpos.xy);

    if(color_mask.r + color_mask.g + color_mask.b > 0.0) 
        gl_FragColor = color;
    else 
        gl_FragColor = vec4(0.0);    
}
