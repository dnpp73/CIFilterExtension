import Foundation
import CoreImage

public typealias ColorCubeData = [RGBAComponents]

internal func countIsCube(dividend: Int) -> Bool {
    return cubeRoot(dividend: dividend) != 0
}

internal func cubeRoot(dividend: Int) -> Int {
    if dividend <= 0 {
        return 0
    }
    let ceil = 64
    let floor = 1
    return cubeRootIter(guess: floor, target: dividend, ceil: ceil)
}

private func cubeRootIter(guess: Int, target: Int, ceil: Int) -> Int {
    if isCubeRoot(possibleRoot: guess, target: target) {
        return guess
    } else if guess >= ceil {
        return 0
    }
    return cubeRootIter(guess: guess + 1, target: target, ceil: ceil)
}

private func isCubeRoot(possibleRoot: Int, target: Int) -> Bool{
    return cube(possibleRoot) == target
}

private func cube(_ x: Int) -> Int {
    return x * x * x
}
