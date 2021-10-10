import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct ExposureAdjust {

    public static let defaultInputEV: CGFloat = 0.5

    public static func filter(inputEV: CGFloat = defaultInputEV) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputEVKey: inputEV
            ]
            let filter = CIFilter(name: "CIExposureAdjust", parameters: parameters)
            return filter?.outputImage
        }
    }

}
