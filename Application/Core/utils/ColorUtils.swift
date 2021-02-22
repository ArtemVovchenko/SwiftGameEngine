import simd

class ColorUtils {
    public static func RandomColorRGBAVector() -> SIMD4<Float> {
        return SIMD4<Float>(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1)
    }
}
