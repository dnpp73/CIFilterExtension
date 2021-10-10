import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct ConstantColorGenerator {

    public static let defaultInputColor = CIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)

    public static func image(inputColor: CIColor = defaultInputColor) -> CIImage? {
        let parameters: Parameters = [
            "inputColor": inputColor
        ]
        return CIFilter(name: "CIConstantColorGenerator", parameters: parameters)?.outputImage
    }

}
