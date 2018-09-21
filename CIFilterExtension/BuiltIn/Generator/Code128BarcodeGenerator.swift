import Foundation
import CoreImage

@available(iOS 8, OSX 10.10, *)
public struct Code128BarcodeGenerator {

    // Default value: 7.00 Minimum: 0.00 Maximum: 20.00 Slider minimum: 0.00 Slider maximum: 20.00 Identity: 0.00
    public static func image(inputMessage: Data, inputQuietSpace: CGFloat = 7.0) -> CIImage? {
        let parameters: Parameters = [
            "inputMessage": inputMessage,
            "inputQuietSpace": inputQuietSpace
        ]
        return CIFilter(name: "CICode128BarcodeGenerator", parameters: parameters)?.outputImage
    }

}
