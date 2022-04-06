//
//  SearchViewModel.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/29.
//

import UIKit

class SearchViewModel: NSObject {
    private let maxHistoryLength: Int = 10//根据需求设置最多展示历史记录总数
     //获取之前的历史记录,搜索文本时调用
    lazy var historyArr: [String] = {
        if var temhistoryArr = UserDefaults.standard.object(forKey: "historyArrDefault") as? [String] {
            return temhistoryArr
        }
        return [String]()
    }()
    var searchHistoryBlock: ((String)->())?
    var updateHistoryV: (()->())? //刷新historyView
    func startSearch(text: String?){
        if let str = text,str.count > 0 {
            //判断是否有重复的，有则移除以前的
            if historyArr.contains(str) {
                historyArr.removeAll{
                    $0 == str
                }
            }
            //大于限制，移除最后一条
            if historyArr.count > maxHistoryLength-1 {
                historyArr.removeLast()
            }
            //新增
            historyArr.insert(str, at: 0)
            updateHistoryV?()
            searchHistoryBlock?(str)
        }
    }
    
    //当前页面即将消失，存储历史搜索记录到缓存,可用NSUserDefault、归档、plist、splite等
    func saveHistoryArr() {
        UserDefaults.standard.set(historyArr, forKey: "historyArrDefault")
        UserDefaults.standard.synchronize()
    }
    
    //清空历史记录
    func clearhistory() {
        historyArr = [String]()
        saveHistoryArr()
        updateHistoryV?()
    }
    
}
