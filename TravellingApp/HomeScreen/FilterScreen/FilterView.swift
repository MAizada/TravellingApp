//
//  FilterView.swift
//  TravellingApp
//
//  Created by Aizada on 22.04.2024.
//

import UIKit

class FilterView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let countries = ["USA", "Canada", "Australia", "Japan", "Kazakhstan"]
    private let prices = ["20", "40", "60", "80", "100"]
    private let travelCategories = ["Lakes", "Sea", "Mountain", "Forest", "City"]
    
    private let countryPicker = UIPickerView()
    private let pricePicker = UIPickerView()
    private let travelCategorySegmentedControl = UISegmentedControl(items: ["Lakes", "Sea", "Mountain", "Forest", "City"])
    private let doneButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        countryPicker.delegate = self
        countryPicker.dataSource = self
        pricePicker.delegate = self
        pricePicker.dataSource = self
        
        travelCategorySegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        travelCategorySegmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        view.addSubview(countryPicker)
        view.addSubview(pricePicker)
        view.addSubview(travelCategorySegmentedControl)
        view.addSubview(doneButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        countryPicker.translatesAutoresizingMaskIntoConstraints = false
        pricePicker.translatesAutoresizingMaskIntoConstraints = false
        travelCategorySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            countryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pricePicker.topAnchor.constraint(equalTo: countryPicker.bottomAnchor, constant: 20),
            pricePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pricePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            travelCategorySegmentedControl.topAnchor.constraint(equalTo: pricePicker.bottomAnchor, constant: 20),
            travelCategorySegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            travelCategorySegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - UIPickerViewDataSource & UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPicker {
            return countries.count
        } else if pickerView == pricePicker {
            return prices.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPicker {
            return countries[row]
        } else if pickerView == pricePicker {
            return prices[row]
        }
        return nil
    }
    
    // MARK: - Actions
    
    @objc private func segmentedControlChanged(_ segmentedControl: UISegmentedControl) {
        let selectedCategory = travelCategories[segmentedControl.selectedSegmentIndex]
        print("Selected travel category: \(selectedCategory)")
    }
    
    @objc private func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
