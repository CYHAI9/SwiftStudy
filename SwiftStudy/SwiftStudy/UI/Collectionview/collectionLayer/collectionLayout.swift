//
//  collectionLayout.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/29.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class collectionLayout: UICollectionViewFlowLayout {

    func initcollectionlayout(itemSize:CGSize,minlineSP:CGFloat, mininterSP:CGFloat,_sectionInset:UIEdgeInsets) -> collectionLayout {
        if (self.superclass != nil) {
            self.itemSize = itemSize
            self.minimumLineSpacing = minlineSP
            self.minimumInteritemSpacing = mininterSP
            self.sectionInset = _sectionInset
            self.scrollDirection = UICollectionViewScrollDirection.vertical
            
        }
        
        
        return self
    }
    
}
