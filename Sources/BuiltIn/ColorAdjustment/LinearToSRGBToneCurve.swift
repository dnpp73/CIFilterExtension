import Foundation
import CoreImage

@available(iOS 7, OSX 10.10, *)
public struct LinearToSRGBToneCurve {

    public static var filter: Filter {
        noParamsFilter(name: "CILinearToSRGBToneCurve")
    }

}
