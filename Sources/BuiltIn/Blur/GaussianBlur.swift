import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct GaussianBlur {

    public static let defaultInputRadius: CGFloat = 10.0

    public static func filter(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        AffineClamp.clampAndCrop(filter(inputRadius: inputRadius))
    }

}
