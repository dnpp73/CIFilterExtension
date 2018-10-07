import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct SourceOverCompositing {

    public static func filter(inputBackgroundImage: CIImage) -> Filter {
        return composer(name: "CISourceOverCompositing")(inputBackgroundImage)
    }

    // MARK: - Util

    internal static func alpha(filter: @escaping Filter, alpha: CGFloat) -> Filter {
        return { image in
            guard let filteredImage = filter(image) else {
                return nil
            }

            let alphaFilter = ColorMatrix.filter(inputAVector: RGBAComponents(r: 0.0, g: 0.0, b: 0.0, a: alpha))
            guard let alphaImage = alphaFilter(filteredImage) else {
                return nil
            }

            let composite = SourceOverCompositing.filter(inputBackgroundImage: image)
            return composite(alphaImage)
        }
    }

}
