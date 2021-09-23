varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform lowp vec4 color_wind;

void main()
{
    vec4 result_color = texture2D(texture_sampler, var_texcoord0.xy);

    // color_wind.x = time
    // color_wind.y = strength 

    vec2 uv = var_texcoord0;
    uv.x += sin(color_wind.x) * color_wind.y * (0.85-uv.y);
    result_color = texture2D(texture_sampler, uv);  // recalculate fragment position

    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    gl_FragColor = result_color * tint_pm;
}
