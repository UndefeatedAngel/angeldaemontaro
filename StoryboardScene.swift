// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length prefer_self_in_static_references
// swiftlint:disable type_body_length type_name
internal enum StoryboardScene {
  internal enum Angels: StoryboardType {
    internal static let storyboardName = "Angels"

    internal static let angelsSB = SceneType<TabNavigationController>(storyboard: Angels.self, identifier: "angelsSB")
  }
  internal enum CardOfDay: StoryboardType {
    internal static let storyboardName = "CardOfDay"

    internal static let cardOfDaysSB = SceneType<TabNavigationController>(storyboard: CardOfDay.self, identifier: "cardOfDaysSB")
  }
  internal enum HighPriestess: StoryboardType {
    internal static let storyboardName = "HighPriestess"

    internal static let highPriestessSB = SceneType<UIKit.UINavigationController>(storyboard: HighPriestess.self, identifier: "highPriestessSB")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<MainTabBarViewController>(storyboard: Main.self)
  }
  internal enum Tarots: StoryboardType {
    internal static let storyboardName = "Tarots"

    internal static let tarotsSB = SceneType<TabNavigationController>(storyboard: Tarots.self, identifier: "tarotsSB")
  }
  internal enum Video: StoryboardType {
    internal static let storyboardName = "Video"

    internal static let videoSB = SceneType<TabNavigationController>(storyboard: Video.self, identifier: "videoSB")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length prefer_self_in_static_references
// swiftlint:enable type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
// swiftlint:disable all
