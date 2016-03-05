//
//  AddPostViewController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textField: UITextView!
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
        textField.textColor = UIColor.redColor()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidChangeSelection(textView: UITextView) {
        if (textView.text == placeholderText && textView.textColor == UIColor.redColor()) {
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
    func textViewDidChange(textView: UITextView) {

        if (textView.text.characters.count != 0 && textView.text.substringFromIndex(textView.text.startIndex) == placeholderText && textView.textColor == UIColor.redColor()) {
            textView.text = textView.text.substringToIndex(textView.text.startIndex)
            textView.textColor = UIColor.blackColor()
        } else if (textView.text.characters.count == 0) {
            textView.text = placeholderText
            textView.textColor = UIColor.redColor()
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if (textView.text == "") {
            textView.text = placeholderText
            textView.textColor = UIColor.redColor()
        }
        textView.resignFirstResponder()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (textView.text.characters.count > 1 && textView.text == placeholderText) {
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
        return true
    }
    
    
}