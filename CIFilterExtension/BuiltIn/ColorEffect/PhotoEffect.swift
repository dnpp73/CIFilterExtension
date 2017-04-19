import Foundation
import CoreImage

public struct PhotoEffect {
    
    // MARK:- Chrome
    
    @available(iOS 7, OSX 10.9, *)
    public static var chrome: Filter {
        return noParamsFilter(name: "CIPhotoEffectChrome")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func chrome(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: chrome, alpha: alpha)
    }
    
    // MARK:- Fade
    
    @available(iOS 7, OSX 10.9, *)
    public static var fade: Filter {
        return noParamsFilter(name: "CIPhotoEffectFade")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func fade(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: fade, alpha: alpha)
    }
    
    // MARK:- Instant
    
    @available(iOS 7, OSX 10.9, *)
    public static var instant: Filter {
        return noParamsFilter(name: "CIPhotoEffectInstant")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func instant(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: instant, alpha: alpha)
    }
    
    // MARK:- Mono
    
    @available(iOS 7, OSX 10.9, *)
    public static var mono: Filter {
        return noParamsFilter(name: "CIPhotoEffectMono")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func mono(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: mono, alpha: alpha)
    }
    
    // MARK:- Noir
    
    @available(iOS 7, OSX 10.9, *)
    public static var noir: Filter {
        return noParamsFilter(name: "CIPhotoEffectNoir")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func noir(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: noir, alpha: alpha)
    }
    
    // MARK:- Process
    
    @available(iOS 7, OSX 10.9, *)
    public static var process: Filter {
        return noParamsFilter(name: "CIPhotoEffectProcess")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func process(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: process, alpha: alpha)
    }
    
    // MARK:- Tonal
    
    @available(iOS 7, OSX 10.9, *)
    public static var tonal: Filter {
        return noParamsFilter(name: "CIPhotoEffectTonal")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func tonal(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: tonal, alpha: alpha)
    }
    
    // MARK:- Transfer
    
    @available(iOS 7, OSX 10.9, *)
    public static var transfer: Filter {
        return noParamsFilter(name: "CIPhotoEffectTransfer")
    }
    
    @available(iOS 7, OSX 10.9, *)
    public static func transfer(alpha: CGFloat) -> Filter {
        return SourceOverCompositing.alpha(filter: transfer, alpha: alpha)
    }
    
}
