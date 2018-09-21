import Foundation
import CoreImage

public struct TiltShiftCircle {

    public enum BlurType {
        case gaussian(radius: CGFloat)
        case box(radius: CGFloat)
        case disc(radius: CGFloat)
        case motion(radius: CGFloat, angle: CGFloat)
        case zoom(radius: CGFloat)
    }

    public static let defaultBlurType = BlurType.gaussian(radius: 20.0)

    public static func filter(blurType: BlurType = defaultBlurType,
                              center: XYPosition? = nil,
                              radius0: CGFloat? = nil,
                              radius1: CGFloat? = nil) -> Filter {
        return { image in

            let rect = image.extent

            let colorOpaque      = CIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            let colorTransparent = CIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.0)
            let c = center ?? XYPosition(x: rect.midX, y: rect.midY)
            let r0: CGFloat = radius0 ?? 5.0
            let r1: CGFloat = radius1 ?? min(rect.width, rect.height) - 5.0
            guard let gradient = RadialGradient.image(inputCenter: c, inputRadius0: r0, inputRadius1: r1, inputColor0: colorOpaque, inputColor1: colorTransparent)?.cropped(to: rect) else {
                return nil
            }

            let blur: Filter
            switch blurType {
            case .gaussian(let radius):
                blur = GaussianBlur.filterWithClampAndCrop(inputRadius: radius)
            case .box(let radius):
                if #available(iOS 9.0, *) {
                    blur = BoxBlur.filterWithClampAndCrop(inputRadius: radius)
                } else {
                    blur = GaussianBlur.filterWithClampAndCrop(inputRadius: radius)
                }
            case .disc(let radius):
                if #available(iOS 9.0, *) {
                    blur = DiscBlur.filterWithClampAndCrop(inputRadius: radius)
                } else {
                    blur = GaussianBlur.filterWithClampAndCrop(inputRadius: radius)
                }
            case .motion(let radius, let angle):
                if #available(iOS 9.0, *) {
                    blur = MotionBlur.filterWithClampAndCrop(inputRadius: radius, inputAngle: angle)
                } else {
                    blur = GaussianBlur.filterWithClampAndCrop(inputRadius: radius)
                }
            case .zoom(let radius):
                if #available(iOS 9.0, *) {
                    blur = ZoomBlur.filterWithClampAndCrop(inputCenter: c, inputRadius: radius)
                } else {
                    blur = GaussianBlur.filterWithClampAndCrop(inputRadius: radius)
                }
            }
            guard let blured = blur(image) else {
                return nil
            }

            return BlendWithMask.image(image: image, inputBackgroundImage: blured, inputMaskImage: gradient)
        }
    }

}
