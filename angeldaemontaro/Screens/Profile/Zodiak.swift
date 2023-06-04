//
//  Zodiak.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 4.06.23.
//

import Foundation

enum Zodiac: String {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
}

extension Zodiac {
    var foo: ((Int, Int), (Int, Int)) {
        switch self {
        case .aries:
            return ((3, 21), (4, 19))
        case .taurus:
            return ((4, 20), (5, 20))
        case .gemini:
            return ((5, 21), (6, 20))
        case .cancer:
            return ((6, 21), (7, 22))
        case .leo:
            return ((7, 23), (8, 22))
        case .virgo:
            return ((8, 23), (9, 22))
        case .libra:
            return ((9, 23), (10, 22))
        case .scorpio:
            return ((10, 23), (11, 21))
        case .sagittarius:
            return ((11, 22), (12, 21))
        case .capricorn:
            return ((12, 22), (1, 19))
        case .aquarius:
            return ((1, 20), (2, 18))
        case .pisces:
            return ((2, 19), (3, 20))
        }
    }
    
    func getRange(now: Date) -> ClosedRange<Date> {
        var cc1 = Calendar.current.dateComponents(in: .current, from: now)
        var cc2 = cc1

        cc1.month = foo.0.0
        cc1.day = foo.0.1
        cc2.month = foo.1.0
        cc2.day = foo.1.1

        if self == .capricorn {
            if now >= cc1.date! {
                cc2.year! += 1
                cc2.yearForWeekOfYear = nil  // or CRASH!
            } else {
                cc1.year! -= 1
                cc1.yearForWeekOfYear = nil
            }
        }

        return cc1.date!...cc2.date!
    }
    
    var dateRangeString: String {
        let df = DateFormatter()
        df.dateFormat = "MMM d"
        let from = df.string(from: dateRange.lowerBound)
        let to = df.string(from: dateRange.upperBound)
        return "\(from) - \(to)"
    }

    var dateRange: ClosedRange<Date> {
        let now = Date()
        var cc1 = Calendar.current.dateComponents(in: .current, from: now)
        var cc2 = cc1

        cc1.month = foo.0.0
        cc1.day = foo.0.1
        cc2.month = foo.1.0
        cc2.day = foo.1.1

        if self == .capricorn {
            if now >= cc1.date! {
                cc2.year! += 1
                cc2.yearForWeekOfYear = nil  // or CRASH!
            } else {
                cc1.year! -= 1
                cc1.yearForWeekOfYear = nil
            }
        }

        return cc1.date!...cc2.date!
    }

    static var today: Zodiac {
        let today = Date()
        let all = [Zodiac.aries, .taurus, .gemini, .cancer, .leo, .virgo, .libra, .scorpio, .sagittarius, .capricorn, .aquarius, .pisces]
        for sign in all {
            if sign.dateRange.contains(today) {
                return sign
            }
        }
        return .taurus  // only possible if there's a bug in our code
    }
}
