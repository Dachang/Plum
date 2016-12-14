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
    
    var firstAidIndex : Int = 0
    
    var sectionIconArray : [String] = [String]()
    var sectionNameArray : [String] = [String]()
    
    var symptonArray : [String] = [String]()
    var methodArray : [String] = [String]()
    var cautionsArray : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstAidDetailTableView.delegate = self
        firstAidDetailTableView.dataSource = self
        firstAidDetailTableView.estimatedRowHeight = 116.0
        firstAidDetailTableView.rowHeight = UITableViewAutomaticDimension
        firstAidDetailTableView.reloadData()
        
        sectionIconArray = ["Symptom_Icon", "FirstAidMethod_Icon", "Cautions_Icon"]
        sectionNameArray = ["Symptom", "First Aid Method", "Cautions"]
        
        readFirstAidDataFromFile()
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
            return symptonArray.count
        case 1:
            return methodArray.count
        case 2:
            return cautionsArray.count
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
        if indexPath.row == 0 {
            let firstAidSymptomCellIdentifier = "FirstAidSymptomCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: firstAidSymptomCellIdentifier, for: indexPath) as! FirstAidSymptomTableViewCell
            
            switch indexPath.section {
            case 0:
                cell.symtomTextView.text = symptonArray[0]
            case 1:
                cell.symtomTextView.text = methodArray[0]
            case 2:
                cell.symtomTextView.text = cautionsArray[0]
            default:
                cell.symtomTextView.text = "Wounds may have congestion, swelling and pain. Severe fractures may cause limb deformities, or open wounds."
            }
            
            cell.symptomIconImage.image = UIImage(named: sectionIconArray[indexPath.section])
            cell.symptomLabel.text = sectionNameArray[indexPath.section]
            
            let sizeThatFitsTextView : CGSize = cell.symtomTextView.sizeThatFits(CGSize(width: cell.symtomTextView.frame.size.width, height: CGFloat(MAXFLOAT)))
            cell.symptomTextViewHeight.constant = sizeThatFitsTextView.height
            cell.layoutSubviews()
            
            let selectionView : UIView = UIView(frame: cell.frame)
            selectionView.backgroundColor = UIColor.black.withAlphaComponent(0)
            cell.selectedBackgroundView = selectionView
            
            return cell
        } else {
            let firstAidSymptomBulletinCellIdentifier = "FirstAidSymptomBulletinCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: firstAidSymptomBulletinCellIdentifier, for: indexPath) as! FirstAidSymptomBulletinTableViewCell
            
            switch indexPath.section {
            case 0:
                cell.textView.text = symptonArray[indexPath.row]
            case 1:
                cell.textView.text = methodArray[indexPath.row]
            case 2:
                cell.textView.text = cautionsArray[indexPath.row]
            default:
                cell.textView.text = "Wounds may have congestion, swelling and pain. Severe fractures may cause limb deformities, or open wounds."
            }
            
            let sizeThatFitsTextView : CGSize = cell.textView.sizeThatFits(CGSize(width: cell.textView.frame.size.width, height: CGFloat(MAXFLOAT)))
            cell.textViewHeight.constant = sizeThatFitsTextView.height
            cell.layoutSubviews()
            
            let selectionView : UIView = UIView(frame: cell.frame)
            selectionView.backgroundColor = UIColor.black.withAlphaComponent(0)
            cell.selectedBackgroundView = selectionView
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Initialize Data
    func readFirstAidDataFromFile() {
        if let path = Bundle.main.path(forResource: "FirstAidList", ofType: "plist") {
            let dict = NSDictionary(contentsOfFile: path) as! [String: AnyObject]
            let dataset : [NSDictionary] = dict["FirstAidDataset"] as! [NSDictionary]

            let firstAidDict : NSDictionary = dataset[firstAidIndex] as! NSDictionary
            symptonArray = firstAidDict["Symtoms"] as! [String]
            methodArray = firstAidDict["Methods"] as! [String]
            cautionsArray = firstAidDict["Cautions"] as! [String]
        }
        
        
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
