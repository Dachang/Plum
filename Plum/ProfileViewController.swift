//
//  ProfileViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileEmptyIndicatorImage: SpringImageView!
    
    @IBOutlet weak var profileEmptyIndicatorTitle: SpringLabel!
    
    @IBOutlet weak var profileEmptyIndicatorSeparator: UIImageView!
    
    @IBOutlet weak var profileEmptyIndicatorDescription: SpringLabel!
    
    @IBOutlet weak var profileListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileListTableView.delegate = self
        profileListTableView.dataSource = self
        profileListTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ProfileEntryArchive.healthProfiles.count == 0 {
            profileListTableView.isHidden = true
            profileEmptyIndicatorImage.isHidden = false
            profileEmptyIndicatorTitle.isHidden = false
            profileEmptyIndicatorSeparator.isHidden = false
            profileEmptyIndicatorDescription.isHidden = false
        } else {
            profileEmptyIndicatorImage.isHidden = true
            profileEmptyIndicatorTitle.isHidden = true
            profileEmptyIndicatorSeparator.isHidden = true
            profileEmptyIndicatorDescription.isHidden = true
            profileListTableView.isHidden = false
            profileListTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView Delegate & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileEntryArchive.healthProfiles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 128.0
        case 1, 2:
            return 64.0
        case 3:
            return 44.0
        default:
            return 44.0
        }
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
        switch indexPath.row {
        case 0:
            let profileListBannerTableViewCellIdentifier = "profileListBannerTableViewCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: profileListBannerTableViewCellIdentifier, for: indexPath) as! ProfileListBannerTableViewCell
            
            let selectionView : UIView = UIView(frame: cell.frame)
            selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
            cell.selectedBackgroundView = selectionView
            
            cell.cellProfileName.text = ProfileEntryArchive.healthProfiles[indexPath.section].profileName
            cell.cellDateOfBirthTitle.text = "Date of Birth"
            cell.cellDateOfBirthContent.text = ProfileEntryArchive.healthProfiles[indexPath.section].dateOfBirth
            cell.cellThumbnailCapLetter.text = ProfileEntryArchive.healthProfiles[indexPath.section].profileName[0]
            
            return cell
        case 1, 2:
            let profileListSectionCellIdentifier = "profileListSectionTableViewCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: profileListSectionCellIdentifier, for: indexPath) as! ProfileListSectionTableViewCell
            
            let selectionView : UIView = UIView(frame: cell.frame)
            selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
            cell.selectedBackgroundView = selectionView
            
            cell.cellTitle.text = indexPath.row == 1 ? "Gender" : "BloodType"
            cell.cellContent.text = indexPath.row == 1 ? ProfileEntryArchive.healthProfiles[indexPath.section].gender : ProfileEntryArchive.healthProfiles[indexPath.section].bloodType
            
            return cell
        case 3:
            let profileListButtonTableViewCellIdentifier = "profileListButtonTableViewCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: profileListButtonTableViewCellIdentifier, for: indexPath) as! ProfileListButtonTableViewCell
            
            let selectionView : UIView = UIView(frame: cell.frame)
            selectionView.backgroundColor = UIColor.black.withAlphaComponent(0)
            cell.selectedBackgroundView = selectionView
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "isEditingProfile" {
            let destinationViewController = segue.destination as? UINavigationController
            let profileDetailTableViewController = destinationViewController?.topViewController as? ProfileDetailTableViewController
            let currentIndex = (profileListTableView.indexPath(for: sender as! ProfileListButtonTableViewCell)?.section)!
            ProfileEntryArchive.currentProfileIndex = currentIndex
            profileDetailTableViewController?.profileIsNew = false
            print("isEditingProfile")
        } else {
            print("isAddingProfile")
        }

    }

}
