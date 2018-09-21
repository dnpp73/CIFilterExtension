import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct ColorPosterize {
    
    public static let defaultInputLevels: CGFloat = 6.0
    
    public static func filter(inputLevels: CGFloat? = defaultInputLevels) -> Filter {
        return { image in
            var parameters: Parameters = [
                kCIInputImageKey: image
            ]
            if let levels = inputLevels {
                parameters["inputLevels"] = levels
            }
            let filter = CIFilter(name: "CIColorPosterize", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
