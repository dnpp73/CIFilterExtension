import Foundation
import CoreImage

@available(iOS 11, OSX 10.13, *)
public struct AttributedTextImageGenerator {

    public static let defaultInputScaleFactor: CGFloat = 1.0

    public static func image(inputText: NSAttributedString, inputScaleFactor: CGFloat = defaultInputScaleFactor) -> CIImage? {
        let parameters: Parameters = [
            "inputText": inputText,
            "inputScaleFactor": inputScaleFactor,
        ]
        return CIFilter(name: "CIAttributedTextImageGenerator", parameters: parameters)?.outputImage
    }

}
