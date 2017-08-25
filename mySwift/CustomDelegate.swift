//
//  CustomDelegateViewController.swift
//  mySwift
//
//  Created by jinhongstar on 2017. 8. 16..
//  Copyright © 2017년 jinhongstar. All rights reserved.
//

import UIKit

// # 1: here is the protocol for creating the delegation
protocol CustomDelegate {
	func playPauseDidTap()
	func playlistDidTap()
}

class CustomDelegateViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	//MARK:- IBOutlets
	@IBOutlet weak private var btnPlayPause: UIButton!
	@IBOutlet weak private var btnPlaylist: UIButton!
	
	// MARK:- Delegate
	var delegate:CustomDelegate?
	
	// IBActions
	@IBAction private func playPauseTapped(_ sender: AnyObject) {
//		self.navigationController?.dismiss(animated: true, completion: nil)
		self.navigationController?.popViewController(animated: true)
//		self.navigationController?.popToRootViewController(animated: true)
//		self.dismiss(animated: true, completion: nil)
		delegate?.playPauseDidTap()

	}
	
	@IBAction private func playlistTapped(_ sender: AnyObject) {
		self.navigationController?.popViewController(animated: true)
		delegate?.playlistDidTap()
		
	}

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	

}
