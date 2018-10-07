import Foundation
import CoreImage

// MARK: - Filter Type

public typealias Filter = (CIImage) -> CIImage?
public typealias ImageComposer = (CIImage) -> Filter

public typealias Parameters = [String: Any]
public typealias OptionalParameters = [String: Any?]
public typealias FilterAttributes = [String: Any]

// MARK: - Custom Operator for `Filter`

infix operator |>>

public func |>> (lhs: @escaping Filter, rhs: @escaping Filter) -> Filter {
    return { image in
        lhs(image).flatMap { image in rhs(image) }
    }
}

// MARK: - Utility Internal Function for `Filter`

internal func noParamsFilter(name: String) -> Filter {
    return { image in
        let parameters = [
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name: name, parameters: parameters)
        return filter?.outputImage
    }
}

internal func composer(name: String) -> ImageComposer {
    return { bgImage in
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputBackgroundImage": bgImage
            ]
            let filter = CIFilter(name: name, parameters: parameters)
            return filter?.outputImage
        }
    }
}

// MARK: - Public Structs

public struct RGBAComponents {
    public let r: CGFloat
    public let g: CGFloat
    public let b: CGFloat
    public let a: CGFloat
    public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    public var vector: CIVector {
        return CIVector(x: r, y: g, z: b, w: a)
    }
}

public struct TempAndTint {
    public let temp: CGFloat
    public let tint: CGFloat
    public init(temp: CGFloat, tint: CGFloat) {
        self.temp = temp
        self.tint = tint
    }
    public var vector: CIVector {
        return CIVector(x: temp, y: tint)
    }
}

public struct XYPosition {
    public let x: CGFloat
    public let y: CGFloat
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    public var vector: CIVector {
        return CIVector(x: x, y: y)
    }
}

public struct XYOffset {
    public let x: CGFloat
    public let y: CGFloat
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    public var vector: CIVector {
        return CIVector(x: x, y: y)
    }
}

public struct PolynomialCoefficients {
    public let a0: CGFloat
    public let a1: CGFloat
    public let a2: CGFloat
    public let a3: CGFloat
    public init(a0: CGFloat, a1: CGFloat, a2: CGFloat, a3: CGFloat) {
        self.a0 = a0
        self.a1 = a1
        self.a2 = a2
        self.a3 = a3
    }
    public var vector: CIVector {
        return CIVector(x: a0, y: a1, z: a2, w: a3)
    }
}

public struct CrossPolynomialCoefficients {
    public let a0: CGFloat
    public let a1: CGFloat
    public let a2: CGFloat
    public let a3: CGFloat
    public let a4: CGFloat
    public let a5: CGFloat
    public let a6: CGFloat
    public let a7: CGFloat
    public let a8: CGFloat
    public let a9: CGFloat
    public init(a0: CGFloat, a1: CGFloat, a2: CGFloat, a3: CGFloat, a4: CGFloat, a5: CGFloat, a6: CGFloat, a7: CGFloat, a8: CGFloat, a9: CGFloat) {
        self.a0 = a0
        self.a1 = a1
        self.a2 = a2
        self.a3 = a3
        self.a4 = a4
        self.a5 = a5
        self.a6 = a6
        self.a7 = a7
        self.a8 = a8
        self.a9 = a9
    }
    public var vector: CIVector {
        return CIVector(string: "[\(a0) \(a1) \(a2) \(a3) \(a4) \(a5) \(a6) \(a7) \(a8) \(a9)]")
    }
}

public struct ConvolutionMatrix3X3 {
    public let w00: CGFloat
    public let w01: CGFloat
    public let w02: CGFloat
    public let w10: CGFloat
    public let w11: CGFloat
    public let w12: CGFloat
    public let w20: CGFloat
    public let w21: CGFloat
    public let w22: CGFloat
    public init(w00: CGFloat, w01: CGFloat, w02: CGFloat,
                w10: CGFloat, w11: CGFloat, w12: CGFloat,
                w20: CGFloat, w21: CGFloat, w22: CGFloat) {
        self.w00 = w00
        self.w01 = w01
        self.w02 = w02
        self.w10 = w10
        self.w11 = w11
        self.w12 = w12
        self.w20 = w20
        self.w21 = w21
        self.w22 = w22
    }
    public var vector: CIVector {
        return CIVector(string: "[\(w00) \(w01) \(w02) \(w10) \(w11) \(w12) \(w20) \(w21) \(w22)]")
    }
}

public struct ConvolutionMatrix5X5 {
    public let w00: CGFloat
    public let w01: CGFloat
    public let w02: CGFloat
    public let w03: CGFloat
    public let w04: CGFloat
    public let w10: CGFloat
    public let w11: CGFloat
    public let w12: CGFloat
    public let w13: CGFloat
    public let w14: CGFloat
    public let w20: CGFloat
    public let w21: CGFloat
    public let w22: CGFloat
    public let w23: CGFloat
    public let w24: CGFloat
    public let w30: CGFloat
    public let w31: CGFloat
    public let w32: CGFloat
    public let w33: CGFloat
    public let w34: CGFloat
    public let w40: CGFloat
    public let w41: CGFloat
    public let w42: CGFloat
    public let w43: CGFloat
    public let w44: CGFloat
    public init(w00: CGFloat, w01: CGFloat, w02: CGFloat, w03: CGFloat, w04: CGFloat,
                w10: CGFloat, w11: CGFloat, w12: CGFloat, w13: CGFloat, w14: CGFloat,
                w20: CGFloat, w21: CGFloat, w22: CGFloat, w23: CGFloat, w24: CGFloat,
                w30: CGFloat, w31: CGFloat, w32: CGFloat, w33: CGFloat, w34: CGFloat,
                w40: CGFloat, w41: CGFloat, w42: CGFloat, w43: CGFloat, w44: CGFloat) {
        self.w00 = w00
        self.w01 = w01
        self.w02 = w02
        self.w03 = w03
        self.w04 = w04
        self.w10 = w10
        self.w11 = w11
        self.w12 = w12
        self.w13 = w13
        self.w14 = w14
        self.w20 = w20
        self.w21 = w21
        self.w22 = w22
        self.w23 = w23
        self.w24 = w24
        self.w30 = w30
        self.w31 = w31
        self.w32 = w32
        self.w33 = w33
        self.w34 = w34
        self.w40 = w40
        self.w41 = w41
        self.w42 = w42
        self.w43 = w43
        self.w44 = w44
    }
    public var vector: CIVector {
        return CIVector(string: "[\(w00) \(w01) \(w02) \(w03) \(w04) \(w10) \(w11) \(w12) \(w13) \(w14) \(w20) \(w21) \(w22) \(w23) \(w24) \(w30) \(w31) \(w32) \(w33) \(w34) \(w40) \(w41) \(w42) \(w43) \(w44)]")
    }
}

public struct ConvolutionMatrix7X7 {
    public let w00: CGFloat
    public let w01: CGFloat
    public let w02: CGFloat
    public let w03: CGFloat
    public let w04: CGFloat
    public let w05: CGFloat
    public let w06: CGFloat
    public let w10: CGFloat
    public let w11: CGFloat
    public let w12: CGFloat
    public let w13: CGFloat
    public let w14: CGFloat
    public let w15: CGFloat
    public let w16: CGFloat
    public let w20: CGFloat
    public let w21: CGFloat
    public let w22: CGFloat
    public let w23: CGFloat
    public let w24: CGFloat
    public let w25: CGFloat
    public let w26: CGFloat
    public let w30: CGFloat
    public let w31: CGFloat
    public let w32: CGFloat
    public let w33: CGFloat
    public let w34: CGFloat
    public let w35: CGFloat
    public let w36: CGFloat
    public let w40: CGFloat
    public let w41: CGFloat
    public let w42: CGFloat
    public let w43: CGFloat
    public let w44: CGFloat
    public let w45: CGFloat
    public let w46: CGFloat
    public let w50: CGFloat
    public let w51: CGFloat
    public let w52: CGFloat
    public let w53: CGFloat
    public let w54: CGFloat
    public let w55: CGFloat
    public let w56: CGFloat
    public let w60: CGFloat
    public let w61: CGFloat
    public let w62: CGFloat
    public let w63: CGFloat
    public let w64: CGFloat
    public let w65: CGFloat
    public let w66: CGFloat
    public init(w00: CGFloat, w01: CGFloat, w02: CGFloat, w03: CGFloat, w04: CGFloat, w05: CGFloat, w06: CGFloat,
                w10: CGFloat, w11: CGFloat, w12: CGFloat, w13: CGFloat, w14: CGFloat, w15: CGFloat, w16: CGFloat,
                w20: CGFloat, w21: CGFloat, w22: CGFloat, w23: CGFloat, w24: CGFloat, w25: CGFloat, w26: CGFloat,
                w30: CGFloat, w31: CGFloat, w32: CGFloat, w33: CGFloat, w34: CGFloat, w35: CGFloat, w36: CGFloat,
                w40: CGFloat, w41: CGFloat, w42: CGFloat, w43: CGFloat, w44: CGFloat, w45: CGFloat, w46: CGFloat,
                w50: CGFloat, w51: CGFloat, w52: CGFloat, w53: CGFloat, w54: CGFloat, w55: CGFloat, w56: CGFloat,
                w60: CGFloat, w61: CGFloat, w62: CGFloat, w63: CGFloat, w64: CGFloat, w65: CGFloat, w66: CGFloat) {
        self.w00 = w00
        self.w01 = w01
        self.w02 = w02
        self.w03 = w03
        self.w04 = w04
        self.w05 = w05
        self.w06 = w06
        self.w10 = w10
        self.w11 = w11
        self.w12 = w12
        self.w13 = w13
        self.w14 = w14
        self.w15 = w15
        self.w16 = w16
        self.w20 = w20
        self.w21 = w21
        self.w22 = w22
        self.w23 = w23
        self.w24 = w24
        self.w25 = w25
        self.w26 = w26
        self.w30 = w30
        self.w31 = w31
        self.w32 = w32
        self.w33 = w33
        self.w34 = w34
        self.w35 = w35
        self.w36 = w36
        self.w40 = w40
        self.w41 = w41
        self.w42 = w42
        self.w43 = w43
        self.w44 = w44
        self.w45 = w45
        self.w46 = w46
        self.w50 = w50
        self.w51 = w51
        self.w52 = w52
        self.w53 = w53
        self.w54 = w54
        self.w55 = w55
        self.w56 = w56
        self.w60 = w60
        self.w61 = w61
        self.w62 = w62
        self.w63 = w63
        self.w64 = w64
        self.w65 = w65
        self.w66 = w66
    }
    public var vector: CIVector {
        return CIVector(string: "[\(w00) \(w01) \(w02) \(w03) \(w04) \(w05) \(w06) \(w10) \(w11) \(w12) \(w13) \(w14) \(w15) \(w16) \(w20) \(w21) \(w22) \(w23) \(w24) \(w25) \(w26) \(w30) \(w31) \(w32) \(w33) \(w34) \(w35) \(w36) \(w40) \(w41) \(w42) \(w43) \(w44) \(w45) \(w46) \(w50) \(w51) \(w52) \(w53) \(w54) \(w55) \(w56) \(w60) \(w61) \(w62) \(w63) \(w64) \(w65) \(w66)]")
    }
}

public struct ConvolutionVector9 {
    public let w0: CGFloat
    public let w1: CGFloat
    public let w2: CGFloat
    public let w3: CGFloat
    public let w4: CGFloat
    public let w5: CGFloat
    public let w6: CGFloat
    public let w7: CGFloat
    public let w8: CGFloat
    public init(w0: CGFloat, w1: CGFloat, w2: CGFloat, w3: CGFloat, w4: CGFloat, w5: CGFloat, w6: CGFloat, w7: CGFloat, w8: CGFloat) {
        self.w0 = w0
        self.w1 = w1
        self.w2 = w2
        self.w3 = w3
        self.w4 = w4
        self.w5 = w5
        self.w6 = w6
        self.w7 = w7
        self.w8 = w8
    }
    public var vector: CIVector {
        return CIVector(string: "[\(w0) \(w1) \(w2) \(w3) \(w4) \(w5) \(w6) \(w7) \(w8)]")
    }
}
