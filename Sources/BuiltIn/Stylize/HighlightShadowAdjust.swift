import Foundation
import CoreImage

@available(iOS 5, OSX 10.7, *)
public struct HighlightShadowAdjust {

    public static let defaultInputHighlightAmount: CGFloat = 1.0
    public static let defaultInputShadowAmount: CGFloat = 1.0

    public static func filter(inputHighlightAmount: CGFloat = defaultInputHighlightAmount, inputShadowAmount: CGFloat = defaultInputShadowAmount) -> Filter {
        { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputHighlightAmount": inputHighlightAmount,
                "inputShadowAmount": inputShadowAmount
            ]
            let filter = CIFilter(name: "CIHighlightShadowAdjust", parameters: parameters)
            return filter?.outputImage
        }
    }

}
