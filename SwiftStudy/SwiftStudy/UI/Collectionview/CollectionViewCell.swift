//
//  CollectionViewCell.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/29.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
   class func initItemWithIdentifier(_collectionview:UICollectionView,Identifier:String , index:IndexPath) -> CollectionViewCell {
        let cell:CollectionViewCell = _collectionview.dequeueReusableCell(withReuseIdentifier: Identifier, for: index) as! CollectionViewCell
       cell.backgroundColor = UIColor.orange
        
        return cell
        
    }
    
}
