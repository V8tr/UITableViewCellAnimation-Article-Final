//
//  DynamicsParallaxTableCellAnimator.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

final class DynamicsParallaxTableCellAnimator {
	private var hasAnimatedAllCells = false
	private var animator: UIDynamicAnimator!

	let rowHeight: CGFloat

	init(rowHeight: CGFloat) {
		self.rowHeight = rowHeight
	}

	func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
		guard !hasAnimatedAllCells else {
			return
		}

		if animator == nil {
			animator = UIDynamicAnimator(referenceView: tableView)
		}

		let behaviour = UIAttachmentBehavior(item: cell, attachedToAnchor: cell.center)
		behaviour.damping = 0.3
		behaviour.frequency = 1.5
		animator.addBehavior(behaviour)

		cell.center = CGPoint(x: cell.center.x, y: cell.center.y + rowHeight + CGFloat(indexPath.row * 5))
		animator.updateItem(usingCurrentState: cell)

		hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
	}
}
