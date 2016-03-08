//
//  LogDetail.swift
//  SAAAAA
//
//  Created by Peter Alserda on 07/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class LogDetail: UIViewController {
    var scrollView: UIScrollView = UIScrollView()
    let topContainer: UIView = UIView()
    let dateLabel: UILabel = UILabel()
    let authorLabel: UILabel = UILabel()
    let bottomContainer: UIView = UIView()
    let postTextView: UITextView = UITextView()
    var post: Post = Post()
    
    override func viewDidLoad() {
        print(__FUNCTION__)
        print(post)
        addScrollView()
        addTopContainer()
        addDateLabel()
        addAuthorLabel()
        addBottomContainer()
        addPostTextField()
        adjustTextViewHeight()
    }
    
    
    func addScrollView() {
        scrollView.backgroundColor = saaaColor.lightBackground
        scrollView.scrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.frame = view.frame
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.autoresizesSubviews = true
        view.addSubview(scrollView)
    }
    
    func addTopContainer() {
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.backgroundColor = UIColor.whiteColor()
        scrollView.addSubview(topContainer)
    }
    
    func addDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont(name: "PTSans-Bold", size: 17)
        dateLabel.textColor = saaaColor.darkestBlack
        
        dateLabel.text = NSDate().formatDateToDayMonthYear(String().formatDate(post.date))
        topContainer.addSubview(dateLabel)
        
        dateLabel.topAnchor.constraintEqualToAnchor(topContainer.topAnchor, constant: 20).active = true
        dateLabel.leftAnchor.constraintEqualToAnchor(topContainer.leftAnchor, constant: 30).active = true

    }
    
    func addAuthorLabel() {
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont(name: "PTSans-Regular", size: 15)
        authorLabel.text = "door \(post.author)"
        authorLabel.textColor = saaaColor.darkBlack
        
        topContainer.addSubview(authorLabel)
        
        authorLabel.topAnchor.constraintEqualToAnchor(dateLabel.bottomAnchor, constant: 0).active = true
        authorLabel.leftAnchor.constraintEqualToAnchor(topContainer.leftAnchor, constant: 30).active = true
    }
    
    func addBottomContainer() {
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.backgroundColor = UIColor.whiteColor()
        scrollView.addSubview(bottomContainer)
    }
    
    func addPostTextField() {
        postTextView.translatesAutoresizingMaskIntoConstraints = false
        postTextView.text = post.body
        postTextView.contentInset = UIEdgeInsetsMake(0, -6, 0, 0)
        postTextView.scrollEnabled = false
        postTextView.textColor = saaaColor.lightGrey
        postTextView.font = UIFont(name: "PTSans-Regular", size: 15)
        
        postTextView.frame = CGRectMake(0, 0, view.frame.width - 60, 200)
        
        bottomContainer.addSubview(postTextView)
    }
    
    func adjustTextViewHeight() {
        let fixedWidth = postTextView.frame.size.width
        let newSize = postTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = postTextView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        topContainer.constrainToSize(CGSize(width: view.bounds.size.width, height: 69))
        topContainer.centerWithTopMarginInView(scrollView, placeUnderViews: nil, topMargin: 0)

        bottomContainer.constrainToSize(CGSize(width: view.bounds.size.width, height: newFrame.height + 30))
        bottomContainer.centerWithTopMarginInView(scrollView, placeUnderViews: [topContainer], topMargin: 0)
        
        postTextView.topAnchor.constraintEqualToAnchor(bottomContainer.topAnchor, constant: 0).active = true
        postTextView.leftAnchor.constraintEqualToAnchor(bottomContainer.leftAnchor, constant: 30).active = true
        postTextView.centerWithTopMarginInView(bottomContainer, placeUnderViews: nil, topMargin: 0)
        postTextView.constrainToSize(CGSizeMake(postTextView.frame.width, newFrame.height))
        
        scrollView.contentSize = CGSize(width: view.bounds.size.width, height: newFrame.height + 250)
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

