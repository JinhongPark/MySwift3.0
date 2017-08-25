//
//  MainViewController.swift
//  mySwift
//
//  Created by jinhongstar on 2017. 8. 16..
//  Copyright © 2017년 jinhongstar. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	var DetailController : CustomDelegateViewController?

	@IBOutlet weak var myTableView: UITableView!
	
	let menus = ["jinhongstar Swift3.0"
				,"Custom Frame"
				,"Custom Delegate"
				,"Singleton"
				,"Alamofire"
				,"Json"
				,"String"
				,"AutoLayout"
				,"SNS"
				,"Tab Split"
				,"RxSwift"
				,"Camera"
				,"PhotoAlbum"
				,"GoogleMap"]
	
	let subMenus = ["프로젝트 소스 정리 dev jinhongstar"
					,"Custom frame Draw Sample"
					,"Custom delegate Use Sample"
					,"Singleton Sample"
					,"AFNetworking 같은 Netwroking Sample"
					,"Json Simple Sample"
					,"String and Characters Sample"
					,"AutoLayout Sample"
					,"SNS [카카오톡,페이스북,네이버라인,트위터] Sample"
					,"Tab Split Sample"
					,"RxSwift Ajax 비슷한 실시간통신 Sample"
					,"Camera Sample"
					,"PhotoAlbum Sample"
					,"GoogleMap Sample"]
	
	let images = ["jinhongstar"
		,"frame"
		,"delegate"
		,"singleton"
		,"alamofire"
		,"json"
		,"string"
		,"autolayout"
		,"sns"
		,"tabsplit"
		,"reswift"
		,"camera"
		,"photoAlbum"
		,"googleMap"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		myTableView.delegate = self;
		myTableView.dataSource = self;

		
//		var frame = myTableView.frame
//		frame.size.height = 350
//		myTableView.frame = frame

		
		DetailController  = CustomDelegateViewController()
		DetailController?.delegate = self
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		//currently only a testing number
		return menus.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 첫 번째 인자로 등록한 identifier, cell은 as 키워드로 앞서 만든 custom cell class화 해준다.
		let cell = tableView.dequeueReusableCell( withIdentifier: "MyTableCell", for: indexPath) as! MyTableCell
		// 위 작업을 마치면 커스텀 클래스의 outlet을 사용할 수 있다.
		cell.tvLabel.text = menus[indexPath.row]
		cell.tvSubLabel.text = subMenus[indexPath.row]
		cell.tvImageView.image = UIImage(named: images[indexPath.row])
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		print(indexPath.row)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		
		if (indexPath.row == 0) {
			
			let introViewController = storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
			self.navigationController?.pushViewController(introViewController, animated: true)
			
		}else if(indexPath.row == 1 ){
			
			let customFrameViewController = storyboard.instantiateViewController(withIdentifier: "CustomFrameViewController") as! CustomFrameViewController
			self.navigationController?.pushViewController(customFrameViewController, animated: true)
			
			
		}else if(indexPath.row == 2 ){
			
			
			let eventViewController = storyboard.instantiateViewController(withIdentifier: "CustomDelegateViewController") as! CustomDelegateViewController
			eventViewController.delegate = self
			self.navigationController?.pushViewController(eventViewController, animated: true)
		}
		
//		let currentStoryboard : String! = self.restorationIdentifier
//		if currentStoryboard == "CustomDelegateViewController" {
		
//		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
// # 2: "MainViewController" will implement "AudioPlayerDelegate":
extension MainViewController: CustomDelegate {
	// # 4: "MainViewController" implements "AudioPlayerDelegate" requirments:
	func playPauseDidTap() {
		let alertController = UIAlertController(title: "Delegate", message: "play/pause tapped!!", preferredStyle: .alert)
		
		// Create the actions
		let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
//		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
//			UIAlertAction in
//			NSLog("Cancel Pressed")
//		}
		
		// Add the actions
		alertController.addAction(okAction)
//		alertController.addAction(cancelAction)
		
		// Present the controller
		self.present(alertController, animated: true, completion: nil)
		print("")
	}
	
	func playlistDidTap() {
		// note that is should do a different behavior in each MainViewController...
		let alertController = UIAlertController(title: "Delegate", message: "list tapped!!", preferredStyle: .alert)
		
		// Create the actions
		let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
		//		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
		//			UIAlertAction in
		//			NSLog("Cancel Pressed")
		//		}
		
		// Add the actions
		alertController.addAction(okAction)
		//		alertController.addAction(cancelAction)
		
		// Present the controller
		self.present(alertController, animated: true, completion: nil)
		
	}
}

