import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct HueAdjust {

    public static let defaultInputAngle: CGFloat = 0.0

    public static func filter(inputAngle: CGFloat = defaultInputAngle) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputAngleKey: inputAngle
            ]
            let filter = CIFilter(name: "CIHueAdjust", parameters: parameters)
            return filter?.outputImage
        }
    }

}
