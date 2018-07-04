import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct AffineClamp {

    public static func filter(inputTransform: CGAffineTransform) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputTransformKey: inputTransform
            ]
            let filter = CIFilter(name: "CIAffineClamp", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
    // MARK:- Util
    
    internal static func clampAndCrop(_ filter: @escaping Filter) -> Filter {
        return { image in
            let clamp = AffineClamp.filter(inputTransform: .identity)
            guard let clampedImage = clamp(image) else {
                return nil
            }
            guard let filteredImage = filter(clampedImage) else {
                return nil
            }
            return filteredImage.cropped(to: image.extent)
        }
    }
    
}
