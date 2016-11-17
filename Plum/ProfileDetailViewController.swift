//
//  ProfileDetailViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var profileDetailTableView: UITableView!
    
    var profileDetailTableViewCellTitles : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileDetailTableView.delegate = self
        profileDetailTableView.dataSource = self
        profileDetailTableViewCellTitles = ["Name","Date of Birth", "Gender", "Blood Type", "Height", "Weight", "Medical Conditions", "Allergies", "Medication"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Target Actions
    @IBAction func leftBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITableview Delegate & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileDetailTableViewCellIdentifier = "profileDetailTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileDetailTableViewCellIdentifier, for: indexPath) as! ProfileDetailTableViewCell
        
        let selectionView : UIView = UIView(frame: cell.frame)
        selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        cell.selectedBackgroundView = selectionView
        
        cell.profileDetailTableViewCellTitle.text = profileDetailTableViewCellTitles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProfileDetailTableViewCell
        cell.profileDetailTableViewCellTextField.becomeFirstResponder()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
