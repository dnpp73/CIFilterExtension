import Foundation
import CoreImage

@available(iOS 8, OSX 10.10, *)
public struct DivideBlendMode {

    public static func filter(inputBackgroundImage: CIImage) -> Filter {
        composer(name: "CIDivideBlendMode")(inputBackgroundImage)
    }

}
