// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal enum Colors {
  }
  internal enum Images {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let kingOfCupsEn = ImageAsset(name: "kingOfCups_en")
    internal static let kingOfPentaclesEn = ImageAsset(name: "kingOfPentacles_en")
    internal static let kingOfSwordsEn = ImageAsset(name: "kingOfSwords_en")
    internal static let kingOfWandsEn = ImageAsset(name: "kingOfWands_en")
    internal static let knightOfCupsEn = ImageAsset(name: "knightOfCups_en")
    internal static let knightOfPentaclesEn = ImageAsset(name: "knightOfPentacles_en")
    internal static let knightOfSwordsEn = ImageAsset(name: "knightOfSwords_en")
    internal static let knightOfWandsEn = ImageAsset(name: "knightOfWands_en")
    internal static let pageOfCupsEn = ImageAsset(name: "pageOfCups_en")
    internal static let pageOfPentaclesEn = ImageAsset(name: "pageOfPentacles_en")
    internal static let pageOfSwordsEn = ImageAsset(name: "pageOfSwords_en")
    internal static let pageOfWandsEn = ImageAsset(name: "pageOfWands_en")
    internal static let queenOfCupsEn = ImageAsset(name: "queenOfCups_en")
    internal static let queenOfPentaclesEn = ImageAsset(name: "queenOfPentacles_en")
    internal static let queenOfSwordsEn = ImageAsset(name: "queenOfSwords_en")
    internal static let queenOfWandsEN = ImageAsset(name: "queenOfWands_EN")
    internal static let kingOfCupsRu = ImageAsset(name: "kingOfCups_ru")
    internal static let kingOfPentaclesRu = ImageAsset(name: "kingOfPentacles_ru")
    internal static let kingOfSwordsRu = ImageAsset(name: "kingOfSwords_ru")
    internal static let kingOfWandsRu = ImageAsset(name: "kingOfWands_ru")
    internal static let knightOfCupsRu = ImageAsset(name: "knightOfCups_ru")
    internal static let knightOfPentaclesRu = ImageAsset(name: "knightOfPentacles_ru")
    internal static let knightOfSwordsRu = ImageAsset(name: "knightOfSwords_ru")
    internal static let knightOfWandsRu = ImageAsset(name: "knightOfWands_ru")
    internal static let pageOfCupsRu = ImageAsset(name: "pageOfCups_ru")
    internal static let pageOfPentaclesRu = ImageAsset(name: "pageOfPentacles_ru")
    internal static let pageOfSwordsRu = ImageAsset(name: "pageOfSwords_ru")
    internal static let pageOfWandsRu = ImageAsset(name: "pageOfWands_ru")
    internal static let queenOfCupsRu = ImageAsset(name: "queenOfCups_ru")
    internal static let queenOfPentaclesRu = ImageAsset(name: "queenOfPentacles_ru")
    internal static let queenOfSwordsRu = ImageAsset(name: "queenOfSwords_ru")
    internal static let queenOfWandsRu = ImageAsset(name: "queenOfWands_ru")
    internal static let chariotCardEn = ImageAsset(name: "chariotCard_en")
    internal static let deathCardEn = ImageAsset(name: "deathCard_en")
    internal static let devilCardEn = ImageAsset(name: "devilCard_en")
    internal static let doomsdayCardEn = ImageAsset(name: "doomsdayCard_en")
    internal static let emperorCardEn = ImageAsset(name: "emperorCard_en")
    internal static let empressCardEn = ImageAsset(name: "empressCard_en")
    internal static let foolEn = ImageAsset(name: "fool_en")
    internal static let hangedCardEn = ImageAsset(name: "hangedCard_en")
    internal static let hermitCardEn = ImageAsset(name: "hermitCard_en")
    internal static let hierophantCardEn = ImageAsset(name: "hierophantCard_en")
    internal static let highpriestessCardEn = ImageAsset(name: "highpriestessCard_en")
    internal static let justiceCardEn = ImageAsset(name: "justiceCard_en")
    internal static let lovesCardEn = ImageAsset(name: "lovesCard_en")
    internal static let magicianCardEn = ImageAsset(name: "magicianCard_en")
    internal static let moderationCardEn = ImageAsset(name: "moderationCard_en")
    internal static let moonCardEn = ImageAsset(name: "moonCard_en")
    internal static let starCardEn = ImageAsset(name: "starCard_en")
    internal static let strengthCardEn = ImageAsset(name: "strengthCard_en")
    internal static let sunCardEn = ImageAsset(name: "sunCard_en")
    internal static let towerCardEn = ImageAsset(name: "towerCard_en")
    internal static let wheelOfFortuneEn = ImageAsset(name: "wheelOfFortune_en")
    internal static let worldCardEn = ImageAsset(name: "worldCard_en")
    internal static let chariotCardRu = ImageAsset(name: "chariotCard_ru")
    internal static let deathCardRu = ImageAsset(name: "deathCard_ru")
    internal static let devilCardRu = ImageAsset(name: "devilCard_ru")
    internal static let doomsdayCardRu = ImageAsset(name: "doomsdayCard_ru")
    internal static let emperorCardRu = ImageAsset(name: "emperorCard_ru")
    internal static let empressCardRu = ImageAsset(name: "empressCard_ru")
    internal static let foolRu = ImageAsset(name: "fool_ru")
    internal static let hangedCardRu = ImageAsset(name: "hangedCard_ru")
    internal static let hermitCardRu = ImageAsset(name: "hermitCard_ru")
    internal static let hierophantCardRu = ImageAsset(name: "hierophantCard_ru")
    internal static let highpriestessCardRu = ImageAsset(name: "highpriestessCard_ru")
    internal static let justiceCardRu = ImageAsset(name: "justiceCard_ru")
    internal static let lovesCardRu = ImageAsset(name: "lovesCard_ru")
    internal static let magicianCardRu = ImageAsset(name: "magicianCard_ru")
    internal static let moderationCardRu = ImageAsset(name: "moderationCard_ru")
    internal static let moonCardRu = ImageAsset(name: "moonCard_ru")
    internal static let starCardRu = ImageAsset(name: "starCard_ru")
    internal static let strengthCardRu = ImageAsset(name: "strengthCard_ru")
    internal static let sunCardRu = ImageAsset(name: "sunCard_ru")
    internal static let towerCardRu = ImageAsset(name: "towerCard_ru")
    internal static let wheelOfFortuneRu = ImageAsset(name: "wheelOfFortune_ru")
    internal static let worldCardRu = ImageAsset(name: "worldCard_ru")
    internal static let aceOfCupsEn = ImageAsset(name: "aceOfCups_en")
    internal static let aceOfPentaclesEn = ImageAsset(name: "aceOfPentacles_en")
    internal static let aceOfSwordsEn = ImageAsset(name: "aceOfSwords_en")
    internal static let aceOfWandsEn = ImageAsset(name: "aceOfWands_en")
    internal static let eightOfCupsEn = ImageAsset(name: "eightOfCups_en")
    internal static let eightOfPentaclesEn = ImageAsset(name: "eightOfPentacles_en")
    internal static let eightOfSwordsEn = ImageAsset(name: "eightOfSwords_en")
    internal static let eightOfWandsEn = ImageAsset(name: "eightOfWands_en")
    internal static let fiveOfCupsEn = ImageAsset(name: "fiveOfCups_en")
    internal static let fiveOfPentaclesEn = ImageAsset(name: "fiveOfPentacles_en")
    internal static let fiveOfSwordsEn = ImageAsset(name: "fiveOfSwords_en")
    internal static let fiveOfWandsEn = ImageAsset(name: "fiveOfWands_en")
    internal static let fourOfCupsEn = ImageAsset(name: "fourOfCups_en")
    internal static let fourOfPentaclesEn = ImageAsset(name: "fourOfPentacles_en")
    internal static let fourOfSwordsEn = ImageAsset(name: "fourOfSwords_en")
    internal static let fourOfWandsEn = ImageAsset(name: "fourOfWands_en")
    internal static let nineOfCupsEn = ImageAsset(name: "nineOfCups_en")
    internal static let nineOfPentaclesEn = ImageAsset(name: "nineOfPentacles_en")
    internal static let nineOfSwordsEn = ImageAsset(name: "nineOfSwords_en")
    internal static let nineOfWandsEn = ImageAsset(name: "nineOfWands_en")
    internal static let sevenOfCupsEn = ImageAsset(name: "sevenOfCups_en")
    internal static let sevenOfPentaclesEn = ImageAsset(name: "sevenOfPentacles_en")
    internal static let sevenOfSwordsEn = ImageAsset(name: "sevenOfSwords_en")
    internal static let sevenOfWandsEn = ImageAsset(name: "sevenOfWands_en")
    internal static let sixOfCupsEn = ImageAsset(name: "sixOfCups_en")
    internal static let sixOfPentaclesEn = ImageAsset(name: "sixOfPentacles_en")
    internal static let sixOfSwordsEn = ImageAsset(name: "sixOfSwords_en")
    internal static let sixOfWandsEn = ImageAsset(name: "sixOfWands_en")
    internal static let tenOfCupsEn = ImageAsset(name: "tenOfCups_en")
    internal static let tenOfPentaclesEn = ImageAsset(name: "tenOfPentacles_en")
    internal static let tenOfSwordsEn = ImageAsset(name: "tenOfSwords_en")
    internal static let tenOfWandsEn = ImageAsset(name: "tenOfWands_en")
    internal static let threeOfCupsEn = ImageAsset(name: "threeOfCups_en")
    internal static let threeOfPentaclesEn = ImageAsset(name: "threeOfPentacles_en")
    internal static let threeOfSwordsEn = ImageAsset(name: "threeOfSwords_en")
    internal static let threeOfWandsEn = ImageAsset(name: "threeOfWands_en")
    internal static let twoOfCupsEn = ImageAsset(name: "twoOfCups_en")
    internal static let twoOfPentaclesEn = ImageAsset(name: "twoOfPentacles_en")
    internal static let twoOfSwordsEn = ImageAsset(name: "twoOfSwords_en")
    internal static let twoOfWandsEn = ImageAsset(name: "twoOfWands_en")
    internal static let aceOfCupsRu = ImageAsset(name: "aceOfCups_ru")
    internal static let aceOfPentaclesRu = ImageAsset(name: "aceOfPentacles_ru")
    internal static let aceOfSwordsRu = ImageAsset(name: "aceOfSwords_ru")
    internal static let aceOfWandsRu = ImageAsset(name: "aceOfWands_ru")
    internal static let eightOfCupsRu = ImageAsset(name: "eightOfCups_ru")
    internal static let eightOfPentaclesRu = ImageAsset(name: "eightOfPentacles_ru")
    internal static let eightOfSwordsRu = ImageAsset(name: "eightOfSwords_ru")
    internal static let eightOfWandsRu = ImageAsset(name: "eightOfWands_ru")
    internal static let fiveOfCupsRu = ImageAsset(name: "fiveOfCups_ru")
    internal static let fiveOfPentaclesRu = ImageAsset(name: "fiveOfPentacles_ru")
    internal static let fiveOfSwordsRu = ImageAsset(name: "fiveOfSwords_ru")
    internal static let fiveOfWandsRu = ImageAsset(name: "fiveOfWands_ru")
    internal static let fourOfCupsRu = ImageAsset(name: "fourOfCups_ru")
    internal static let fourOfPentaclesRu = ImageAsset(name: "fourOfPentacles_ru")
    internal static let fourOfSwordsRu = ImageAsset(name: "fourOfSwords_ru")
    internal static let fourOfWandsRu = ImageAsset(name: "fourOfWands_ru")
    internal static let nineOfCupsRu = ImageAsset(name: "nineOfCups_ru")
    internal static let nineOfPentaclesRu = ImageAsset(name: "nineOfPentacles_ru")
    internal static let nineOfSwordsRu = ImageAsset(name: "nineOfSwords_ru")
    internal static let nineOfWandsRu = ImageAsset(name: "nineOfWands_ru")
    internal static let sevenOfCupsRu = ImageAsset(name: "sevenOfCups_ru")
    internal static let sevenOfPentaclesRu = ImageAsset(name: "sevenOfPentacles_ru")
    internal static let sevenOfSwordsRu = ImageAsset(name: "sevenOfSwords_ru")
    internal static let sevenOfWandsRu = ImageAsset(name: "sevenOfWands_ru")
    internal static let sixOfCupsRu = ImageAsset(name: "sixOfCups_ru")
    internal static let sixOfPentaclesRu = ImageAsset(name: "sixOfPentacles_ru")
    internal static let sixOfSwordsRu = ImageAsset(name: "sixOfSwords_ru")
    internal static let sixOfWandsRu = ImageAsset(name: "sixOfWands_ru")
    internal static let tenOfCupsRu = ImageAsset(name: "tenOfCups_ru")
    internal static let tenOfPentaclesRu = ImageAsset(name: "tenOfPentacles_ru")
    internal static let tenOfSwordsRu = ImageAsset(name: "tenOfSwords_ru")
    internal static let tenOfWandsRu = ImageAsset(name: "tenOfWands_ru")
    internal static let threeOfCupsRu = ImageAsset(name: "threeOfCups_ru")
    internal static let threeOfPentaclesRu = ImageAsset(name: "threeOfPentacles_ru")
    internal static let threeOfSwordsRu = ImageAsset(name: "threeOfSwords_ru")
    internal static let threeOfWandsRu = ImageAsset(name: "threeOfWands_ru")
    internal static let twoOfCupsRu = ImageAsset(name: "twoOfCups_ru")
    internal static let twoOfPentaclesRu = ImageAsset(name: "twoOfPentacles_ru")
    internal static let twoOfSwordsRu = ImageAsset(name: "twoOfSwords_ru")
    internal static let twoOfWandsRu = ImageAsset(name: "twoOfWands_ru")
    internal static let kingOfCupsNFT = ImageAsset(name: "kingOfCupsNFT")
    internal static let kingOfPentaclesNFT = ImageAsset(name: "kingOfPentaclesNFT")
    internal static let kingOfSwordsNFT = ImageAsset(name: "kingOfSwordsNFT")
    internal static let kingOfWandsNFT = ImageAsset(name: "kingOfWandsNFT")
    internal static let knightOfCupsNFT = ImageAsset(name: "knightOfCupsNFT")
    internal static let knightOfPentaclesNFT = ImageAsset(name: "knightOfPentaclesNFT")
    internal static let knightOfSwordsNFT = ImageAsset(name: "knightOfSwordsNFT")
    internal static let knightOfWandsNFT = ImageAsset(name: "knightOfWandsNFT")
    internal static let pageOfCupsNFT = ImageAsset(name: "pageOfCupsNFT")
    internal static let pageOfPentaclesNFT = ImageAsset(name: "pageOfPentaclesNFT")
    internal static let pageOfSwordsNFT = ImageAsset(name: "pageOfSwordsNFT")
    internal static let pageOfWandsNFT = ImageAsset(name: "pageOfWandsNFT")
    internal static let queenOfCupsNFT = ImageAsset(name: "queenOfCupsNFT")
    internal static let queenOfPentaclesNFT = ImageAsset(name: "queenOfPentaclesNFT")
    internal static let queenOfSwordsNFT = ImageAsset(name: "queenOfSwordsNFT")
    internal static let queenOfWandsNFT = ImageAsset(name: "queenOfWandsNFT")
    internal static let chariotCardNFT = ImageAsset(name: "chariotCardNFT")
    internal static let deathCardNFT = ImageAsset(name: "deathCardNFT")
    internal static let devilCardNFT = ImageAsset(name: "devilCardNFT")
    internal static let doomsdayCardNFT = ImageAsset(name: "doomsdayCardNFT")
    internal static let emperorCardNFT = ImageAsset(name: "emperorCardNFT")
    internal static let empressCardNFT = ImageAsset(name: "empressCardNFT")
    internal static let foolNFT = ImageAsset(name: "foolNFT")
    internal static let hangedCardNFT = ImageAsset(name: "hangedCardNFT")
    internal static let hermitCardNFT = ImageAsset(name: "hermitCardNFT")
    internal static let hierophantCardNFT = ImageAsset(name: "hierophantCardNFT")
    internal static let highpriestessCardNFT = ImageAsset(name: "highpriestessCardNFT")
    internal static let justiceCardNFT = ImageAsset(name: "justiceCardNFT")
    internal static let lovesCardNFT = ImageAsset(name: "lovesCardNFT")
    internal static let magicianCardNFT = ImageAsset(name: "magicianCardNFT")
    internal static let moderationCardNFT = ImageAsset(name: "moderationCardNFT")
    internal static let moonCardNFT = ImageAsset(name: "moonCardNFT")
    internal static let starCardNFT = ImageAsset(name: "starCardNFT")
    internal static let strengthCardNFT = ImageAsset(name: "strengthCardNFT")
    internal static let sunCardNFT = ImageAsset(name: "sunCardNFT")
    internal static let towerCardNFT = ImageAsset(name: "towerCardNFT")
    internal static let wheelOfFortuneNFT = ImageAsset(name: "wheelOfFortuneNFT")
    internal static let worldCardNFT = ImageAsset(name: "worldCardNFT")
    internal static let aceOfCupsNFT = ImageAsset(name: "aceOfCupsNFT")
    internal static let aceOfPentaclesNFT = ImageAsset(name: "aceOfPentaclesNFT")
    internal static let aceOfSwordsNFT = ImageAsset(name: "aceOfSwordsNFT")
    internal static let aceOfWandsNFT = ImageAsset(name: "aceOfWandsNFT")
    internal static let eightOfCupsNFT = ImageAsset(name: "eightOfCupsNFT")
    internal static let eightOfPentaclesNFT = ImageAsset(name: "eightOfPentaclesNFT")
    internal static let eightOfSwordsNFT = ImageAsset(name: "eightOfSwordsNFT")
    internal static let eightOfWandsNFT = ImageAsset(name: "eightOfWandsNFT")
    internal static let fiveOfCupsNFT = ImageAsset(name: "fiveOfCupsNFT")
    internal static let fiveOfPentaclesNFT = ImageAsset(name: "fiveOfPentaclesNFT")
    internal static let fiveOfSwordsNFT = ImageAsset(name: "fiveOfSwordsNFT")
    internal static let fiveOfWandsNFT = ImageAsset(name: "fiveOfWandsNFT")
    internal static let fourOfCupsNFT = ImageAsset(name: "fourOfCupsNFT")
    internal static let fourOfPentaclesNFT = ImageAsset(name: "fourOfPentaclesNFT")
    internal static let fourOfSwordsNFT = ImageAsset(name: "fourOfSwordsNFT")
    internal static let fourOfWandsNFT = ImageAsset(name: "fourOfWandsNFT")
    internal static let nineOfCupsNFT = ImageAsset(name: "nineOfCupsNFT")
    internal static let nineOfPentaclesNFT = ImageAsset(name: "nineOfPentaclesNFT")
    internal static let nineOfSwordsNFT = ImageAsset(name: "nineOfSwordsNFT")
    internal static let nineOfWandsNFT = ImageAsset(name: "nineOfWandsNFT")
    internal static let sevenOfCupsNFT = ImageAsset(name: "sevenOfCupsNFT")
    internal static let sevenOfPentaclesNFT = ImageAsset(name: "sevenOfPentaclesNFT")
    internal static let sevenOfSwordsNFT = ImageAsset(name: "sevenOfSwordsNFT")
    internal static let sevenOfWandsNFT = ImageAsset(name: "sevenOfWandsNFT")
    internal static let sixOfCupsNFT = ImageAsset(name: "sixOfCupsNFT")
    internal static let sixOfPentaclesNFT = ImageAsset(name: "sixOfPentaclesNFT")
    internal static let sixOfSwordsNFT = ImageAsset(name: "sixOfSwordsNFT")
    internal static let sixOfWandsNFT = ImageAsset(name: "sixOfWandsNFT")
    internal static let tenOfCupsNFT = ImageAsset(name: "tenOfCupsNFT")
    internal static let tenOfPentaclesNFT = ImageAsset(name: "tenOfPentaclesNFT")
    internal static let tenOfSwordsNFT = ImageAsset(name: "tenOfSwordsNFT")
    internal static let tenOfWandsNFT = ImageAsset(name: "tenOfWandsNFT")
    internal static let threeOfCupsNFT = ImageAsset(name: "threeOfCupsNFT")
    internal static let threeOfPentaclesNFT = ImageAsset(name: "threeOfPentaclesNFT")
    internal static let threeOfSwordsNFT = ImageAsset(name: "threeOfSwordsNFT")
    internal static let threeOfWandsNFT = ImageAsset(name: "threeOfWandsNFT")
    internal static let twoOfCupsNFT = ImageAsset(name: "twoOfCupsNFT")
    internal static let twoOfPentaclesNFT = ImageAsset(name: "twoOfPentaclesNFT")
    internal static let twoOfSwordsNFT = ImageAsset(name: "twoOfSwordsNFT")
    internal static let twoOfWandsNFT = ImageAsset(name: "twoOfWandsNFT")
    internal static let _0000 = ImageAsset(name: "00:00")
    internal static let _0101 = ImageAsset(name: "01:01")
    internal static let _0202 = ImageAsset(name: "02:02")
    internal static let _0303 = ImageAsset(name: "03:03")
    internal static let _0404 = ImageAsset(name: "04:04")
    internal static let _0505 = ImageAsset(name: "05:05")
    internal static let _0606 = ImageAsset(name: "06:06")
    internal static let _0707 = ImageAsset(name: "07:07")
    internal static let _0808 = ImageAsset(name: "08:08")
    internal static let _0909 = ImageAsset(name: "09:09")
    internal static let _1010 = ImageAsset(name: "10:10")
    internal static let _1111 = ImageAsset(name: "11:11")
    internal static let _1212 = ImageAsset(name: "12:12")
    internal static let _1313 = ImageAsset(name: "13:13")
    internal static let _1414 = ImageAsset(name: "14:14")
    internal static let _1515 = ImageAsset(name: "15:15")
    internal static let _1616 = ImageAsset(name: "16:16")
    internal static let _1717 = ImageAsset(name: "17:17")
    internal static let _1818 = ImageAsset(name: "18:18")
    internal static let _1919 = ImageAsset(name: "19:19")
    internal static let _2020 = ImageAsset(name: "20:20")
    internal static let _2121 = ImageAsset(name: "21:21")
    internal static let _2222 = ImageAsset(name: "22:22")
    internal static let _2323 = ImageAsset(name: "23:23")
    internal static let background = ImageAsset(name: "background")
    internal static let addquestion = ImageAsset(name: "addquestion")
    internal static let angelNumbers = ImageAsset(name: "angelNumbers")
    internal static let back = ImageAsset(name: "back")
    internal static let burger = ImageAsset(name: "burger")
    internal static let burger1 = ImageAsset(name: "burger1")
    internal static let burger2 = ImageAsset(name: "burger2")
    internal static let buyCards = ImageAsset(name: "buyCards")
    internal static let description = ImageAsset(name: "description")
    internal static let edit = ImageAsset(name: "edit")
    internal static let highPriecess = ImageAsset(name: "highPriecess")
    internal static let home = ImageAsset(name: "home")
    internal static let loadImageButton = ImageAsset(name: "loadImageButton")
    internal static let manProfile = ImageAsset(name: "manProfile")
    internal static let notes = ImageAsset(name: "notes")
    internal static let playerPlay = ImageAsset(name: "playerPlay")
    internal static let preservation = ImageAsset(name: "preservation")
    internal static let profileIcon = ImageAsset(name: "profileIcon")
    internal static let question = ImageAsset(name: "question")
    internal static let settings = ImageAsset(name: "settings")
    internal static let soundOff = ImageAsset(name: "soundOff")
    internal static let soundOn = ImageAsset(name: "soundOn")
    internal static let tarotSpreads = ImageAsset(name: "tarotSpreads")
    internal static let video = ImageAsset(name: "video")
    internal static let womenProfile = ImageAsset(name: "womenProfile")
    internal static let collection = ImageAsset(name: "collection")
    internal static let background2 = ImageAsset(name: "background2")
    internal static let button = ImageAsset(name: "button")
    internal static let grayPlayButton = ImageAsset(name: "gray-play-button")
    internal static let splashScreenCircle = ImageAsset(name: "splashScreenCircle")
    internal static let stars35 = ImageAsset(name: "stars_3_5")
    internal static let stars4 = ImageAsset(name: "stars_4")
    internal static let stars45 = ImageAsset(name: "stars_4_5")
    internal static let stars5 = ImageAsset(name: "stars_5")
    internal static let tv = ImageAsset(name: "tv")
    internal static let facebook = ImageAsset(name: "facebook")
    internal static let instagram = ImageAsset(name: "instagram")
    internal static let telegram = ImageAsset(name: "telegram")
    internal static let tiktok = ImageAsset(name: "tiktok")
    internal static let youtube = ImageAsset(name: "youtube")
    internal static let zen = ImageAsset(name: "zen")
    internal static let israelKamakawiwoole = ImageAsset(name: "Israel-Kamakawiwoole")
    internal static let emptyProfile = ImageAsset(name: "emptyProfile")
    internal static let shirt = ImageAsset(name: "shirt")
    internal static let angelsTabBar = ImageAsset(name: "angelsTabBar")
    internal static let mainTabBar = ImageAsset(name: "mainTabBar")
    internal static let tarotTabBar = ImageAsset(name: "tarotTabBar")
    internal static let videoTabBar = ImageAsset(name: "videoTabBar")
    internal static let _01finance = ImageAsset(name: "01finance")
    internal static let _02everyday = ImageAsset(name: "02everyday")
    internal static let _03lovely = ImageAsset(name: "03lovely")
    internal static let _04choise = ImageAsset(name: "04choise")
    internal static let _05health = ImageAsset(name: "05health")
    internal static let _06personalgrowth = ImageAsset(name: "06personalgrowth")
    internal static let _07situation = ImageAsset(name: "07situation")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
