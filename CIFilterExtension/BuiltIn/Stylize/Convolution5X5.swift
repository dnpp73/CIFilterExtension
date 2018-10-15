import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct Convolution5X5 {

    #warning("動作確認")

    public static let defaultInputWeights = ConvolutionMatrix5X5(w00: 0.0, w01: 0.0, w02: 0.0, w03: 0.0, w04: 0.0,
                                                                 w10: 0.0, w11: 0.0, w12: 0.0, w13: 0.0, w14: 0.0,
                                                                 w20: 0.0, w21: 0.0, w22: 1.0, w23: 0.0, w24: 0.0,
                                                                 w30: 0.0, w31: 0.0, w32: 0.0, w33: 0.0, w34: 0.0,
                                                                 w40: 0.0, w41: 0.0, w42: 0.0, w43: 0.0, w44: 0.0)
    public static let defaultInputBias: CGFloat = 0.0

    public static func filter(inputWeights: ConvolutionMatrix5X5 = defaultInputWeights, inputBias: CGFloat = defaultInputBias) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputWeights": inputWeights.vector,
                "inputBias": inputBias
            ]
            let filter = CIFilter(name: "CIConvolution5X5", parameters: parameters)
            return filter?.outputImage
        }
    }

}
