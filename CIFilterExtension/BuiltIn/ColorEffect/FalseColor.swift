import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct FalseColor {
    
    public static let defaultInputColor0 = CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0)
    public static let defaultInputColor1 = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0)
        
    public static func filter(inputColor0: CIColor = defaultInputColor0,
                              inputColor1: CIColor = defaultInputColor1) -> Filter {
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputColor0": inputColor0,
                "inputColor1": inputColor1
            ]
            let filter = CIFilter(name: "CIFalseColor", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
