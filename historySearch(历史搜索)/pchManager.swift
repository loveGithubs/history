//
//  pchManager.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit

let kscreenw:CGFloat = UIScreen.main.bounds.size.width
let kscreenh:CGFloat = UIScreen.main.bounds.size.height
let isIphone:Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
let isIphoneX:Bool = (isIphone && UIApplication.shared.statusBarFrame.size.height >= 44)
let ksafeBottom:CGFloat = (isIphoneX ? 34.0 : 0.0)
let kNavBarH:CGFloat = (isIphoneX ? 88.0 : 64.0)
let kTabbarH:CGFloat = (isIphoneX ? 83.0 : 49.0)
let kSafeHeightTopBar:CGFloat = (isIphoneX ? 44.0 : 20)
let Ratio:CGFloat = kscreenw/375.0
