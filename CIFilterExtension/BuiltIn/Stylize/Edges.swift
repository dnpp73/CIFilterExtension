import Foundation
import CoreImage

@available(iOS 9, OSX 10.4, *)
public struct Edges {

    public static let defaultInputIntensity: CGFloat = 1.0

    public static func filter(inputIntensity: CGFloat = defaultInputIntensity) -> Filter {
        return { image in
            let parameters: Parameters = [
                kCIInputImageKey: image,
                kCIInputIntensityKey: inputIntensity
            ]
            let filter = CIFilter(name: "CIEdges", parameters: parameters)
            return filter?.outputImage
        }
    }

}
