import Foundation
import CoreImage

@available(iOS 6, OSX 10.4, *)
public struct ColorCube {

    public static func filter(inputCube: ColorCubeData) -> Filter {
        return { image in
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
            
            if let inputCubeData = inputCubeData, let inputCubeDimension = inputCubeDimension {
                parameters["inputCubeData"] = inputCubeData
                parameters["inputCubeDimension"] = inputCubeDimension
            }
            
            let filter = CIFilter(name: "CIColorCube", withInputParameters: parameters)
            return filter?.outputImage
        }
    }
    
}
