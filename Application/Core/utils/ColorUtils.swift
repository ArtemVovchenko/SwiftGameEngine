//
//  ColorUtils.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 18.02.2021.
//

import simd

class ColorUtils {
    public static func RandomColorRGBAVector() -> SIMD4<Float> {
        return SIMD4<Float>(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1)
    }
}
