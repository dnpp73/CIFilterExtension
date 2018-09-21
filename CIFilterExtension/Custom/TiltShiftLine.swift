import Foundation
import CoreImage

public struct TiltShiftLine {

    // TODO: ちゃんと作る。

    public static func filter(center: XYPosition? = nil,
                              blurRadius: CGFloat = 20.0) -> Filter {
        return { image in

            // let c = center ?? XYPosition(x: rect.midX, y: rect.midY)

            let rect = image.extent

            let colorOpaque      = CIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            let colorTransparent = CIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.0)

            // 真ん中が緑で上下の端が透明になるようなマスクを生成する。
            // 上側のグラデーション。最上部が透明。
            let topRect = rect.applying(CGAffineTransform(scaleX: 1.0, y: 0.5)).applying(CGAffineTransform(translationX: 0.0, y: rect.height / 2.0))
            let topPoint0 = XYPosition(x: rect.midX, y: rect.maxY)
            let topPoint1 = XYPosition(x: rect.midX, y: rect.maxY - 200.0)
            guard let gradientTop = LinearGradient.image(inputPoint0: topPoint0, inputPoint1: topPoint1, inputColor0: colorTransparent, inputColor1: colorOpaque)?.cropped(to: topRect) else {
                return nil
            }
            // return gradientTop.cropping(to: rect)

            // 下側のグラデーション。最下部が透明。
            let bottomRect = rect.applying(CGAffineTransform(scaleX: 1.0, y: 0.501)) // なんとなく被せておきたい
            let bottomPoint0 = XYPosition(x: rect.midX, y: rect.minY)
            let bottomPoint1 = XYPosition(x: rect.midX, y: rect.minY + 200.0)
            guard let gradientBottom = LinearGradient.image(inputPoint0: bottomPoint0, inputPoint1: bottomPoint1, inputColor0: colorTransparent, inputColor1: colorOpaque)?.cropped(to: bottomRect) else {
                return nil
            }
            // return gradientBottom.cropping(to: rect)

            guard let gradient = SourceOverCompositing.filter(inputBackgroundImage: gradientTop)(gradientBottom)?.cropped(to: rect) else {
                return nil
            }
            // return gradient

            let blur = GaussianBlur.filterWithClampAndCrop(inputRadius: blurRadius)
            guard let blured = blur(image) else {
                return nil
            }

            return BlendWithMask.image(image: image, inputBackgroundImage: blured, inputMaskImage: gradient)
        }
    }

}
