//
//  UIColor+Hex.swift
//  swiftLaunch
//
//  Created by xin wei on 2021/1/19.
//

import Foundation
import UIKit


extension UIColor{
    
    class func colorWithHexString(color:String,alpha:CGFloat)-> UIColor{
        //删除字符串中的空格
        var cString : String = color.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if cString.count<6 {
            return UIColor.clear
        }
        if cString.hasPrefix("0X") {
            let temstr:NSString = cString as NSString
            cString = temstr.substring(from: 2) as String
        }
        if cString.hasPrefix("#") {
            let temstr:NSString = cString as NSString
            cString = temstr.substring(from: 1) as String
        }
        if cString.count != 6 {
            return UIColor.clear
        }
        var range:NSRange = NSMakeRange(0,2)
        let temstr2:NSString = cString as NSString
        let rString = temstr2.substring(with: range) as String
        range = NSMakeRange(2,2)
        let gString = temstr2.substring(with: range) as String
        range = NSMakeRange(4,2)
        let bString = temstr2.substring(with: range) as String
        var r:UInt32 = 0 , g:UInt32 = 0 , b:UInt32 = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    class func colorWithHexString(color:String)-> UIColor{
        return colorWithHexString(color: color, alpha: 1.0)
    }
    
    class func colorWithRgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat)->UIColor{
        return self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    class func colorWithRgbAlpha(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ alpha:CGFloat)->UIColor{
        return self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    /*RGB三原色*/
//    35 convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
//    36     self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
//    37 }
}
