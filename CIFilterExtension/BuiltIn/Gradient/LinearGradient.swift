import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct LinearGradient {
    
    public static let defaultInputPoint0 = XYPosition(x: 0.0, y: 0.0)
    public static let defaultInputPoint1 = XYPosition(x: 200.0, y: 200.0)
    public static let defaultInputColor0 = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha:1.0)
    public static let defaultInputColor1 = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha:0.0)
    
    public static func image(inputPoint0: XYPosition = defaultInputPoint0,
                             inputPoint1: XYPosition = defaultInputPoint1,
                             inputColor0: CIColor = defaultInputColor0,
                             inputColor1: CIColor = defaultInputColor1) -> CIImage? {
        let parameters: Parameters = [
            "inputPoint0": inputPoint0.vector,
            "inputPoint1": inputPoint1.vector,
            "inputColor0": inputColor0,
            "inputColor1": inputColor1
        ]
        return CIFilter(name: "CILinearGradient", withInputParameters: parameters)?.outputImage
    }
    
}
