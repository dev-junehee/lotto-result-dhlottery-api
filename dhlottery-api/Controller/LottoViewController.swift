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
    let dateInfoLAbel = UILabel()
    
    let drwNoLabel = UILabel()
    
    let drwtNoStack = UIStackView()
    
    
    // pickerView 데이터
    var lottoData: [Lotto] = []
    var recentDrwNo = "1121"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureData()
        callRequest()
    }
    
    func configureHierarchy() {
        let subviews = [pickerField]
        subviews.forEach {
            view.addSubview($0)
        }
        
        picker.delegate = self
        pickerField.inputView = picker
    }

    func configureLayout() {
        pickerField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    func configureUI() {
        pickerField.borderStyle = .roundedRect
        pickerField.textAlignment = .center
        
    }
    
    func configureData() {
        
    }
    
    func callRequest() {
        let URL = "\(API.URL)\(recentDrwNo)"
        
        AF.request(URL).responseDecodable(of: Lotto.self) { res in
            switch res.result {
            case .success(let value):
                print(value)
                self.lottoData = [value]
                print("1", self.lottoData)
            case .failure(let error):
                print(error)
            }
        }
        
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
