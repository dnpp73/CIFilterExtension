import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct Gloom {

    public static let defaultInputRadius: CGFloat = 10.0
    public static let defaultInputIntensity: CGFloat = 0.5

    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputIntensityKey: inputIntensity
            ]
            let filter = CIFilter(name: "CIGloom", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius,
                                              inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        AffineClamp.clampAndCrop(filter(inputRadius: inputRadius, inputIntensity: inputIntensity))
    }

}
