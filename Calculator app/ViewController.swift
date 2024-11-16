//
//  ViewController.swift
//  Calculator app
//
//  Created by Apple on 16.11.24.
//

import UIKit

class ViewController: UIViewController {

    // all variables
    var workings: String = ""
    
    
    private let resultView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let operationLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        lb.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        return lb
    }()
    private let resultLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        lb.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        return lb
    }()
    private let generalStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let deletePercentDivisionStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let allDeleteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .gray
        btn.setTitle("AC", for: .normal)
        btn.layer.cornerRadius = 30
        btn.layer.masksToBounds = true
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let deleteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .gray
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "delete.left", withConfiguration: largeConfig)
        btn.setImage(largeImage, for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let percentButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .gray
        btn.setTitle("%", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let divisionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .orange
        btn.setTitle("/", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let sevenEightNineMultiplicationStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let sevenButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("7", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let eightButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("8", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let nineButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("9", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let multiplicationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .orange
        btn.setTitle("*", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let fourFiveSixSubtractionStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let fourButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("4", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let fiveButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("5", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let sixButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("6", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let subtractionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .orange
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let oneTwoThreeAdditionStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let oneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("1", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let twoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("2", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let threeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("3", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let additionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .orange
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()

    private let pointZeroEqualStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    private let commaZeroStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 8
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    private let commaButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(".", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 30
        return btn
    }()
    private let zeroButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .darkGray
        btn.setTitle("0", for: .normal)
        btn.layer.cornerRadius = 30
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return btn
    }()
    private let equalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    private let equalButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .orange
        btn.setTitle("=", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        btn.layer.cornerRadius = 30
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        setupAction()
    }
    private func setupUI(){
        view.addSubview(resultView)
        view.addSubview(generalStackView)
        resultView.addSubview(operationLabel)
        resultView.addSubview(resultLabel)
        [deletePercentDivisionStackView, sevenEightNineMultiplicationStackView, fourFiveSixSubtractionStackView, oneTwoThreeAdditionStackView, pointZeroEqualStackView].forEach(generalStackView.addArrangedSubview)
        [allDeleteButton, deleteButton, percentButton, divisionButton].forEach(deletePercentDivisionStackView.addArrangedSubview)
        [sevenButton, eightButton, nineButton, multiplicationButton].forEach(sevenEightNineMultiplicationStackView.addArrangedSubview)
        [fourButton, fiveButton, sixButton, subtractionButton].forEach(fourFiveSixSubtractionStackView.addArrangedSubview)
        [oneButton, twoButton, threeButton, additionButton].forEach(oneTwoThreeAdditionStackView.addArrangedSubview)
        [commaZeroStackView, equalStackView].forEach(pointZeroEqualStackView.addArrangedSubview)
        [commaButton, zeroButton].forEach(commaZeroStackView.addArrangedSubview)
        [equalButton].forEach(equalStackView.addArrangedSubview)
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultView.heightAnchor.constraint(equalToConstant: 250),
            
            operationLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 8),
            operationLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 8),
            operationLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -8),
            resultLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -8),
            resultLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -16),
            generalStackView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAction(){
        allDeleteButton.addTarget(self, action: #selector(clearAll), for: .touchUpInside)
        percentButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        divisionButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        nineButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        multiplicationButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        subtractionButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        oneButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        additionButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        commaButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(addToWorkings(_:)), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteLast), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(equalsTap), for: .touchUpInside)
    }
    @objc
    private func clearAll(){
        workings = ""
        operationLabel.text = ""
        resultLabel.text = ""
    }
    
    @objc
    private func addToWorkings(_ button: UIButton){
        workings = workings + (button.titleLabel?.text ?? "")
        operationLabel.text = workings
    }
    
    @objc
    private func deleteLast(){
        if(!workings.isEmpty){
            workings.removeLast()
            operationLabel.text = workings
        }
    }
    
    @objc
    private func equalsTap(){
        if(validInput()){
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator enable to do match based on input", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        for index in funcCharIndexes{
            
            if(index == 0){
                return false
            }
            
            if(index == workings.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "%"){
            return true
        }
        return false
    }
}

