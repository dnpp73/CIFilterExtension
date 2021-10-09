import Foundation
import CoreImage

public struct PhotoEffect {

    // MARK: - Chrome

    @available(iOS 7, OSX 10.9, *)
    public static var chrome: Filter {
        noParamsFilter(name: "CIPhotoEffectChrome")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func chrome(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: chrome, alpha: alpha)
    }

    // MARK: - Fade

    @available(iOS 7, OSX 10.9, *)
    public static var fade: Filter {
        noParamsFilter(name: "CIPhotoEffectFade")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func fade(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: fade, alpha: alpha)
    }

    // MARK: - Instant

    @available(iOS 7, OSX 10.9, *)
    public static var instant: Filter {
        noParamsFilter(name: "CIPhotoEffectInstant")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func instant(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: instant, alpha: alpha)
    }

    // MARK: - Mono

    @available(iOS 7, OSX 10.9, *)
    public static var mono: Filter {
        noParamsFilter(name: "CIPhotoEffectMono")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func mono(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: mono, alpha: alpha)
    }

    // MARK: - Noir

    @available(iOS 7, OSX 10.9, *)
    public static var noir: Filter {
        noParamsFilter(name: "CIPhotoEffectNoir")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func noir(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: noir, alpha: alpha)
    }

    // MARK: - Process

    @available(iOS 7, OSX 10.9, *)
    public static var process: Filter {
        noParamsFilter(name: "CIPhotoEffectProcess")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func process(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: process, alpha: alpha)
    }

    // MARK: - Tonal

    @available(iOS 7, OSX 10.9, *)
    public static var tonal: Filter {
        noParamsFilter(name: "CIPhotoEffectTonal")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func tonal(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: tonal, alpha: alpha)
    }

    // MARK: - Transfer

    @available(iOS 7, OSX 10.9, *)
    public static var transfer: Filter {
        noParamsFilter(name: "CIPhotoEffectTransfer")
    }

    @available(iOS 7, OSX 10.9, *)
    public static func transfer(alpha: CGFloat) -> Filter {
        SourceOverCompositing.alpha(filter: transfer, alpha: alpha)
    }

}
