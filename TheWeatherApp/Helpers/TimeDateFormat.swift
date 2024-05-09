import Foundation
import UIKit

func formattedTime(hourString: String) -> String {
    if let hourInt = Int(hourString) {
        return String(format: "%02d:00", hourInt)
    } else {
        return "00:00"
    }
}

func attributedDateString(daysToAdd: Int) -> NSAttributedString {
    let now = Date()
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "dd/MM"
    
    guard let futureDate = calendar.date(byAdding: .day, value: daysToAdd, to: now) else { return NSAttributedString() }
    
    let font = UIFont.rubik(.regular, size: 16)
    let textColor = UIColor.customGray
    
    let attributedString = NSMutableAttributedString(string: dateFormatter.string(from: futureDate), attributes: [
        .font: font,
        .foregroundColor: textColor,
        .kern: 0.16
    ])
    
    return attributedString
}

func attributedDateString() -> NSAttributedString {
    let now = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "E dd/MM"
    
    var dateString = dateFormatter.string(from: now)
    dateString = dateString.capitalizingFirstLetter()
    
    let font = UIFont.rubik(.medium, size: 18)
    let textColor = UIColor.customBlack
    
    let attributedString = NSMutableAttributedString(string: dateString, attributes: [
        .font: font,
        .foregroundColor: textColor,
        .kern: 0.16
    ])
    
    return attributedString
}

func attributedCurrentDateTime() -> NSAttributedString {
    let now = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "HH:mm, EEE d MMMM"
    
    let font = UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    let textColor = UIColor.customYellow
    
    let attributedString = NSMutableAttributedString(string: dateFormatter.string(from: now), attributes: [
        .font: font,
        .foregroundColor: textColor,
        .kern: 0.14
    ])
    return attributedString
}

func generateDateRange() -> [String] {
    var dates: [String] = []
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "dd/MM EEE"
    
    for i in 0..<7 {
        if let date = calendar.date(byAdding: .day, value: i, to: Date()) {
            let dateString = dateFormatter.string(from: date)
            let capitalizedDateString = dateString.uppercased()
            dates.append(capitalizedDateString)
        }
    }
    return dates
}
