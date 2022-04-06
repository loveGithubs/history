//
//  HistoryView.swift
//  historySearch(历史搜索)
//
//  Created by xin wei on 2022/1/25.
//

import UIKit
class HistoryView: UIView {
    lazy var hotLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 30, width: 100, height: 40))
        label.text = "热门搜索"
        label.textColor = .colorWithHexString(color: "333333")
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    let hotView = UIView()
    lazy var hisLabel: UILabel = {
        let label = UILabel()
        label.text = "历史搜索"
        label.textColor = .colorWithHexString(color: "333333")
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    lazy var deletBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(.init(named: "delet"), for: .normal)
        btn.addTarget(self, action: #selector(deletHistory), for: .touchUpInside)
        return btn
    }()
    let historyv = UIView()
    
    private var temModel = SearchViewModel()
    var viewModel:SearchViewModel{
        set {
            temModel = newValue
            weak var weakself = self
            temModel.updateHistoryV = {
                () in
                weakself?.updateHistoryView()
            }
        }
        get {
            temModel
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hotLabel)
        addSubview(hotView)
        //添加热门搜索
        let hotArr = ["桂花","紫薇花","月季","玫瑰","茉莉花","紫茉莉","锦带花","长春花","梅花"]
        let temheight = addLabelWithArr(bgView: hotView, arr: hotArr, tag: 1000)
        hotView.frame = CGRect(x: 0, y: hotLabel.frame.maxY+10, width: kscreenw, height: temheight)
        hisLabel.frame = CGRect(x: 20, y: hotView.frame.maxY+10, width: 100, height: 40)
        deletBtn.frame = CGRect(x: kscreenw-60, y: hisLabel.frame.origin.y, width: 40, height: 40)
        //历史搜索
        addSubview(hisLabel)
        addSubview(deletBtn)
        addSubview(historyv)
        historyv.frame = CGRect(x: 0, y: hisLabel.frame.maxY+10, width: kscreenw, height: 0)
        updateHistoryView()
    }
    
    func updateHistoryView() {
        for label in historyv.subviews {
            if label.tag == 1001 {
                label.removeFromSuperview()
            }
        }
        let historyh = addLabelWithArr(bgView: historyv, arr: viewModel.historyArr, tag: 1001)
        historyv.frame = CGRect(x: 0, y: hisLabel.frame.maxY+10, width: kscreenw, height: historyh)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addLabelWithArr(bgView: UIView, arr: [String], tag: Int) -> CGFloat{
        if arr.count < 1 {
            return 0
        }
        var orgSize = CGSize(width: 20, height: 0)
        for i in 0..<arr.count {
            let str = arr[i]
            let label = UILabel()
            label.tag = tag
            label.textColor = .white
            label.font = .systemFont(ofSize: 16)
            label.backgroundColor = .orange
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 14
            label.textAlignment = .center
            label.text = str
            orgSize = label.nextSizeAndCurFrame(size: orgSize)
            bgView.addSubview(label)
            label.isUserInteractionEnabled = true
            let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(labelClick(tap:)))
            label.addGestureRecognizer(tap)
        }
        let totalh = orgSize.height+40
        return totalh
    }
    
    @objc func labelClick(tap: UITapGestureRecognizer) {
        let label = tap.view as? UILabel
        viewModel.startSearch(text: label?.text)
    }
    @objc func deletHistory() {
        viewModel.clearhistory()
    }
    deinit {
        print("historyView deinit")
    }
    
}

private extension UILabel {
    func nextSizeAndCurFrame(size: CGSize) -> CGSize{
        let strSize = text?.getStringSize(font: font, viewSize: CGSize(width: kscreenw-40, height: CGFloat(MAXFLOAT)))
        let orW = size.width
        var labelw: CGFloat = 0
        if let wid = strSize?.width {
            labelw = wid + 20
        }
        let spaceX: CGFloat = 20
        let spaceY: CGFloat = 10
        let labelh: CGFloat = 26
        var newSize = CGSize.zero
        if orW+labelw > kscreenw-40 {
            //换行
            frame = CGRect(x: spaceX, y: size.height+labelh+spaceY, width: labelw, height: labelh)
            //2*spaceX+labelw代表换行后label左侧间距spacex+右侧间距也是spaxex+labelw
            newSize = CGSize(width: 2*spaceX+labelw, height: size.height+labelh+spaceY)
            
        }else {
            frame = CGRect(x: orW, y: size.height, width: labelw, height: labelh)
            newSize = CGSize(width: orW+spaceX+labelw, height: size.height)
        }
        return newSize
    }
}

private extension String {
    //获取文字的宽高
    func getStringSize(font: UIFont, viewSize: CGSize) -> CGSize {
        let rect = self.boundingRect(with: viewSize, options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine,.usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.size
    }
}

