import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct RandomGenerator {

    public static var image: CIImage? {
        CIFilter(name: "CIRandomGenerator")?.outputImage
    }

}
