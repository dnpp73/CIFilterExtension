import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct SharpenLuminance {
    
    public static let defaultInputSharpness: CGFloat = 0.4
    
    public static func filter(inputSharpness: CGFloat = defaultInputSharpness) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputSharpnessKey: inputSharpness
            ]
            let filter = CIFilter(name: "CISharpenLuminance", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
