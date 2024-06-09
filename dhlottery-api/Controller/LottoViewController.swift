//
//  ViewController.swift
//  dhlottery-api
//
//  Created by junehee on 6/7/24.
//

import UIKit

import Alamofire
import SnapKit

class LottoViewController: UIViewController {
    
    let picker = UIPickerView()
    let pickerField = UITextField()
    
    let lottoInfoStack = UIStackView()
    
    let numberInfoLabel = UILabel()
    var dateInfoLabel = UILabel()
    
    let lottoTableView = UITableView()
    
    // pickerView 데이터
    var lottoData: [Lotto] = []
    var recentDrwNo = "1122"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureData()
        setBarBtnItem()
        callRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pickerField.tintColor = .clear
    }
    
    func configureHierarchy() {
        let subviews = [pickerField, lottoInfoStack, lottoTableView]
        subviews.forEach {
            view.addSubview($0)
        }
        
        let infoViews = [numberInfoLabel, dateInfoLabel]
        infoViews.forEach {
            lottoInfoStack.addArrangedSubview($0)
        }
        
        lottoTableView.delegate = self
        lottoTableView.dataSource = self
        lottoTableView.register(LottoTableViewCell.self, forCellReuseIdentifier: LottoTableViewCell.id)
        
        picker.delegate = self
        pickerField.inputView = picker
        
        navigationController?.isToolbarHidden = false
    }

    func configureLayout() {
        pickerField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(44)
        }
        
        lottoInfoStack.snp.makeConstraints { make in
            make.top.equalTo(pickerField.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        lottoTableView.snp.makeConstraints { make in
            make.top.equalTo(lottoInfoStack.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        pickerField.font = .systemFont(ofSize: 16)
        pickerField.borderStyle = .roundedRect
        pickerField.textAlignment = .center
        
        numberInfoLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        dateInfoLabel.textColor = .gray
        dateInfoLabel.font = .systemFont(ofSize: 14)
    }
    
    func configureData() {
        pickerField.placeholder = "로또 회차를 선택하세요!"
        
        numberInfoLabel.text = "당첨번호 안내"
        dateInfoLabel.text = "yyyy-MM-dd 추첨"
    }
    
    func callRequest() {
        let URL = "\(API.URL)\(recentDrwNo)"
        AF.request(URL).responseDecodable(of: Lotto.self) { res in
            switch res.result {
            case .success(let value):
                print("로또 조회 성공")
                self.lottoData = [value]
                self.dateInfoLabel.text = "\(self.lottoData[0].drwNoDate) 추첨"
                self.view.reloadInputViews()
                self.lottoTableView.reloadData()
            case .failure(let error):
                print("로또 조회 실패", error)
            }
        }
    }
    
    
    // Bar Button
    func setBarBtnItem() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let selectBtn = UIBarButtonItem(title: "선택", image: nil, target: self, action: #selector(selectBarBtnClicked))
        toolBar.setItems([selectBtn], animated: true)
        toolBar.isUserInteractionEnabled = true
        pickerField.inputAccessoryView = toolBar
    }
    
    @objc func selectBarBtnClicked() {
        print("회차 선택", pickerField.text!)
        view.endEditing(true)
        callRequest()
    }
}


// MARK: LottoViewController 익스텐션
// pickerView
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lottoData[0].drwNo
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerField.text = "\(row + 1)"
    }
}

// tableView
extension LottoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lottoTableView.dequeueReusableCell(withIdentifier: LottoTableViewCell.id, for: indexPath) as! LottoTableViewCell

        let lotto = lottoData
        
        cell.selectionStyle = .none
        
//        cell.lottoData = lottoData
        cell.configureCellHierarchy()
        cell.configureCellLayout()
        cell.configureCellUI()
        cell.configureCellData(data: lotto)
        
        return cell
    }
    
}
