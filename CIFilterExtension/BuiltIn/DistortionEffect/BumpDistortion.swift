import Foundation
import CoreImage

@available(iOS 7, OSX 10.4, *)
public struct BumpDistortion {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius: CGFloat = 300.0
    public static let defaultInputScale: CGFloat = 0.5

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRadius: CGFloat = defaultInputRadius,
                              inputScale: CGFloat = defaultInputScale) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputRadiusKey: inputRadius,
                kCIInputScaleKey: inputScale
            ]
            let filter = CIFilter(name: "CIBumpDistortion", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRadius: CGFloat = defaultInputRadius,
                                              inputScale: CGFloat = defaultInputScale) -> Filter {
        AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRadius: inputRadius, inputScale: inputScale))
    }

}
