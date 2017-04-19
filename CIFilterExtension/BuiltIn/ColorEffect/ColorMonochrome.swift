import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct ColorMonochrome {
    
    public static let defaultInputColor = CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0)
    public static let defaultInputIntensity: CGFloat = 1.0
    
    public static func filter(inputColor: CIColor = defaultInputColor,
                              inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputColorKey: inputColor,
                kCIInputIntensityKey: inputIntensity
            ]
            let filter = CIFilter(name: "CIColorMonochrome", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
