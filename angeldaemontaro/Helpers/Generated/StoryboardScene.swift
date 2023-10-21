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

    internal static let initialScene = InitialSceneType<TabNavigationController>(storyboard: CardOfDay.self)

    internal static let cardOfDaysSB = SceneType<TabNavigationController>(storyboard: CardOfDay.self, identifier: "cardOfDaysSB")
  }
  internal enum ChoiseStoryboard: StoryboardType {
    internal static let storyboardName = "ChoiseStoryboard"

    internal static let choiseViewController = SceneType<ChoiseViewController>(storyboard: ChoiseStoryboard.self, identifier: "ChoiseViewController")
  }
  internal enum FinansialStoryboard: StoryboardType {
    internal static let storyboardName = "FinansialStoryboard"

    internal static let finansialViewController = SceneType<FinansialViewController>(storyboard: FinansialStoryboard.self, identifier: "FinansialViewController")
  }
  internal enum HealthyStoryboard: StoryboardType {
    internal static let storyboardName = "HealthyStoryboard"

    internal static let healthyViewController = SceneType<HealthyViewController>(storyboard: HealthyStoryboard.self, identifier: "HealthyViewController")
  }
  internal enum HighPriestess: StoryboardType {
    internal static let storyboardName = "HighPriestess"

    internal static let highPriestessSB = SceneType<UIKit.UINavigationController>(storyboard: HighPriestess.self, identifier: "highPriestessSB")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum LovelyStoryboard: StoryboardType {
    internal static let storyboardName = "LovelyStoryboard"

    internal static let lovelyViewController = SceneType<LovelyViewController>(storyboard: LovelyStoryboard.self, identifier: "LovelyViewController")
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<MainContainerViewController>(storyboard: Main.self)
  }
  internal enum OnEveryDayStoryboard: StoryboardType {
    internal static let storyboardName = "OnEveryDayStoryboard"

    internal static let onEveryDayViewController = SceneType<OnEveryDayViewController>(storyboard: OnEveryDayStoryboard.self, identifier: "OnEveryDayViewController")
  }
  internal enum PersonalGrowthStoryboard: StoryboardType {
    internal static let storyboardName = "PersonalGrowthStoryboard"

    internal static let personalGrowthViewController = SceneType<PersonalGrowthViewController>(storyboard: PersonalGrowthStoryboard.self, identifier: "PersonalGrowthViewController")
  }
  internal enum Profile: StoryboardType {
    internal static let storyboardName = "Profile"

    internal static let profileSB = SceneType<UIKit.UINavigationController>(storyboard: Profile.self, identifier: "profileSB")
  }
  internal enum Settings: StoryboardType {
    internal static let storyboardName = "Settings"

    internal static let settingsSB = SceneType<UIKit.UINavigationController>(storyboard: Settings.self, identifier: "settingsSB")
  }
  internal enum Tarots: StoryboardType {
    internal static let storyboardName = "Tarots"

    internal static let tarotsSB = SceneType<TabNavigationController>(storyboard: Tarots.self, identifier: "tarotsSB")
  }
  internal enum Video: StoryboardType {
    internal static let storyboardName = "Video"

    internal static let videoSB = SceneType<TabNavigationController>(storyboard: Video.self, identifier: "videoSB")
  }
  internal enum СelticCrossStoryboard: StoryboardType {
    internal static let storyboardName = "СelticCrossStoryboard"

    internal static let сelticCrossViewController = SceneType<CelticCrossViewController>(storyboard: СelticCrossStoryboard.self, identifier: "СelticCrossViewController")
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
