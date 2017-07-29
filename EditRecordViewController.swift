//
//  Modal form for crearing and editing a diary record
//

import Foundation
import UIKit

class EditRecordViewController: UIViewController {
    
    fileprivate let defaultSpacing: CGFloat = 12.0
    fileprivate var viewModel = EditRecordViewModel()
    
    fileprivate lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datePicker
    }()
    
    fileprivate lazy var sugarLevelTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.placeholder = "Sugar level ❤️"
        return textField
    }()
    
    fileprivate lazy var medicationAmountTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.placeholder = "Medication amount 💉"
        
        return textField
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.datePicker,
                                                       self.sugarLevelTextField,
                                                       self.medicationAmountTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = self.defaultSpacing
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavbar()
        setupStackView()
    }
    
    func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(pop))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(save))
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultSpacing).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defaultSpacing).isActive = true
        stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    func save() {
        viewModel.saveChanges()
        pop()
    }
    
    func pop() {
        view.endEditing(true)
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func datePickerValueChanged() {
        viewModel.setDate(date: datePicker.date)
    }
    
}

extension EditRecordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textBeforeUpdate = (textField.text as NSString?) ?? ""
        let textAfterUpdate = textBeforeUpdate.replacingCharacters(in: range, with: string)
        
        if textField === sugarLevelTextField {
            viewModel.setSugarLevel(levelString: textAfterUpdate)
        }
        else if textField === medicationAmountTextField {
            viewModel.setMedicationAmount(amountString: textAfterUpdate)
        }
        
        return true
    }
}
