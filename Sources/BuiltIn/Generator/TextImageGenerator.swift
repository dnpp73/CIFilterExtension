import Foundation
import CoreImage

@available(iOS 11, OSX 10.13, *)
public struct TextImageGenerator {

    public static let defaultInputFontName = "HelveticaNeue"
    public static let defaultInputFontSize: CGFloat = 14.0
    public static let defaultInputScaleFactor: CGFloat = 1.0

    public static func image(inputText: String,
                             inputFontName: String = defaultInputFontName,
                             inputFontSize: CGFloat = defaultInputFontSize,
                             inputScaleFactor: CGFloat = defaultInputScaleFactor) -> CIImage? {
        let parameters: Parameters = [
            "inputText": inputText,
            "inputFontName": inputFontName,
            "inputFontSize": inputFontSize,
            "inputScaleFactor": inputScaleFactor,
        ]
        return CIFilter(name: "CITextImageGenerator", parameters: parameters)?.outputImage
    }

}
