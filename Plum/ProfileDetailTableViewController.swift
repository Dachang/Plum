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
    
    var profileDetailTableViewHeightTitles : [[String]] = []
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Target Actions
    
    @IBAction func leftBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func rightBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
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
        let profileDetailTableViewCellIdentifier = "profileDetailTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: profileDetailTableViewCellIdentifier, for: indexPath) as! ProfileDetailTableViewCell
        
        
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
        case 3:
            return 2
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
        default:
            return 0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return profileDetailTableViewGenderTitles[row]
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
    }
}
