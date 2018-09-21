import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct Pointillize {
    
    public static let defaultInputRadius: CGFloat = 20.0
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    
    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputCenter: XYPosition = defaultInputCenter) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputCenterKey: inputCenter.vector
            ]
            let filter = CIFilter(name: "CIPointillize", parameters: parameters)
            return filter?.outputImage
        }
    }
    
    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius,
                                              inputCenter: XYPosition = defaultInputCenter) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputRadius: inputRadius, inputCenter: inputCenter))
    }
    
}
