import Foundation
import CoreImage

extension CIImage {
    public func squareCropped() -> CIImage {
        let squareCroppedImage: CIImage
        if extent.width > extent.height {
            // 横長
            let shortSide = extent.height
            let diff = extent.width - extent.height
            let croppedImage = cropped(to: CGRect(x: diff / 2.0, y: 0.0, width: shortSide, height: shortSide))
            squareCroppedImage = croppedImage.moveToOriginZero()
        } else if extent.width < extent.height {
            // 縦長
            let shortSide = extent.width
            let diff = extent.height - extent.width
            let croppedImage = cropped(to: CGRect(x: 0.0, y: diff / 2.0, width: shortSide, height: shortSide))
            squareCroppedImage = croppedImage.moveToOriginZero()
        } else {
            // 既に正方形
            squareCroppedImage = self
        }
        return squareCroppedImage
    }
}
