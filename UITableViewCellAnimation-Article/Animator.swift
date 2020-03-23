//
//  Animator.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UIView, at indexPath: IndexPath, in scrollView: UIScrollView) {
        guard !hasAnimatedAllCells else {
            return
        }
        
        switch(scrollView) {
        case is UICollectionView:
            animation(cell, indexPath, scrollView as! UICollectionView)
            hasAnimatedAllCells = (scrollView as! UICollectionView).isLastVisibleCell(at: indexPath)
            break;
        case is UITableView:
            animation(cell, indexPath, scrollView as! UITableView)
            hasAnimatedAllCells = (scrollView as! UITableView).isLastVisibleCell(at: indexPath)
        // Add additional handling for UIScrollView derived types of your choice.
        default:
            break;
        }
    }
    
}
