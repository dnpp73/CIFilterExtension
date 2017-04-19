import Foundation
import CoreImage

@available(iOS 9, OSX 10.5, *)
public struct ComicEffect {
    
    public static var filter: Filter {
        return noParamsFilter(name: "CIComicEffect")
    }
    
}
