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

	init(animation: Animation) {
		self.animation = animation
	}

	func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
		guard !hasAnimatedAllCells else {
			return
		}

		animation.animate(cell, indexPath, tableView)

		hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
	}
}

enum AnimatorFactory {

	static func makeSlideIn() -> Animator {
		return Animator(animation: AnimationFactory.makeSlideIn(rowHeight: 44, duration: 0.5, delayFactor: 0.05))
	}

	static func makeMoveUpWithBounce() -> Animator {
		return Animator(animation: AnimationFactory.makeMoveUpWithBounce(rowHeight: 44, duration: 1.0, delayFactor: 0.05))
	}

	static func makeMoveUpWithFade() -> Animator {
		return Animator(animation: AnimationFactory.makeMoveUpWithFade(rowHeight: 44, duration: 0.5, delayFactor: 0.05))
	}
}
