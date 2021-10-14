import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct LanczosScaleTransform {

    public static let defaultInputAspectRatio: CGFloat? = nil
    public static let defaultInputScale: CGFloat = 1.0

    public static func filter(inputAspectRatio: CGFloat? = defaultInputAspectRatio,
                              inputScale: CGFloat = defaultInputScale) -> Filter {
        { image in
            var parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputScaleKey: inputScale,
            ]
            if let inputAspectRatio = inputAspectRatio {
                parameters[kCIInputAspectRatioKey] = inputAspectRatio
            }
            let filter = CIFilter(name: "CILanczosScaleTransform", parameters: parameters)
            return filter?.outputImage
        }
    }

}

@available(iOS 6, OSX 10.4, *)
extension CIImage {
    public func resizedWithLanczos(scale: CGFloat, aspectRatio: CGFloat? = LanczosScaleTransform.defaultInputAspectRatio) -> CIImage {
        castOrFatalError(LanczosScaleTransform.filter(inputAspectRatio: aspectRatio, inputScale: scale)(self))
    }

    public func resizedWithLanczos(to size: CGSize) -> CIImage {
        let scaleX = size.width / extent.width
        let scaleY = size.height / extent.height
        let scale: CGFloat = min(scaleX, scaleY)
        return resizedWithLanczos(scale: scale)
    }
}
