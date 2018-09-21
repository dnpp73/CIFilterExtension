import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct VignetteEffect {
    
    // https://developer.apple.com/library/content/documentation/GraphicsImaging/Reference/CoreImageFilterReference/#//apple_ref/doc/filter/ci/CIVignetteEffect
    // ここには inputRadius の項目があるものの、 iOS 10.2.1 の iPhone 7 Plus 実機で動かしたところ、
    // parameters に kCIInputRadiusKey でなんらかの value を放り込んだ瞬間に真っ黒になる現象に遭遇した…
    
    public static let defaultInputCenter = XYPosition(x:150.0, y:150.0)
    public static let defaultInputIntensity: CGFloat = 1.0
    // public static let defaultInputRadius: CGFloat = 0.0
    public static let defaultInputFalloff: CGFloat = 0.0
    
    public static func filter(inputCenter: XYPosition = defaultInputCenter,
                              inputIntensity: CGFloat = defaultInputIntensity,
                              // inputRadius: CGFloat = defaultInputRadius,
                              inputFalloff: CGFloat = defaultInputFalloff) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputCenterKey: inputCenter.vector,
                kCIInputIntensityKey: inputIntensity,
                // kCIInputRadiusKey: inputRadius,
                "inputFalloff": inputFalloff
            ]
            let filter = CIFilter(name: "CIVignetteEffect", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
