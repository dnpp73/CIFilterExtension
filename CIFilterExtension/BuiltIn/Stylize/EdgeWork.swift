import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct EdgeWork {

    public static let defaultInputRadius: CGFloat = 3.0

    public static func filter(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CIEdgeWork", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputRadius: inputRadius))
    }

}
