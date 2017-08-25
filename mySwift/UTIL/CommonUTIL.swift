//
//  CommonUTIL.swift
//  mySwift
//
//  Created by jinhongstar on 2017. 8. 21..
//  Copyright © 2017년 jinhongstar. All rights reserved.
//

import Foundation
import UIKit


public extension String {
	func isEqualToString(find: String) -> Bool {
		return String(format: self) == find
	}
}

public extension UIDevice {
	
	var modelName: String {
		var systemInfo = utsname()
		uname(&systemInfo)
		let machineMirror = Mirror(reflecting: systemInfo.machine)
		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8, value != 0 else { return identifier }
			return identifier + String(UnicodeScalar(UInt8(value)))
		}
		
		switch identifier {
		case "iPod5,1":                                 return "iPod Touch 5"
		case "iPod7,1":                                 return "iPod Touch 6"
		case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
		case "iPhone4,1":                               return "iPhone 4s"
		case "iPhone5,1", "iPhone5,2", "iPhone5,3",
		     "iPhone5,4", "iPhone6,1", "iPhone6,2":     return "iPhone 5"
			
		case "iPhone9,1", "iPhone9,3","iPhone8,1",
		     "iPhone7,2":								return "iPhone 7"

		case "iPhone8,2",  "iPhone7,1","iPhone9,2",
		     "iPhone9,4":								return "iPhone 7 Plus"
		
		case "iPhone8,4":                               return "iPhone SE"
		case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
		case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
		case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
		case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
		case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
		case "iPad6,11", "iPad6,12":                    return "iPad 5"
		case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
		case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
		case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
		case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
		case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
		case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
		case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
		case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
		case "AppleTV5,3":                              return "Apple TV"
		case "i386", "x86_64":                          return "Simulator"
		default:                                        return identifier
		}
	}
	
}

class CommonUTIL: NSObject{

	func randomInt(maxNumber :Int) -> Int {
		
		let randomNum:UInt32 = arc4random_uniform(UInt32(maxNumber))
		let someInt:Int = Int(randomNum)
		
		return someInt
	}
	
	func UIColorFromRGB(rgbValue: UInt) -> UIColor {
		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
	
	

	
}
