import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct ZoomBlur {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius: CGFloat = 20.0

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CIZoomBlur", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRadius: inputRadius))
    }

}
