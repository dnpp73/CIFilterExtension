import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct UnsharpMask {

    public static let defaultInputRadius: CGFloat = 2.5
    public static let defaultInputIntensity: CGFloat = 0.5

    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputIntensityKey: inputIntensity
            ]
            let filter = CIFilter(name: "CIUnsharpMask", parameters: parameters)
            return filter?.outputImage
        }
    }

}
