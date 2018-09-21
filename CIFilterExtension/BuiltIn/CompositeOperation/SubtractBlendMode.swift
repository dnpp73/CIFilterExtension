import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct SubtractBlendMode {

    public static func filter(inputBackgroundImage: CIImage) -> Filter {
        return composer(name: "CISubtractBlendMode")(inputBackgroundImage)
    }

}
