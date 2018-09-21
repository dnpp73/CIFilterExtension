import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct ColorControls {
    
    public static let defaultInputSaturation: CGFloat = 1.0
    public static let defaultInputBrightness: CGFloat = 0.0
    public static let defaultInputContrast:   CGFloat = 1.0
    
    public static func filter(inputSaturation: CGFloat = defaultInputSaturation,
                              inputBrightness: CGFloat = defaultInputBrightness,
                              inputContrast: CGFloat = defaultInputContrast) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputSaturationKey: inputSaturation,
                kCIInputBrightnessKey: inputBrightness,
                kCIInputContrastKey: inputContrast
            ]
            let filter = CIFilter(name: "CIColorControls", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
