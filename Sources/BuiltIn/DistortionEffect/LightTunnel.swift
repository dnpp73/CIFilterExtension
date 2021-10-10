import Foundation
import CoreImage

@available(iOS 6, OSX 10.11, *)
public struct LightTunnel {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRotation: CGFloat = 0.0
    public static let defaultInputRadius: CGFloat = 0.0

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRotation: CGFloat = defaultInputRotation,
                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                "inputRotation": inputRotation,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CILightTunnel", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRotation: CGFloat = defaultInputRotation,
                                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRotation: inputRotation, inputRadius: inputRadius))
    }

}
