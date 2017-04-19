import Foundation
import CoreImage

@available(iOS 5, OSX 10.7, *)
public struct Vibrance {
    
    public static func filter(inputAmount: CGFloat?) -> Filter {
        return { image in
            var parameters: Parameters = [
                kCIInputImageKey: image
            ]
            if let inputAmount = inputAmount {
                parameters["inputAmount"] = inputAmount
            }
            let filter = CIFilter(name: "CIVibrance", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
