import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct AdditionCompositing {

    public static func filter(inputBackgroundImage: CIImage) -> Filter {
        composer(name: "CIAdditionCompositing")(inputBackgroundImage)
    }

}
