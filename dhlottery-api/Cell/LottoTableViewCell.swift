//
//  LottoTableViewCell.swift
//  dhlottery-api
//
//  Created by junehee on 6/7/24.
//

import UIKit
import SnapKit

class LottoTableViewCell: UITableViewCell {
    
    let resultTextLabel = UILabel()
    
    let drwtNumsStack = UIStackView()
    var drwtNo1Label = UILabel()
    var drwtNo2Label = UILabel()
    var drwtNo3Label = UILabel()
    var drwtNo4Label = UILabel()
    var drwtNo5Label = UILabel()
    var drwtNo6Label = UILabel()
    
    let plusLabel = UILabel()
    
    var bnusNoLabel = UILabel()
    let bnusNoText = UILabel()

    var lottoResultStack = UIStackView()
    var lottoResultViews: [Any] = []
    
    
    var numsViews: [UILabel] = []
    
    // Lotto Data
//    var lottoData: [Lotto] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCellHierarchy()
        configureCellLayout()
        configureCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func configureCellHierarchy() {
        numsViews = [
            drwtNo1Label, drwtNo2Label, drwtNo3Label,
            drwtNo4Label, drwtNo5Label, drwtNo6Label,
            plusLabel, bnusNoLabel
        ]
        
        numsViews.forEach {
            drwtNumsStack.addArrangedSubview($0)
        }
        drwtNumsStack.axis = .horizontal
        drwtNumsStack.alignment = .center
        drwtNumsStack.distribution = .fillEqually
        drwtNumsStack.spacing = 4
        
        let subviews = [resultTextLabel, drwtNumsStack]
        subviews.forEach {
            contentView.addSubview($0)
        }
    }
    
    func configureCellLayout() {
        // "000회 당첨 결과"
        resultTextLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
        }
        
        // 당첨 결과 스택
        drwtNumsStack.snp.makeConstraints { make in
            make.top.equalTo(resultTextLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(50)
        }
        
        // 당첨 결과 요소들
        // [drwtNo1Label, drwtNo2Label, drwtNo3Label, drwtNo4Label, drwtNo5Label, drwtNo6Label, plusLabel, bnusNoLabel]
        numsViews.forEach {
            $0.snp.makeConstraints { make in
                make.size.equalTo(contentView.snp.height)
            }
        }
    }
    
    func configureCellUI() {
        resultTextLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        resultTextLabel.textAlignment = .center
        resultTextLabel.backgroundColor = .clear
        resultTextLabel.layer.borderColor = UIColor.clear.cgColor
        
        drwtNumsStack.backgroundColor = .clear
        
        numsViews.forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.backgroundColor = Color.randomBgColor()
        }
        
        plusLabel.textColor = .black
        plusLabel.textAlignment = .center
        plusLabel.backgroundColor = .clear
    }
    
    func configureCellData(data: [Lotto]) {
        print("Cell: 로또 데이터 확인", data)
        
        resultTextLabel.text = "913회 당첨결과"
        
        drwtNo1Label.text = "6"
        drwtNo2Label.text = "14"
        drwtNo3Label.text = "16"
        drwtNo4Label.text = "21"
        drwtNo5Label.text = "27"
        drwtNo6Label.text = "37"
        
        plusLabel.text = "+"
        
        bnusNoLabel.text = "40"
        bnusNoText.text = "보너스"
    }

}
