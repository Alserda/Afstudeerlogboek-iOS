//
//  AddPostViewController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textField: UITextView!
    @IBOutlet var datepickerContainer: UIView!
    @IBOutlet var dateField: UITextField!
    let placeholderText: String = "Logboek bericht"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        styleApplication()
    }
    
    func styleApplication() {
        saveButton.layer.cornerRadius = 3
        saveButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: -10, bottom: 0, right: 0)
        textField.delegate = self
        textField.text = placeholderText
        textField.textColor = saaaColor.lighterGrey
        textField.contentInset = UIEdgeInsetsMake(0, -4, 0, 0)
        
        dateField.delegate = self
        dateField.text = NSDate().dayMonthYear()
        datepickerContainer.hidden = true
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidChangeSelection(textView: UITextView) {
        if (textView.text == placeholderText && textView.textColor == saaaColor.lighterGrey) {
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.selectedRange = NSMakeRange(0, 0)
    }
    
    func textViewDidChange(textView: UITextView) {

        if (textView.text.characters.count != 0 && textView.text.substringFromIndex(textView.text.startIndex) == placeholderText && textView.textColor == saaaColor.lighterGrey) {
            textView.text = textView.text.substringToIndex(textView.text.startIndex)
            textView.textColor = saaaColor.lightGrey
        } else if (textView.text.characters.count == 0) {
            textView.text = placeholderText
            textView.textColor = saaaColor.lighterGrey
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if (textView.text == "") {
            textView.text = placeholderText
            textView.textColor = saaaColor.lighterGrey
        }
        textView.resignFirstResponder()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (textView.text.characters.count > 1 && textView.text == placeholderText) {
            textView.text = ""
            textView.textColor = saaaColor.lightGrey
        }
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
                print(__FUNCTION__)
        
//        UIView.transitionWithView(datepickerContainer, duration: 1, options: .TransitionCurlUp, animations: nil, completion: nil)
        
        
        
        let transition = CATransition()
        transition.duration = 0.5
        datepickerContainer.layer.addAnimation(transition, forKey: nil)
        datepickerContainer.hidden = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
                print(__FUNCTION__)
        let transition = CATransition()
        transition.duration = 0.3
        datepickerContainer.layer.addAnimation(transition, forKey: nil)
        datepickerContainer.hidden = true
    }
    
    
    
    
    
}









