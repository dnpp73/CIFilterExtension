import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct HatchedScreen {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputAngle: CGFloat = 0.0
    public static let defaultInputWidth: CGFloat = 6.0
    public static let defaultInputSharpness: CGFloat = 0.7

    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputAngle: CGFloat = defaultInputAngle,
                              inputWidth: CGFloat = defaultInputWidth,
                              inputSharpness: CGFloat = defaultInputSharpness) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputAngleKey: inputAngle,
                kCIInputWidthKey: inputWidth,
                kCIInputSharpnessKey: inputSharpness
            ]
            let filter = CIFilter(name: "CIHatchedScreen", parameters: parameters)
            return filter?.outputImage
        }
    }

}
