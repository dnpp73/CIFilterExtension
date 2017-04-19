import Foundation
import CoreImage

@available(iOS 5, OSX 10.7, *)
public struct ToneCurve {
    
    public static let defaultInputPoint0 = XYOffset(x: 0.00, y: 0.00)
    public static let defaultInputPoint1 = XYOffset(x: 0.25, y: 0.25)
    public static let defaultInputPoint2 = XYOffset(x: 0.50, y: 0.50)
    public static let defaultInputPoint3 = XYOffset(x: 0.75, y: 0.75)
    public static let defaultInputPoint4 = XYOffset(x: 1.00, y: 1.00)
    
    public static func filter(inputPoint0: XYOffset = defaultInputPoint0,
                              inputPoint1: XYOffset = defaultInputPoint1,
                              inputPoint2: XYOffset = defaultInputPoint2,
                              inputPoint3: XYOffset = defaultInputPoint3,
                              inputPoint4: XYOffset = defaultInputPoint4) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputPoint1": inputPoint1.vector,
                "inputPoint2": inputPoint2.vector,
                "inputPoint3": inputPoint3.vector,
                "inputPoint4": inputPoint4.vector
            ]
            let filter = CIFilter(name: "CIToneCurve", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
