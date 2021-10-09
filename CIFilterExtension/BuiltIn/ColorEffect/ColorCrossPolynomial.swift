import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct ColorCrossPolynomial {

    public static let defaultInputRedCoefficients   = CrossPolynomialCoefficients(a0: 1.0, a1: 0.0, a2: 0.0, a3: 0.0, a4: 0.0, a5: 0.0, a6: 0.0, a7: 0.0, a8: 0.0, a9: 0.0)
    public static let defaultInputGreenCoefficients = CrossPolynomialCoefficients(a0: 0.0, a1: 1.0, a2: 0.0, a3: 0.0, a4: 0.0, a5: 0.0, a6: 0.0, a7: 0.0, a8: 0.0, a9: 0.0)
    public static let defaultInputBlueCoefficients  = CrossPolynomialCoefficients(a0: 0.0, a1: 0.0, a2: 1.0, a3: 0.0, a4: 0.0, a5: 0.0, a6: 0.0, a7: 0.0, a8: 0.0, a9: 0.0)

    public static func filter(inputRedCoefficients: CrossPolynomialCoefficients = defaultInputRedCoefficients,
                              inputGreenCoefficients: CrossPolynomialCoefficients = defaultInputGreenCoefficients,
                              inputBlueCoefficients: CrossPolynomialCoefficients = defaultInputBlueCoefficients) -> Filter {
        { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputRedCoefficients": inputRedCoefficients.vector,
                "inputGreenCoefficients": inputGreenCoefficients.vector,
                "inputBlueCoefficients": inputBlueCoefficients.vector
            ]
            let filter = CIFilter(name: "CIColorCrossPolynomial", parameters: parameters)
            return filter?.outputImage
        }
    }

}
