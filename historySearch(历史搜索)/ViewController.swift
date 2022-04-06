//
//  ViewController.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = SearchViewModel()
    lazy var searchv: SearchView = {
       let search = SearchView(frame: CGRect(x: 0, y: 0, width: kscreenw, height: kNavBarH))
        search.backgroundColor = .orange
        return search
    }()
    lazy var historyv: HistoryView = {
       let history = HistoryView(frame: CGRect(x: 0, y: kNavBarH, width: kscreenw, height: kscreenh-kNavBarH))
        history.backgroundColor = .white
        return history
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(searchv)
        view.addSubview(historyv)
        searchv.viewModel = viewModel
        historyv.viewModel = viewModel
        weak var weakself = self
        viewModel.searchHistoryBlock = {
            searchStr in
            print("搜索的内容",searchStr)
            weakself?.navigationController?.pushViewController(SecViewController(), animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        viewModel.saveHistoryArr()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
