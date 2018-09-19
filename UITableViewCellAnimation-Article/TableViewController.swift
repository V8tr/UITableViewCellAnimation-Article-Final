//
//  TableViewController.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	private var animator = AnimatorFactory.makeSlideIn()

	@IBAction func onRefresh(_ sender: UIBarButtonItem) {
		animator = AnimatorFactory.makeSlideIn()
		tableView.reloadData()
	}

	// MARK: - Table view data source and delegate methods

	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}

