import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct Crystallize {

    public static let defaultInputRadius: CGFloat = 20.0
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)

    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputCenter: XYPosition = defaultInputCenter) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputCenterKey: inputCenter.vector
            ]
            let filter = CIFilter(name: "CICrystallize", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius,
                                              inputCenter: XYPosition = defaultInputCenter) -> Filter {
        AffineClamp.clampAndCrop(filter(inputRadius: inputRadius, inputCenter: inputCenter))
    }

}
