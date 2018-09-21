import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct ColorPolynomial {
    
    public static let defaultCoefficients = PolynomialCoefficients(a0: 0.0, a1: 1.0, a2: 0.0, a3: 0.0)
    
    public static func filter(inputRedCoefficients: PolynomialCoefficients = defaultCoefficients,
                              inputGreenCoefficients: PolynomialCoefficients = defaultCoefficients,
                              inputBlueCoefficients: PolynomialCoefficients = defaultCoefficients,
                              inputAlphaCoefficients: PolynomialCoefficients = defaultCoefficients) -> Filter {
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputRedCoefficients": inputRedCoefficients.vector,
                "inputGreenCoefficients": inputGreenCoefficients.vector,
                "inputBlueCoefficients": inputBlueCoefficients.vector,
                "inputAlphaCoefficients": inputAlphaCoefficients.vector
            ]
            let filter = CIFilter(name: "CIColorPolynomial", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
