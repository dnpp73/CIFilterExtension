import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct ColorInvert {

    public static var filter: Filter {
        return noParamsFilter(name: "CIColorInvert")
    }

}
