shader_type canvas_item;

uniform float feather_amount : hint_range(0.0, 0.5) = 0.1;

void fragment() {
    // Get the texture color
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Calculate distance from edges (0.0 at edges, 0.5 at center)
    vec2 center_dist = abs(UV - vec2(0.5));
    float edge_dist = 0.5 - max(center_dist.x, center_dist.y);
    
    // Create feathering effect
    float alpha_mult = smoothstep(0.0, feather_amount, edge_dist);
    
    // Apply feathering to alpha
    COLOR = vec4(tex_color.rgb, tex_color.a * alpha_mult);
}