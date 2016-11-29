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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView Delegate & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
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
        let profileListBannerTableViewCellIdentifier = "profileListBannerTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileListBannerTableViewCellIdentifier, for: indexPath) as! ProfileListBannerTableViewCell
        
        let selectionView : UIView = UIView(frame: cell.frame)
        selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        cell.selectedBackgroundView = selectionView
        
        cell.cellProfileName.text = "Dachang Liu"
        cell.cellDateOfBirthTitle.text = "Date of Birth"
        cell.cellDateOfBirthContent.text = "1992-12-01"
        cell.cellThumbnailCapLetter.text = "D"
        
        return cell
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
