import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct ColorMap {
    
    public static func filter(inputGradientImage: CIImage) -> Filter {
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputGradientImage": inputGradientImage
            ]
            let filter = CIFilter(name: "CIColorMap", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
