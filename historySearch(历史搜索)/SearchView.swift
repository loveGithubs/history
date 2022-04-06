//
//  SearchView.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit
class SearchView: UIView,UITextFieldDelegate {
    
    var viewModel:SearchViewModel?
    //闭包传值
    var returnSearchContent : ((String)->())?
    lazy var textfield: UITextField = {
        let tfield = UITextField.init(frame: CGRect(x: 30, y: kSafeHeightTopBar+0.5*(kNavBarH-kSafeHeightTopBar-30), width: kscreenw-120, height: 30))
        tfield.backgroundColor = .white
        tfield.placeholder = "请输入搜索内容"
        tfield.layer.cornerRadius = 0.5*30
        tfield.layer.masksToBounds = true
        tfield.font = .systemFont(ofSize: 14)
        tfield.returnKeyType = .search
        tfield.delegate = self
        tfield.clearButtonMode = .whileEditing
        let leftv = UIView(frame: CGRect(x: 0, y:0, width: 10, height: 30))
        tfield.leftView = leftv
        tfield.leftViewMode = .always
        return tfield
    }()
    lazy var searchBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: kscreenw-60, y: kSafeHeightTopBar, width: 40, height: kNavBarH-kSafeHeightTopBar)
        btn.setTitle("搜索", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(searchBtnTap(btn:)), for: .touchUpInside)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textfield)
        addSubview(searchBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     搜索按钮点击
     */
    @objc func searchBtnTap(btn: UIButton) {
        textfield.resignFirstResponder()
        viewModel?.startSearch(text: textfield.text ?? "")
    }
    //点击键盘搜索时调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        viewModel?.startSearch(text: textfield.text ?? "")
        return true
    }
    
}

