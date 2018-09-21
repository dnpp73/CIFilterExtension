import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct VortexDistortion {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius: CGFloat = 300.0
    public static let defaultInputAngle: CGFloat = CGFloat.pi * 18.0

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRadius: CGFloat = defaultInputRadius,
                              inputAngle: CGFloat = defaultInputAngle) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputRadiusKey: inputRadius,
                kCIInputAngleKey: inputAngle
            ]
            let filter = CIFilter(name: "CIVortexDistortion", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRadius: CGFloat = defaultInputRadius,
                                              inputAngle: CGFloat = defaultInputAngle) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRadius: inputRadius, inputAngle: inputAngle))
    }

}
