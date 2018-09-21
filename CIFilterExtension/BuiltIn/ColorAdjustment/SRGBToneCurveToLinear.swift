import Foundation
import CoreImage

@available(iOS 7, OSX 10.10, *)
public struct SRGBToneCurveToLinear {

    public static var filter: Filter {
        return noParamsFilter(name: "CISRGBToneCurveToLinear")
    }

}
