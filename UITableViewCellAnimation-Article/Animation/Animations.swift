//
//  MoveUpWithBounceTableCellAnimator.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

struct Animation {
	let animate: (UITableViewCell, IndexPath, UITableView) -> Void
}

enum AnimationFactory {

	static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
		return Animation { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				usingSpringWithDamping: 0.4,
				initialSpringVelocity: 0.1,
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
			})
		}
	}

	static func makeSlideIn(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
		return Animation { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
			})
		}
	}

	static func makeMoveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
		return Animation { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
			cell.alpha = 0

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
					cell.alpha = 1
			})
		}
	}
}
