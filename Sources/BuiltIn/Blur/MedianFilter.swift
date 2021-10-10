import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct MedianFilter {

    public static var filter: Filter {
        noParamsFilter(name: "CIMedianFilter")
    }

}
