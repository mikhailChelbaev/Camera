import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {
  
  /// The "mijick-background-inverted" asset catalog color resource.
  static let mijickBackgroundInverted = ColorResource(name: "mijick-background-inverted", bundle: resourceBundle)
  
  /// The "mijick-background-primary" asset catalog color resource.
  static let mijickBackgroundPrimary = ColorResource(name: "mijick-background-primary", bundle: resourceBundle)
  
  /// The "mijick-background-primary-50" asset catalog color resource.
  static let mijickBackgroundPrimary50 = ColorResource(name: "mijick-background-primary-50", bundle: resourceBundle)
  
  /// The "mijick-background-primary-80" asset catalog color resource.
  static let mijickBackgroundPrimary80 = ColorResource(name: "mijick-background-primary-80", bundle: resourceBundle)
  
  /// The "mijick-background-red" asset catalog color resource.
  static let mijickBackgroundRed = ColorResource(name: "mijick-background-red", bundle: resourceBundle)
  
  /// The "mijick-background-secondary" asset catalog color resource.
  static let mijickBackgroundSecondary = ColorResource(name: "mijick-background-secondary", bundle: resourceBundle)
  
  /// The "mijick-background-yellow" asset catalog color resource.
  static let mijickBackgroundYellow = ColorResource(name: "mijick-background-yellow", bundle: resourceBundle)
  
  /// The "mijick-text-brand" asset catalog color resource.
  static let mijickTextBrand = ColorResource(name: "mijick-text-brand", bundle: resourceBundle)
  
  /// The "mijick-text-primary" asset catalog color resource.
  static let mijickTextPrimary = ColorResource(name: "mijick-text-primary", bundle: resourceBundle)
  
  /// The "mijick-text-secondary" asset catalog color resource.
  static let mijickTextSecondary = ColorResource(name: "mijick-text-secondary", bundle: resourceBundle)
  
  /// The "mijick-text-tertiary" asset catalog color resource.
  static let mijickTextTertiary = ColorResource(name: "mijick-text-tertiary", bundle: resourceBundle)
  
}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {
  
  /// The "mijick-icon-cancel" asset catalog image resource.
  static let mijickIconCancel = ImageResource(name: "mijick-icon-cancel", bundle: resourceBundle)
  
  /// The "mijick-icon-change-camera" asset catalog image resource.
  static let mijickIconChangeCamera = ImageResource(name: "mijick-icon-change-camera", bundle: resourceBundle)
  
  /// The "mijick-icon-check" asset catalog image resource.
  static let mijickIconCheck = ImageResource(name: "mijick-icon-check", bundle: resourceBundle)
  
  /// The "mijick-icon-crosshair" asset catalog image resource.
  static let mijickIconCrosshair = ImageResource(name: "mijick-icon-crosshair", bundle: resourceBundle)
  
  /// The "mijick-icon-flash-auto" asset catalog image resource.
  static let mijickIconFlashAuto = ImageResource(name: "mijick-icon-flash-auto", bundle: resourceBundle)
  
  /// The "mijick-icon-flash-off" asset catalog image resource.
  static let mijickIconFlashOff = ImageResource(name: "mijick-icon-flash-off", bundle: resourceBundle)
  
  /// The "mijick-icon-flash-on" asset catalog image resource.
  static let mijickIconFlashOn = ImageResource(name: "mijick-icon-flash-on", bundle: resourceBundle)
  
  /// The "mijick-icon-flip-off" asset catalog image resource.
  static let mijickIconFlipOff = ImageResource(name: "mijick-icon-flip-off", bundle: resourceBundle)
  
  /// The "mijick-icon-flip-on" asset catalog image resource.
  static let mijickIconFlipOn = ImageResource(name: "mijick-icon-flip-on", bundle: resourceBundle)
  
  /// The "mijick-icon-grid-off" asset catalog image resource.
  static let mijickIconGridOff = ImageResource(name: "mijick-icon-grid-off", bundle: resourceBundle)
  
  /// The "mijick-icon-grid-on" asset catalog image resource.
  static let mijickIconGridOn = ImageResource(name: "mijick-icon-grid-on", bundle: resourceBundle)
  
  /// The "mijick-icon-light" asset catalog image resource.
  static let mijickIconLight = ImageResource(name: "mijick-icon-light", bundle: resourceBundle)
  
  /// The "mijick-icon-photo" asset catalog image resource.
  static let mijickIconPhoto = ImageResource(name: "mijick-icon-photo", bundle: resourceBundle)
  
  /// The "mijick-icon-video" asset catalog image resource.
  static let mijickIconVideo = ImageResource(name: "mijick-icon-video", bundle: resourceBundle)
  
}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Swift.Hashable, Swift.Sendable {
  
  /// An asset catalog color resource name.
  fileprivate let name: Swift.String
  
  /// An asset catalog color resource bundle.
  fileprivate let bundle: Foundation.Bundle
  
  /// Initialize a `ColorResource` with `name` and `bundle`.
  init(name: Swift.String, bundle: Foundation.Bundle) {
    self.name = name
    self.bundle = bundle
  }
  
}

/// An image resource.
struct ImageResource: Swift.Hashable, Swift.Sendable {
  
  /// An asset catalog image resource name.
  fileprivate let name: Swift.String
  
  /// An asset catalog image resource bundle.
  fileprivate let bundle: Foundation.Bundle
  
  /// Initialize an `ImageResource` with `name` and `bundle`.
  init(name: Swift.String, bundle: Foundation.Bundle) {
    self.name = name
    self.bundle = bundle
  }
  
}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {
  
  /// Initialize a `NSColor` with a color resource.
  convenience init(resource: ColorResource) {
    self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
  }
  
}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {
  
  /// Initialize a `NSImage` with an image resource.
  init(resource: ImageResource) {
    self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
  }
  
}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {
  
  /// Initialize a `UIColor` with a color resource.
  convenience init(resource: ColorResource) {
#if !os(watchOS)
    self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
    self.init()
#endif
  }
  
}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {
  
  /// Initialize a `UIImage` with an image resource.
  convenience init(resource: ImageResource) {
#if !os(watchOS)
    self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
    self.init()
#endif
  }
  
}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {
  
  /// Initialize a `Color` with a color resource.
  init(_ resource: ColorResource) {
    self.init(resource.name, bundle: resource.bundle)
  }
  
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {
  
  /// Initialize an `Image` with an image resource.
  init(_ resource: ImageResource) {
    self.init(resource.name, bundle: resource.bundle)
  }
  
}
#endif
