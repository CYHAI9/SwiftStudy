//
//  CollectionviewController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/29.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class CollectionviewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var _collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createrUI()
    }

    
    func createrUI() -> Void {
    
        let insets:UIEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5)
        let Itemsize:CGSize = CGSize(width:180,height:250)
        
        let layout:collectionLayout = collectionLayout().initcollectionlayout(itemSize: Itemsize, minlineSP: 5, mininterSP: 5, _sectionInset:insets)
            
        self._collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout )
        self._collectionView?.delegate = self;
        self._collectionView?.dataSource = self;
        self._collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier:"collection")
        self.view.addSubview(self._collectionView!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionViewCell = CollectionViewCell.initItemWithIdentifier(_collectionview: collectionView,Identifier: "collection",index: indexPath)
        
        return cell;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
