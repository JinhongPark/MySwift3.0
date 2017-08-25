//
//  CustomFrameViewController.swift
//  mySwift
//
//  Created by jinhongstar on 2017. 8. 23..
//  Copyright © 2017년 jinhongstar. All rights reserved.
//

import UIKit

class CustomFrameViewController: UIViewController, UITextFieldDelegate {
	
	
	@IBOutlet weak var xTextField: UITextField!
	@IBOutlet weak var yTextField: UITextField!
	@IBOutlet weak var widthTextField: UITextField!
	@IBOutlet weak var heightTextField: UITextField!
	
	@IBOutlet weak var parentDragView: UIView!
	@IBOutlet weak var dragView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		xTextField.delegate = self
		yTextField.delegate = self
		widthTextField.delegate = self
		heightTextField.delegate = self
		
		xTextField.text = dragView!.frame.origin.x.description
		yTextField.text = dragView!.frame.origin.y.description
		widthTextField.text = dragView!.frame.size.width.description
		heightTextField.text = dragView!.frame.size.height.description
	}
	
	@IBAction func moveToDragView(_ sender: UIPanGestureRecognizer) {
		
		if sender.state == .began {
			// When the drag is first recognized, you can get the starting coordinates here
		}
		
		if sender.state == .ended {
			// When the drag is last recognized, you can get the starting coordinates here
			if(dragView!.frame.origin.x < 0){
				var frame = dragView.frame
				frame.origin.x = 0
				dragView.frame = frame
				
			}
			if(dragView!.frame.origin.y < 0){
				var frame = dragView.frame
				frame.origin.y = 0
				dragView.frame = frame
				
			}
			if(parentDragView.frame.size.width < dragView!.frame.origin.x + dragView!.frame.size.width){
				
				var frame = dragView.frame
				frame.origin.x = parentDragView.frame.size.width - dragView!.frame.size.width;
				dragView.frame = frame
			}
			if(parentDragView.frame.size.height < dragView!.frame.origin.y + dragView!.frame.size.height){
				
				var frame = dragView.frame
				frame.origin.y = parentDragView.frame.size.height - dragView!.frame.size.height;
				dragView.frame = frame
			}
		}
		
		if sender.state == .changed {
			// Translation has both .x and .y values
			
			if(dragView!.frame.origin.x < 0){
				var frame = dragView.frame
				frame.origin.x = 0
				dragView.frame = frame
				
			}
			if(dragView!.frame.origin.y < 0){
				var frame = dragView.frame
				frame.origin.y = 0
				dragView.frame = frame
				
			}
			
			if(parentDragView.frame.size.width < dragView!.frame.origin.x + dragView!.frame.size.width){
				
				var frame = dragView.frame
				frame.origin.x = parentDragView.frame.size.width - dragView!.frame.size.width;
				dragView.frame = frame
			}
			
			if(parentDragView.frame.size.height < dragView!.frame.origin.y + dragView!.frame.size.height){
				
				var frame = dragView.frame
				frame.origin.y = parentDragView.frame.size.height - dragView!.frame.size.height;
				dragView.frame = frame
			}
			
		}
		
		let translation = sender.translation(in: parentDragView)
		
//		print("x값 : \(sender.view!.center.x + translation.x)")
//		print("y값 : \(sender.view!.center.x + translation.x)")
		xTextField.text = dragView!.frame.origin.x.description
		yTextField.text = dragView!.frame.origin.y.description
		widthTextField.text = dragView!.frame.size.width.description
		heightTextField.text = dragView!.frame.size.height.description
		
		print("x값 : \(sender.view!.center.x + translation.x)")
		print("y값 : \(sender.view!.center.y + translation.y)")
		
		if(dragView!.frame.origin.x == 0){
			sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
		}
		if(dragView!.frame.origin.y == 0){
			sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
		}
		sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
		
		
		sender.setTranslation(CGPoint.zero, in: self.view)

		
	}
	
	
	func textFieldDidBeginEditing(_ textField: UITextField){
		
		let util = CommonUTIL()
		
		let bounds = UIScreen.main.bounds
		let width = bounds.size.width //화면 너비
//		let height = bounds.size.height //화면 높이
		
		var accessoryHeight : Float = 44.0
		var viewHeight : Float = 55.0
		
		textField.keyboardType = UIKeyboardType.numberPad
	
		if(UIDevice.current.modelName.isEqualToString(find: "iPhone 5")){
			
			accessoryHeight = accessoryHeight / 1.1;
			viewHeight = (viewHeight / 1.1) + 1.1;

			
		}else if(UIDevice.current.modelName.isEqualToString(find: "iphone 7")){
			
		}else if(UIDevice.current.modelName.isEqualToString(find: "iPhone 7 Plus")){
			
			accessoryHeight = accessoryHeight * 1.1;
			viewHeight = viewHeight * 1.1;
		}
		
		
		
		textField.keyboardAppearance = UIKeyboardAppearance.dark;
		
		//키패드 닫기 백그라운드 셋팅
		var rect = CGRect(origin: CGPoint(x: 0, y :0), size: CGSize(width: width, height: CGFloat(viewHeight)))
		let closeView = UIView.init(frame: rect)
		
		rect = CGRect(origin: CGPoint(x: 3.0, y :10.0), size: CGSize(width: width - 6.0, height: CGFloat(accessoryHeight)))
		
		//키패드 닫기 버튼 셋팅
		let closeButton = UIButton.init(frame: rect)
		closeButton.setTitle("닫기", for: .normal)
		closeButton.setTitleColor(util.UIColorFromRGB(rgbValue: 0x000000), for: .normal)
		closeButton.addTarget(self, action:#selector(keyboardCancel(sender:)) , for: .touchUpInside)
		
		closeButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 16.0)
		closeButton.titleLabel?.textColor = UIColor.black

		
//		closeButton.layer.shadowColor = UIColor.gray.cgColor;
//		closeButton.layer.shadowOpacity = 1;
//		closeButton.layer.shadowRadius = 0;
//		closeButton.layer.shadowOffset = CGSizeMake(0.0f,1.0f);
//		closeButton.layer.masksToBounds = NO;
		
		closeButton.layer.cornerRadius = 8;
		//	signupButton.clipsToBounds = YES;
		
		//	signupButton.highlighted = true;
		closeButton.backgroundColor = UIColor.clear
		
		
		closeView.addSubview(closeButton)
		
		textField.inputAccessoryView = closeView
		
		textField.inputAccessoryView?.backgroundColor = util.UIColorFromRGB(rgbValue: 0xD2D5DB)
		textField.inputAccessoryView?.alpha = 1.0
		
		print("keypad On")
		
	}
	
	@IBAction func resetButtonTapped(_ sender: UIButton) {
		
		var frame = dragView.frame
		frame.origin.x = 8.0
		frame.origin.y = 8.0
		frame.size.width = 100
		frame.size.height = 100
		dragView.frame = frame
		
		xTextField.text = dragView!.frame.origin.x.description
		yTextField.text = dragView!.frame.origin.y.description
		widthTextField.text = dragView!.frame.size.width.description
		heightTextField.text = dragView!.frame.size.height.description
		
	}
	
	@IBAction func confirmButtonTapped(_ sender: UIButton) {
		
		
		var frame = dragView.frame
		frame.origin.x = CGFloat((xTextField.text! as NSString).floatValue)
		frame.origin.y = CGFloat((yTextField.text! as NSString).floatValue)
		frame.size.width = CGFloat((widthTextField.text! as NSString).floatValue)
		frame.size.height = CGFloat((heightTextField.text! as NSString).floatValue)
		dragView.frame = frame
		
		xTextField.text = dragView!.frame.origin.x.description
		yTextField.text = dragView!.frame.origin.y.description
		widthTextField.text = dragView!.frame.size.width.description
		heightTextField.text = dragView!.frame.size.height.description

		
	}
	
	func keyboardCancel(sender: UIButton){
		
		view.endEditing(true)

		
	}

}
