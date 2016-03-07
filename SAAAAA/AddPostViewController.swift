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
    @IBOutlet var datepickerContainer: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var textFieldContainerTopConstraint: NSLayoutConstraint!
    @IBOutlet var textFieldContainerBottomConstraint: NSLayoutConstraint!
    @IBOutlet var altSaveButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var altSaveButtonBottomConstraint: NSLayoutConstraint!
    let placeholderText: String = "Logboek bericht"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        styleApplication()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        print("Date: \(datePicker.date), text you've written: \(textField.text)")
    }
    
    @IBAction func altButtonPressed(sender: AnyObject) {
        view.endEditing(true)
        changeDatepickerAppearance(0.2, hidden: true)
        showInitialSizedView()
    }
    

    
    @IBAction func pickedDate(sender: AnyObject) {
        dateLabel.text = NSDate().formatDateToDayMonthYear(datePicker.date)
    }

    
    func styleApplication() {
        altSaveButton.layer.cornerRadius = 3
        saveButton.layer.cornerRadius = 3
        saveButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: -10, bottom: 0, right: 0)
        textField.delegate = self
        textField.text = placeholderText
        textField.textColor = saaaColor.lighterGrey
        textField.contentInset = UIEdgeInsetsMake(0, -4, 0, 0)
        datepickerContainer.hidden = true
        dateLabel.text = NSDate().currentDateInDayMonthYear()
    }

    func textViewDidChangeSelection(textView: UITextView) {
        if (textView.text == placeholderText && textView.textColor == saaaColor.lighterGrey) {
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.selectedRange = NSMakeRange(0, 0)
        
        if (datepickerContainer.hidden == false) {
            let transition = CATransition()
            transition.duration = 0.3
            datepickerContainer.layer.addAnimation(transition, forKey: nil)
            datepickerContainer.hidden = true
        }
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
    
    func keyboardWillShow(aNotification: NSNotification) {
        showResponsiveSizedView()
    }
    
    func keyboardWillHide(aNotification: NSNotification) {
        showInitialSizedView()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        for touch in touches {
            if touch.view == dateLabel {
                changeDatepickerAppearance(0.4, hidden: false)
                showResponsiveSizedView()
            } else if (touch.view != dateLabel && datepickerContainer.hidden == false) {
                changeDatepickerAppearance(0.2, hidden: true)
                showInitialSizedView()
            }
        }
    }
    
    func showResponsiveSizedView() {
        textFieldContainerTopConstraint.constant = 6
        textFieldContainerBottomConstraint.constant = 110
        altSaveButton.hidden = false
        saveButton.hidden = true
    }
    
    func showInitialSizedView() {
        textFieldContainerTopConstraint.constant = 21
        textFieldContainerBottomConstraint.constant = 20
        altSaveButton.hidden = true
        saveButton.hidden = false
    }

    func changeDatepickerAppearance(duration: CFTimeInterval, hidden: Bool) {
        let transition = CATransition()
        transition.duration = duration
        datepickerContainer.layer.addAnimation(transition, forKey: nil)
        datepickerContainer.hidden = hidden
    }
    
}









