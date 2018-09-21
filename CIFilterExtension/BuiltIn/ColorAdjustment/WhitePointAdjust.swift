import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct WhitePointAdjust {
    
    public static func filter(inputColor: CIColor?) -> Filter {
        return { image in
            var parameters: Parameters = [
                kCIInputImageKey: image
            ]
            if let inputColor = inputColor {
                parameters[kCIInputColorKey] = inputColor
            }
            let filter = CIFilter(name: "CIWhitePointAdjust", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
