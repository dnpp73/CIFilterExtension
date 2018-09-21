import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct CircularScreen {
    
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputWidth: CGFloat = 6.0
    public static let defaultInputSharpness: CGFloat = 0.7
    
    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputWidth: CGFloat = defaultInputWidth,
                              inputSharpness: CGFloat = defaultInputSharpness) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputWidthKey: inputWidth,
                kCIInputSharpnessKey: inputSharpness
            ]
            let filter = CIFilter(name: "CICircularScreen", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
