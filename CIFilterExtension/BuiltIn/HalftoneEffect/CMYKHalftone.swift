import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct CMYKHalftone {
    
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputAngle: CGFloat = 0.0
    public static let defaultInputWidth: CGFloat = 6.0
    public static let defaultInputSharpness: CGFloat = 0.7
    public static let defaultInputGCR: CGFloat = 1.0
    public static let defaultInputUCR: CGFloat = 0.5
    
    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputAngle: CGFloat = defaultInputAngle,
                              inputWidth: CGFloat = defaultInputWidth,
                              inputSharpness: CGFloat = defaultInputSharpness,
                              inputGCR: CGFloat = defaultInputGCR,
                              inputUCR: CGFloat = defaultInputUCR) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputAngleKey: inputAngle,
                kCIInputWidthKey: inputWidth,
                kCIInputSharpnessKey: inputSharpness,
                "inputGCR": inputGCR,
                "inputUCR": inputUCR
            ]
            let filter = CIFilter(name: "CICMYKHalftone", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
