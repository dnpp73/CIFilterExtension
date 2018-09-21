import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct MaskToAlpha {

    public static var filter: Filter {
        return noParamsFilter(name: "CIMaskToAlpha")
    }

}
