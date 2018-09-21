import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct RadialGradient {

    public static let defaultInputCenter = XYPosition(x: 150.0, y: 150.0)
    public static let defaultInputRadius0: CGFloat = 5.0
    public static let defaultInputRadius1: CGFloat = 100.0
    public static let defaultInputColor0 = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha:1.0)
    public static let defaultInputColor1 = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha:0.0)

    public static func image(inputCenter: XYPosition = defaultInputCenter,
                             inputRadius0: CGFloat = defaultInputRadius0,
                             inputRadius1: CGFloat = defaultInputRadius1,
                             inputColor0: CIColor = defaultInputColor0,
                             inputColor1: CIColor = defaultInputColor1) -> CIImage? {
        let parameters: Parameters = [
            kCIInputCenterKey: inputCenter.vector,
            "inputRadius0": inputRadius0,
            "inputRadius1": inputRadius1,
            "inputColor0": inputColor0,
            "inputColor1": inputColor1
        ]
        return CIFilter(name: "CIRadialGradient", parameters: parameters)?.outputImage
    }

}
