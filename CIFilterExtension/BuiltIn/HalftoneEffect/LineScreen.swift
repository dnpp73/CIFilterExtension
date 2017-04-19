import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct LineScreen {
    
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputAngle: CGFloat = 0.0
    public static let defaultInputWidth: CGFloat = 6.0
    public static let defaultInputSharpness: CGFloat = 0.7
    
    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputAngle: CGFloat = defaultInputAngle,
                              inputWidth: CGFloat = defaultInputWidth,
                              inputSharpness: CGFloat = defaultInputSharpness) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputAngleKey: inputAngle,
                kCIInputWidthKey: inputWidth,
                kCIInputSharpnessKey: inputSharpness
            ]
            let filter = CIFilter(name: "CILineScreen", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
