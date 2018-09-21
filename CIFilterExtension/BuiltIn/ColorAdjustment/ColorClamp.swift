import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct ColorClamp {
    
    public static let defaultInputMinComponents = RGBAComponents(r: 0.0, g: 0.0, b: 0.0, a: 0.0)
    public static let defaultInputMaxComponents = RGBAComponents(r: 1.0, g: 1.0, b: 1.0, a: 1.0)
    
    public static func filter(inputMinComponents: RGBAComponents = defaultInputMinComponents,
                              inputMaxComponents: RGBAComponents = defaultInputMaxComponents) -> Filter {
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputMinComponents": inputMinComponents.vector,
                "inputMaxComponents": inputMaxComponents.vector
            ]
            let filter = CIFilter(name: "CIColorClamp", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
