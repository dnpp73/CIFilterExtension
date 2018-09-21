import Foundation
import CoreImage

@available(iOS 9, OSX 10.9, *)
public struct Convolution7X7 {
    
    // TODO: 動作確認
    
    public static let defaultInputWeights = ConvolutionMatrix7X7(w00: 0.0, w01: 0.0, w02: 0.0, w03: 0.0, w04: 0.0, w05: 0.0, w06: 0.0,
                                                                 w10: 0.0, w11: 0.0, w12: 0.0, w13: 0.0, w14: 0.0, w15: 0.0, w16: 0.0,
                                                                 w20: 0.0, w21: 0.0, w22: 0.0, w23: 0.0, w24: 0.0, w25: 0.0, w26: 0.0,
                                                                 w30: 0.0, w31: 0.0, w32: 0.0, w33: 1.0, w34: 0.0, w35: 0.0, w36: 0.0,
                                                                 w40: 0.0, w41: 0.0, w42: 0.0, w43: 0.0, w44: 0.0, w45: 0.0, w46: 0.0,
                                                                 w50: 0.0, w51: 0.0, w52: 0.0, w53: 0.0, w54: 0.0, w55: 0.0, w56: 0.0,
                                                                 w60: 0.0, w61: 0.0, w62: 0.0, w63: 0.0, w64: 0.0, w65: 0.0, w66: 0.0)
    public static let defaultInputBias: CGFloat = 0.0
    
    public static func filter(inputWeights: ConvolutionMatrix7X7 = defaultInputWeights, inputBias: CGFloat = defaultInputBias) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputWeights": inputWeights.vector,
                "inputBias": inputBias
            ]
            let filter = CIFilter(name: "CIConvolution7X7", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
