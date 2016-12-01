// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

extension UIImage {
  enum Asset: String {
    case Walkthrough_Profile = "Walkthrough_Profile"
    case Walkthrough_Manual = "Walkthrough_Manual"
    case Walkthrough_Manual_Key = "Walkthrough_Manual_Key"
    case Walkthrough_Locate_Key = "Walkthrough_Locate_Key"
    case Walkthrough_Locate = "Walkthrough_Locate"
    case Walkthrough_Profile_Key = "Walkthrough_Profile_Key"
    case Walkthrough_Last = "Walkthrough_Last"
    case Walkthrough_Last_Key = "Walkthrough_Last_Key"

    var image: UIImage {
      return UIImage(asset: self)
    }
  }

  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
