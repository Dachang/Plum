//
//  FirstAidDetailViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var firstAidDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstAidDetailTableView.delegate = self
        firstAidDetailTableView.dataSource = self
        firstAidDetailTableView.estimatedRowHeight = 116.0
        firstAidDetailTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView DataSource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1, 2:
            return 2
        default:
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 116
//    }
    
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
        let firstAidSymptomCellIdentifier = "FirstAidSymptomCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: firstAidSymptomCellIdentifier, for: indexPath) as! FirstAidSymptomTableViewCell
        
        cell.symtomTextView.text = "Wounds may have congestion, swelling and pain. Severe fractures may cause limb deformities, or open wounds."
        
        let sizeThatFitsTextView : CGSize = cell.symtomTextView.sizeThatFits(CGSize(width: cell.symtomTextView.frame.size.width, height: CGFloat(MAXFLOAT)))
        cell.symptomTextViewHeight.constant = sizeThatFitsTextView.height
        cell.layoutSubviews()
        
        let selectionView : UIView = UIView(frame: cell.frame)
        selectionView.backgroundColor = UIColor.black.withAlphaComponent(0)
        cell.selectedBackgroundView = selectionView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
