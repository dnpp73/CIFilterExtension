import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct Convolution3X3 {

    // TODO: 動作確認

    public static let defaultInputWeights = ConvolutionMatrix3X3(w00: 0.0, w01: 0.0, w02: 0.0,
                                                                 w10: 0.0, w11: 1.0, w12: 0.0,
                                                                 w20: 0.0, w21: 0.0, w22: 0.0)
    public static let defaultInputBias: CGFloat = 0.0

    public static func filter(inputWeights: ConvolutionMatrix3X3 = defaultInputWeights, inputBias: CGFloat = defaultInputBias) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputWeights": inputWeights.vector,
                "inputBias": inputBias
            ]
            let filter = CIFilter(name: "CIConvolution3X3", parameters: parameters)
            return filter?.outputImage
        }
    }

}
