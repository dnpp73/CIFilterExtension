import Foundation
import CoreImage

extension CIImage {
    public func move(translationX: CGFloat, translationY: CGFloat) -> CIImage {
        transformed(by: CGAffineTransform(translationX: translationX, y: translationY))
    }

    public func moveToOriginZero() -> CIImage {
        move(translationX: -extent.origin.x, translationY: -extent.origin.y)
    }

    public func resized(scaleX: CGFloat, scaleY: CGFloat) -> CIImage {
        transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
    }

    public func resized(to size: CGSize) -> CIImage {
        let scaleX = size.width / extent.width
        let scaleY = size.height / extent.height
        return resized(scaleX: scaleX, scaleY: scaleY)
    }
}
