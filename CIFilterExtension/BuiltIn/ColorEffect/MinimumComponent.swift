import Foundation
import CoreImage

@available(iOS 6, OSX 10.5, *)
public struct MinimumComponent {

    public static var filter: Filter {
        return noParamsFilter(name: "CIMinimumComponent")
    }

}
