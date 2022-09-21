import UIKit
import Foundation

var greeting = "Hello, playground"

let dateString = "2019-02-24 04:04:17.566515"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

let date = dateFormatter.date(from: dateString)
