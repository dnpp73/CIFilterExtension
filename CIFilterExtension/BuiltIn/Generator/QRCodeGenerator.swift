import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct QRCodeGenerator {
    
    public enum ErrorCorrectionLevel: String {
        case L = "L"
        case M = "M" // defaultValue
        case Q = "Q"
        case H = "H"
    }
    
    public static func image(inputMessage: Data, inputCorrectionLevel: ErrorCorrectionLevel = .M) -> CIImage? {
        let parameters: Parameters = [
            "inputMessage": inputMessage,
            "inputCorrectionLevel": inputCorrectionLevel.rawValue
        ]
        return CIFilter(name: "CIQRCodeGenerator", parameters: parameters)?.outputImage
    }
    
}
