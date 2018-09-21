import Foundation
import CoreImage

@available(iOS 5, OSX 10.9, *)
public struct Vignette {

    public static let defaultInputRadius: CGFloat = 1.0
    public static let defaultInputIntensity: CGFloat = 0.0

    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputIntensityKey: inputIntensity
            ]
            let filter = CIFilter(name: "CIVignette", parameters: parameters)
            return filter?.outputImage
        }
    }

}
