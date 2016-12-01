//
//  WalkthroughViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/30.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {

    @IBOutlet weak var paperOnBoarding: PaperOnboarding!
    @IBOutlet weak var walkthroughEndButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walkthroughEndButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension WalkthroughViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        walkthroughEndButton.isHidden = index == 3 ? false : true
        if index == 3 {
            UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        } else {
            UIApplication.shared.setStatusBarStyle(.default, animated: true)
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {

    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        //    item.titleLabel?.backgroundColor = .redColor()
        //    item.descriptionLabel?.backgroundColor = .redColor()
        //    item.imageView = ...
    }
}


// MARK: PaperOnboardingDataSource

extension WalkthroughViewController: PaperOnboardingDataSource {
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let titleFont = UIFont.systemFont(ofSize: 17.0)
        let descriptionFont = UIFont.systemFont(ofSize: 14.0)
        
        return [
            (UIImage.Asset.Walkthrough_Manual.rawValue, "YOUR FIRST AID MANUAL", "Learning the most straighway and practical first aid knowledge. Plum has got you covered right away when accident occurs. ", UIImage.Asset.Walkthrough_Manual_Key.rawValue, UIColor.white, UIColor.black, UIColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.00), titleFont,descriptionFont),
            
            (UIImage.Asset.Walkthrough_Profile.rawValue, "MANAGE YOUR HEALTH PROFILE", "Recording health information and medical conditions of your own, as well as your family members and your friends.", UIImage.Asset.Walkthrough_Profile_Key.rawValue, UIColor.white, UIColor.black, UIColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.00), titleFont,descriptionFont),
            
            (UIImage.Asset.Walkthrough_Locate.rawValue, "LOCATE MEDICAL SERVICES NEARBY", "As you conducting first aid, do not forget to reach out for medical services around you immediately in case of emergency.", UIImage.Asset.Walkthrough_Locate_Key.rawValue, UIColor.white, UIColor.black, UIColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.00), titleFont,descriptionFont),

            (UIImage.Asset.Walkthrough_Last.rawValue, "FIRST AID CAN SAVE LIFE", "Do not underestimate the power of the golden first five minutes. Taking effective first aid interventions with the help of Plum.", UIImage.Asset.Walkthrough_Last_Key.rawValue, UIColor(red: 1.00, green: 0.188, blue: 0.26, alpha: 1.00), UIColor.white, UIColor.white, titleFont,descriptionFont)
            ][index]
    }
    
    func onboardingItemsCount() -> Int {
        return 4
    }
}
