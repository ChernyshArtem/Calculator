import UIKit

class ViewController: UIViewController {
    
    enum Operation{
        case plus
        case minus
        case multiply
        case divide
        case empty
    }
    
    var actualOperation : Operation = .empty
    
    var storedNumber : Double = 0
    
    @IBOutlet weak var calculateLabel: UILabel!
    
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var operationButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var fraktionButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet var buttonsArray: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCalculatorButtons(arrayOfButtons: buttonsArray)
    }

    @IBAction func oneButtonAction(_ sender: Any) {
        addDigit("1")  
    }
    @IBAction func twoButtonAction(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func threeButtonAction(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func fourButtonAction(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func fiveButtonAction(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func sixButtonAction(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func sevenButtonAction(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func eightButtonAction(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func nineButtonAction(_ sender: Any) {
        addDigit("9")
    }
    @IBAction func zeroButtonAction(_ sender: Any) {
        addDigit("0")
    }
    
    @IBAction func cleanButtonAction(_ sender: Any) {
        calculateLabel.text="0"
        storedNumber=0
    }
    
    @IBAction func changeOperationButtonAction(_ sender: Any) {
        if calculateLabel.text!.hasPrefix("-") == true {
            calculateLabel.text="\(calculateLabel.text!.dropFirst())"
        } else if calculateLabel.text! != "0" {
            calculateLabel.text="-\(calculateLabel.text!)"
        }
    }
    
    @IBAction func makeFraktionButtonAction(_ sender: Any) {
        if calculateLabel.text!.hasSuffix(".") == false {
            calculateLabel.text!="\(calculateLabel.text!)."
        }
    }
    
    @IBAction func deleteLastDigitButtonAction(_ sender: Any) {
        calculateLabel.text!="\(calculateLabel.text!.dropLast())"
        if calculateLabel.text!.isEmpty == true {
            calculateLabel.text = "0"
            storedNumber = 0
        }
    }
    
    @IBAction func addOperationButtonAction(_ sender: Any) {
        actualOperation = .plus
        fillStoredNumber()
    }
    @IBAction func minOperationButtonAction(_ sender: Any) {
        actualOperation = .minus
        fillStoredNumber()
    }
    @IBAction func mulOperationButtonAction(_ sender: Any) {
        actualOperation = .multiply
        fillStoredNumber()
    }
    @IBAction func divOperationButtonAction(_ sender: Any) {
        actualOperation = .divide
        fillStoredNumber()
    }
    @IBAction func calculateResultButtonAction(_ sender: Any) {
        var labelNumber : Double = Double(calculateLabel.text!)!
        var result:Decimal = 0.0
        switch actualOperation {
        case .plus:
            result = Decimal(storedNumber) + Decimal(labelNumber)
        case .minus:
            result = Decimal(storedNumber) - Decimal(labelNumber)
        case .multiply:
            result = Decimal(storedNumber) * Decimal(labelNumber)
        case .divide:
            result = Decimal(storedNumber) / Decimal(labelNumber)
        case .empty:
            print("Error. Try to select operation or to fill second number")
        }
        var intResult:Int = Int("\(result)") ?? 0
        if result - Decimal(intResult) == 0.0 {
            calculateLabel.text = String(Int("\(result)")!)
        } else {
            calculateLabel.text = "\(result)"
        }
        actualOperation = .empty
    }
    
    func fillStoredNumber(){
        if calculateLabel.text! != "0" {
            storedNumber = Double(calculateLabel.text!)!
            calculateLabel.text="0"
        }
    }
    
    func addDigit(_ digit : String){
        if calculateLabel.text!=="0"{
            calculateLabel.text=digit
        } else {
            calculateLabel.text = "\(calculateLabel.text!)\(digit)"
        }
    }
    
    func loadCalculatorButtons (arrayOfButtons : [UIButton]) {
        for element in arrayOfButtons{
            element.layer.cornerRadius =  0.5 * arrayOfButtons[0].bounds.size.width
            element.clipsToBounds = true
        }
    }
}

