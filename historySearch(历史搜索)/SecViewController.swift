//
//  SecViewController.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit

class SecViewController: UIViewController {

//    lazy var backBtn : UIButton = {
//        let btn = UIButton()
//        btn.frame = CGRect(x: 10, y: kSafeHeightTopBar, width: kNavBarH-kSafeHeightTopBar, height: kNavBarH-kSafeHeightTopBar)
//        btn.setImage(.init(named: "backWhiteArrow"), for: .normal)
//        btn.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
//        return btn
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        view.addSubview(backBtn)
    }
    
    @objc func popToVC() {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
