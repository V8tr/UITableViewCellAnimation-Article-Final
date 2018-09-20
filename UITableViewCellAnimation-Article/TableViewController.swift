//
//  TableViewController.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	@IBAction func onRefresh(_ sender: UIBarButtonItem) {
		tableView.reloadData()
	}

	// MARK: - Table view data source and delegate methods

	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
		let animator = Animator(animation: animation)
		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}

