import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct BlendWithMask {
    
    public static func image(image: CIImage, inputBackgroundImage: CIImage, inputMaskImage: CIImage) -> CIImage? {
        let parameters: Parameters = [
            kCIInputImageKey: image,
            kCIInputBackgroundImageKey: inputBackgroundImage,
            kCIInputMaskImageKey: inputMaskImage
        ]
        let filter = CIFilter(name: "CIBlendWithAlphaMask", parameters: parameters)
        return filter?.outputImage
    }
}
