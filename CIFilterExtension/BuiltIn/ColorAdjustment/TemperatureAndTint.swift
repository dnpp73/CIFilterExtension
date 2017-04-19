import Foundation
import CoreImage

@available(iOS 5, OSX 10.7, *)
public struct TemperatureAndTint {
    
    public static let defaultInputNeutral = TempAndTint(temp: 6500.0, tint: 0.0)
    public static let defaultTargetInputNeutral = TempAndTint(temp: 6500.0, tint: 0.0)
    
    public static func filter(inputNeutral: TempAndTint = defaultInputNeutral,
                              targetInputNeutral: TempAndTint = defaultTargetInputNeutral) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                "inputNeutral": inputNeutral.vector,
                "inputTargetNeutral": targetInputNeutral.vector
            ]
            let filter = CIFilter(name: "CITemperatureAndTint", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
