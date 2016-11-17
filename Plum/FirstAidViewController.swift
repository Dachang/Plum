//
//  FirstAidViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/16.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var firstAidTableView: UITableView!
    var firstAidArray : [FirstAidEntry] = [FirstAidEntry]()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readFirstAidDataFromFile()
        firstAidTableView.delegate = self;
        firstAidTableView.dataSource = self;
        firstAidTableView.tableFooterView = UIView(frame: CGRect.zero)
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
        return firstAidArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstAidTableViewCellIdentifier = "firstAidTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: firstAidTableViewCellIdentifier, for: indexPath) as! FirstAidTableViewCell
        
        let selectionView : UIView = UIView(frame: cell.frame)
        selectionView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        cell.selectedBackgroundView = selectionView
        
        let entry = firstAidArray[indexPath.row]
        cell.FirstAidTableViewCellImageView.image = entry.firstAidThumbnail
        cell.FirstAidTableViewCellLabel.text = entry.firstAidName
        
        return cell
    }
    
    // MARK: - Initialize Data
    func readFirstAidDataFromFile() {
        if let path = Bundle.main.path(forResource: "FirstAidList", ofType: "plist") {
            let dict = NSDictionary(contentsOfFile: path) as! [String: AnyObject]
            for item in dict["FirstAidName"] as! [String] {
                let entry = FirstAidEntry(name: item)
                firstAidArray.append(entry)
            }
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
