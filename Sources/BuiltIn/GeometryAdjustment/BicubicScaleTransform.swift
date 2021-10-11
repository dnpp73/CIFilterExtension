import Foundation
import CoreImage

@available(iOS 11, OSX 10.13, *)
public struct BicubicScaleTransform {

    public static let defaultInputAspectRatio: CGFloat? = nil
    public static let defaultInputB: CGFloat = 0.0
    public static let defaultInputC: CGFloat = 0.75
    public static let defaultInputScale: CGFloat = 1.0

    public static func filter(inputAspectRatio: CGFloat? = defaultInputAspectRatio,
                              inputB: CGFloat = defaultInputB,
                              inputC: CGFloat = defaultInputC,
                              inputScale: CGFloat = defaultInputScale) -> Filter {
        { image in
            var parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputScaleKey: inputScale,
                "inputB": inputB,
                "inputC": inputC,
            ]
            if let inputAspectRatio = inputAspectRatio {
                parameters[kCIInputAspectRatioKey] = inputAspectRatio
            }
            let filter = CIFilter(name: "CIBicubicScaleTransform", parameters: parameters)
            return filter?.outputImage
        }
    }

}

extension CIImage {
    public func resizedWithBicubic(scale: CGFloat, aspectRatio: CGFloat? = BicubicScaleTransform.defaultInputAspectRatio, inputB: CGFloat = BicubicScaleTransform.defaultInputB, inputC: CGFloat = BicubicScaleTransform.defaultInputC) -> CIImage {
        castOrFatalError(BicubicScaleTransform.filter(inputAspectRatio: aspectRatio, inputB: inputB, inputC: inputC, inputScale: scale)(self))
    }

    public func resizedWithBicubic(to size: CGSize) -> CIImage {
        let scaleX = size.width / extent.width
        let scaleY = size.height / extent.height
        let scale: CGFloat = min(scaleX, scaleY)
        return resizedWithLanczos(scale: scale)
    }
}
