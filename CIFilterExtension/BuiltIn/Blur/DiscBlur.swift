import Foundation
import CoreImage

@available(iOS 9, OSX 10.5, *)
public struct DiscBlur {

    public static let defaultInputRadius: CGFloat = 10.0

    public static func filter(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CIDiscBlur", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputRadius: inputRadius))
    }

}
