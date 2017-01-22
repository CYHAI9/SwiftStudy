//
//  Cell01.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/19.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class Cell01: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    class func cellinitWith(tableview:UITableView,indexpath:IndexPath) -> UITableViewCell {
  
      var cell = tableview.dequeueReusableCell(withIdentifier: "cellid01")
        if (cell != Cell01()) {
            
            cell = Cell01.init(style: .default, reuseIdentifier: "cellid01")
           (cell as! Cell01).cellUI()
        }
        return cell!
        
    }
    
    func cellUI() -> Void {
       
        let label01 = UILabel.init(frame:CGRect(origin:CGPoint(x:0,y:0),size:CGSize(width:200, height:20)))
        label01.backgroundColor = UIColor.orange
        self.contentView.addSubview(label01)
        label01.text = "xxxxxeeeee==="
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
