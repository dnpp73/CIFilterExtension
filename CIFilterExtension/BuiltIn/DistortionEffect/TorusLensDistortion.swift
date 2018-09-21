import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct TorusLensDistortion {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius: CGFloat = 160.0
    public static let defaultInputWidth: CGFloat = 80.0
    public static let defaultInputRefraction: CGFloat = 1.7

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRadius: CGFloat = defaultInputRadius,
                              inputWidth: CGFloat = defaultInputWidth,
                              inputRefraction: CGFloat = defaultInputRefraction) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputRadiusKey: inputRadius,
                kCIInputWidthKey: inputWidth,
                kCIInputRefractionKey: inputRefraction
            ]
            let filter = CIFilter(name: "CITorusLensDistortion", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRadius: CGFloat = defaultInputRadius,
                                              inputWidth: CGFloat = defaultInputWidth,
                                              inputRefraction: CGFloat = defaultInputRefraction) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRadius: inputRadius, inputWidth: inputWidth, inputRefraction: inputRefraction))
    }

}
