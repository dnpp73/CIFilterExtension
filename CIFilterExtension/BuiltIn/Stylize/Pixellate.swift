import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct Pixellate {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputScale: CGFloat = 8.0

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputScale: CGFloat = defaultInputScale) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputScaleKey: inputScale
            ]
            let filter = CIFilter(name: "CIPixellate", parameters: parameters)
            return filter?.outputImage
        }
    }

    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputScale: CGFloat = defaultInputScale) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputScale: inputScale))
    }

}
