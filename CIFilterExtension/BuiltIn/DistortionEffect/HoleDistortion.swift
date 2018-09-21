import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct HoleDistortion {
    
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius: CGFloat = 150.0
    
    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputRadiusKey: inputRadius
            ]
            let filter = CIFilter(name: "CIHoleDistortion", parameters: parameters)
            return filter?.outputImage
        }
    }
    
    public static func filterWithClampAndCrop(inputCenter: XYPosition = defaultInputCenter,
                                              inputRadius: CGFloat = defaultInputRadius) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputCenter: inputCenter, inputRadius: inputRadius))
    }
    
}
