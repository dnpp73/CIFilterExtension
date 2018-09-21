import Foundation
import CoreImage

@available(iOS 5, OSX 10.4, *)
public struct ColorMatrix {
    
    public static let defaultInputRVector    = RGBAComponents(r: 1.0, g: 0.0, b: 0.0, a: 0.0)
    public static let defaultInputGVector    = RGBAComponents(r: 0.0, g: 1.0, b: 0.0, a: 0.0)
    public static let defaultInputBVector    = RGBAComponents(r: 0.0, g: 0.0, b: 1.0, a: 0.0)
    public static let defaultInputAVector    = RGBAComponents(r: 0.0, g: 0.0, b: 0.0, a: 1.0)
    public static let defaultInputBiasVector = RGBAComponents(r: 0.0, g: 0.0, b: 0.0, a: 0.0)
    
    public static func filter(inputRVector: RGBAComponents = defaultInputRVector,
                              inputGVector: RGBAComponents = defaultInputGVector,
                              inputBVector: RGBAComponents = defaultInputBVector,
                              inputAVector: RGBAComponents = defaultInputAVector,
                              inputBiasVector: RGBAComponents = defaultInputBiasVector) -> Filter {
        return { image in
            let parameters = [
                kCIInputImageKey: image,
                "inputRVector": inputRVector.vector,
                "inputGVector": inputGVector.vector,
                "inputBVector": inputBVector.vector,
                "inputAVector": inputAVector.vector,
                "inputBiasVector": inputBiasVector.vector
            ]
            
            let filter = CIFilter(name: "CIColorMatrix", parameters: parameters)
            return filter?.outputImage
        }
    }
    
}
