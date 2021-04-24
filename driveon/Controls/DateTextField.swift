//
//  DateTextField.swift
//  flt
//
//  Created by Алексей Тузовский on 06.12.2020.
//

import Foundation
import SwiftUI
class DateTextField: UITextField {
    // MARK: - Public properties
    @Binding var date: Date?

    // MARK: - Initializers
    init(date: Binding<Date?>) {
        self._date = date
        super.init(frame: .zero)

        if let date = date.wrappedValue {
            self.datePickerView.date = date
        }

        self.datePickerView.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        self.inputView = datePickerView
        self.tintColor = .clear
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
            
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.inputAccessoryView = toolBar
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private lazy var datePickerView: UIDatePicker = {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .dateAndTime
        datePickerView.preferredDatePickerStyle = .wheels
        return datePickerView
    }()
    @objc
    private func donePressed() {
//        self.selectionIndex = self.pickerView.selectedRow(inComponent: 0)
//        self.endEditing(true)
        self.resignFirstResponder()
        
    }

    // MARK: - Private methods
    @objc func dateChanged(_ sender: UIDatePicker) {
        self.date = sender.date
    }
}
