import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct SepiaTone {
    
    public static let defaultInputIntensity: CGFloat = 1.0
    
    public static func filter(inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputIntensity": inputIntensity
            ]
            let filter = CIFilter(name: "CISepiaTone", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
