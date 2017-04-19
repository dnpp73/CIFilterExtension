import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct DifferenceBlendMode {
        
    public static func filter(inputBackgroundImage: CIImage) -> Filter {
        return composer(name: "CIDifferenceBlendMode")(inputBackgroundImage)
    }
    
}
