import Foundation
import CoreImage

@available(iOS 12, OSX 10.14, *)
public struct SampleNearest {

    public static var filter: Filter {
        noParamsFilter(name: "CISampleNearest")
    }

}

@available(iOS 12, OSX 10.14, *)
extension CIImage {
    public func transformedWithNearest(by transform: CGAffineTransform) -> CIImage {
        castOrFatalError(SampleNearest.filter(transformed(by: transform)))
    }

    public func resizedWithNearest(scaleX: CGFloat, scaleY: CGFloat) -> CIImage {
        transformedWithNearest(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
    }

    public func resizedWithNearest(to size: CGSize) -> CIImage {
        let scaleX = size.width / extent.width
        let scaleY = size.height / extent.height
        return resizedWithNearest(scaleX: scaleX, scaleY: scaleY)
    }
}
