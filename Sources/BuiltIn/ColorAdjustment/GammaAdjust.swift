import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct GammaAdjust {

    public static let defaultInputPower: CGFloat = 0.75

    public static func filter(inputPower: CGFloat = defaultInputPower) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputPower": inputPower
            ]
            let filter = CIFilter(name: "CIGammaAdjust", parameters: parameters)
            return filter?.outputImage
        }
    }

}
