import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct NoiseReduction {

    public static let defaultInputNoiseLevel: CGFloat = 0.02
    public static let defaultInputSharpness: CGFloat = 0.4

    public static func filter(inputNoiseLevel: CGFloat = defaultInputNoiseLevel,
                              inputSharpness: CGFloat = defaultInputSharpness) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputNoiseLevel": inputNoiseLevel,
                kCIInputSharpnessKey: inputSharpness
            ]
            let filter = CIFilter(name: "CINoiseReduction", parameters: parameters)
            return filter?.outputImage
        }
    }

}
