import Foundation
import CoreImage

@available(iOS 6, OSX 10.5, *)
public struct MaximumComponent {
    
    public static var filter: Filter {
        return noParamsFilter(name: "CIMaximumComponent")
    }
    
}
