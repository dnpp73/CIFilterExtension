import Foundation
import CoreImage

@available(iOS 7, OSX 10.9, *)
public struct ColorCubeWithColorSpace {

    public static func filter(inputCube: ColorCubeData, inputColorSpace: CGColorSpace?) -> Filter {
        { image in
            var parameters: Parameters = [
                kCIInputImageKey: image
            ]

            var inputCubeDimension: Int?
            var inputCubeData: NSData?
            if countIsCube(dividend: inputCube.count) {
                inputCubeDimension = cubeRoot(dividend: inputCube.count)
                let asVector = inputCube.map { [Float($0.r), Float($0.g), Float($0.b), Float($0.a)] }
                let vectorArray = asVector.reduce([], +)
                let length = vectorArray.count * MemoryLayout<Float>.size
                inputCubeData = NSData(bytes: vectorArray, length: length)
            }

            if let inputColorSpace = inputColorSpace {
                parameters["inputColorSpace"] = inputColorSpace
            }

            if let inputCubeData = inputCubeData, let inputCubeDimension = inputCubeDimension {
                parameters["inputCubeData"] = inputCubeData
                parameters["inputCubeDimension"] = inputCubeDimension
            }

            let filter = CIFilter(name: "CIColorCubeWithColorSpace", parameters: parameters)
            return filter?.outputImage
        }
    }

}
