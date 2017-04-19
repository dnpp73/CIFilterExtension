import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct GaussianGradient {
    
    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputColor0 = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha:1.0)
    public static let defaultInputColor1 = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha:0.0)
    public static let defaultInputRadius: CGFloat = 300.0
    
    public static func image(inputCenter: XYPosition = defaultInputCenter,
                             inputColor0: CIColor = defaultInputColor0,
                             inputColor1: CIColor = defaultInputColor1,
                             inputRadius: CGFloat = defaultInputRadius) -> CIImage? {
        let parameters: Parameters = [
            kCIInputCenterKey: inputCenter.vector,
            "inputColor0": inputColor0,
            "inputColor1": inputColor1,
            kCIInputRadiusKey: inputRadius
        ]
        return CIFilter(name: "CIGaussianGradient", withInputParameters: parameters)?.outputImage
    }
    
}
