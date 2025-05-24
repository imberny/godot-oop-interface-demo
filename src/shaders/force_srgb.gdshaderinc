vec3 force_srgb(vec3 color) {
    //float must_force = bvec3(1.0 - float(OUTPUT_IS_SRGB))
#if false// CURRENT_RENDERER == RENDERER_FORWARD_PLUS
    bvec3 must_force = not(bvec3(OUTPUT_IS_SRGB));
    return mix(
        pow(
            (color.rgb + vec3(0.055)) * (1.0 / (1.0 + 0.055)
        ),
        vec3(2.4)),color.rgb * (1.0 / 12.92),
        lessThan(color.rgb, vec3(0.04045))
    );
#else
    return color;
#endif
}