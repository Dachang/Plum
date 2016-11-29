//
//  ProfileDetailTableViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class ProfileDetailTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    var profileDetailTableViewCellTitles : [[String]] = []
    
    var profileDetailTableViewGenderTitles : [String] = [String]()
    
    var profileDetailTableViewBloodTypeTitles : [String] = [String]()
    
    var profileDetailTableViewHeightTitles : [String] = [String]()
    
    var profileDetailTableViewWeightTitles : [String] = [String]()
    
    var profileEntry : ProfileEntry!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileDetailTableViewCellTitles = [
            ["Name"],
            ["Date of Birth", "Gender", "Blood Type", "Height", "Weight"],
            ["Medical Conditions", "Allergies", "Medication"]
        ]
        
        profileDetailTableViewGenderTitles = ["Male", "Female", "Transexual", "Others"]
        
        profileDetailTableViewBloodTypeTitles = ["Unknown", "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
        
        profileEntry = ProfileEntry(name: "", bir: "", gen: "",
                                    blo: "", hei: "", wei: "",
                                    medcon: "", allgy: "", medca: "")
        
        generateHeightLabels()
        
        generateWeightLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Target Actions
    
    @IBAction func leftBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        if isProfileEntryNull() {
            self.dismiss(animated: true, completion: nil)
        } else {
            presentCancelActionAlert()
        }
    }
    @IBAction func rightBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        if isProfileEntryValid() {
            self.dismiss(animated: true, completion: nil)
        } else {
            presentValidActionAlert()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! ProfileDetailTableViewCell
        
        let selectionView : UIView = UIView(frame: cell.frame)
        selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        cell.selectedBackgroundView = selectionView
        
        let profileDetailTableViewCellTextFieldLabels : [[String]] = [
            [profileEntry.profileName],
            [profileEntry.dateOfBirth, profileEntry.gender, profileEntry.bloodType, profileEntry.height, profileEntry.weight],
            [profileEntry.medicalConditions, profileEntry.allergies, profileEntry.medication]
        ]
        
        cell.profileDetailTableViewCellTitle.text = profileDetailTableViewCellTitles[indexPath.section][indexPath.row]
        cell.profileDetailTableViewCellTextField.delegate = self
        cell.profileDetailTableViewCellTextField.text = profileDetailTableViewCellTextFieldLabels[indexPath.section][indexPath.row]
        cell.profileDetailTableViewCellTextField.tag = indexPath.section * 10 + indexPath.row
        
        if cell.profileDetailTableViewCellTitle.text == "Date of Birth" {
            let datePicker : UIDatePicker = UIDatePicker()
            datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
            datePicker.datePickerMode = .date
            cell.profileDetailTableViewCellTextField.inputView = datePicker
        }
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 1, 2, 3, 4:
                let picker : UIPickerView = UIPickerView()
                picker.delegate = self
                picker.dataSource = self
                picker.tag = indexPath.row
                cell.profileDetailTableViewCellTextField.inputView = picker
            default:
                break;
            }
        } else if indexPath.section == 0 {
            cell.profileDetailTableViewCellTextField.autocapitalizationType = .words
        } else {
            cell.profileDetailTableViewCellTextField.autocapitalizationType = .sentences
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProfileDetailTableViewCell
        cell.profileDetailTableViewCellTextField.becomeFirstResponder()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
        self.tableView.reloadData()
    }

    // MARK: - UIPickerView Delegate & Datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 0:
            return 3
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return profileDetailTableViewGenderTitles.count
        case 2:
            return profileDetailTableViewBloodTypeTitles.count
        case 3:
            return profileDetailTableViewHeightTitles.count
        case 4:
            return profileDetailTableViewWeightTitles.count
        default:
            return 0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return profileDetailTableViewGenderTitles[row]
        case 2:
            return profileDetailTableViewBloodTypeTitles[row]
        case 3:
            return profileDetailTableViewHeightTitles[row]
        case 4:
            return profileDetailTableViewWeightTitles[row]
        default:
            return profileDetailTableViewBloodTypeTitles[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            profileEntry.gender = profileDetailTableViewGenderTitles[row]
        case 2:
            profileEntry.bloodType = profileDetailTableViewBloodTypeTitles[row]
        case 3:
            profileEntry.height = profileDetailTableViewHeightTitles[row]
        case 4:
            profileEntry.weight = profileDetailTableViewWeightTitles[row]
        default:
            break;
        }
        self.tableView.reloadData()
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            profileEntry.profileName = textField.text!
        case 20:
            profileEntry.medicalConditions = textField.text!
        case 21:
            profileEntry.allergies = textField.text!
        case 22:
            profileEntry.medication = textField.text!
        default:
            break;
        }
        textField.resignFirstResponder()
    }
    
    // MARK: - Utils
    func generateHeightLabels() {
        var lhs_arg : [String] = [String]()
        var rhs_arg : [String] = [String]()
        
        for i in 0...9 {
            lhs_arg.append(String(i) + "'")
            for j in 0...11 {
                rhs_arg.append(String(j) + "''")
                profileDetailTableViewHeightTitles.append(lhs_arg[i] + " " + rhs_arg[j])
            }
        }
    }
    
    func generateWeightLabel() {
        for i in 0...999 {
            profileDetailTableViewWeightTitles.append(String(i)+" lb")
        }
    }
    
    func isProfileEntryValid() -> Bool {
        return profileEntry.profileName != "" ? true : false
    }
    
    func isProfileEntryNull() -> Bool {
        if profileEntry.profileName == "" &&
            profileEntry.allergies == "" &&
            profileEntry.bloodType == "" &&
            profileEntry.dateOfBirth == "" &&
            profileEntry.gender == "" &&
            profileEntry.height == "" &&
            profileEntry.medicalConditions == "" &&
            profileEntry.medication == "" &&
            profileEntry.weight == "" {
            return true
        }
        return false
    }
    
    func presentCancelActionAlert() {
        let alert = UIAlertController(title: "Cancel Editing?", message: "Your information will be dismissed", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentValidActionAlert() {
        let alert = UIAlertController(title: "Unable to Save", message: "You must input the name of this profile", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Target
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: sender.date)
        profileEntry.dateOfBirth = strDate
    }
}
