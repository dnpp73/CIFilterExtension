import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct Convolution9 {
    
    // TODO: 動作確認
    
    public static let defaultInputWeights = ConvolutionVector9(w0: 0.0, w1:0.0, w2: 0.0, w3: 0.0, w4: 1.0, w5: 0.0, w6: 0.0, w7: 0.0, w8: 0.0)
    public static let defaultInputBias: CGFloat = 0.0
    
    public static func filterHorizontal(inputWeights: ConvolutionVector9 = defaultInputWeights, inputBias: CGFloat = defaultInputBias) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputWeights": inputWeights.vector,
                "inputBias": inputBias
            ]
            let filter = CIFilter(name: "CIConvolution9Horizontal", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
    public static func filterVertical(inputWeights: ConvolutionVector9 = defaultInputWeights, inputBias: CGFloat = defaultInputBias) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputWeights": inputWeights.vector,
                "inputBias": inputBias
            ]
            let filter = CIFilter(name: "CIConvolution9Vertical", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
