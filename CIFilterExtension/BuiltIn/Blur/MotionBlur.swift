import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct MotionBlur {
    
    public static let defaultInputRadius: CGFloat = 20.0
    public static let defaultInputAngle: CGFloat = 0.0
    
    public static func filter(inputRadius: CGFloat = defaultInputRadius,
                              inputAngle: CGFloat = defaultInputAngle) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputRadiusKey: inputRadius,
                kCIInputAngleKey: inputAngle
            ]
            let filter = CIFilter(name: "CIMotionBlur", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
    public static func filterWithClampAndCrop(inputRadius: CGFloat = defaultInputRadius,
                                              inputAngle: CGFloat = defaultInputAngle) -> Filter {
        return AffineClamp.clampAndCrop(filter(inputRadius: inputRadius, inputAngle: inputAngle))
    }
    
}
