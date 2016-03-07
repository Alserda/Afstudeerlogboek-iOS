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
    
    override func viewDidLoad() {
        print(__FUNCTION__)
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
        
        dateLabel.text = "4 Maart 2016"
        topContainer.addSubview(dateLabel)
        
        dateLabel.topAnchor.constraintEqualToAnchor(topContainer.topAnchor, constant: 20).active = true
        dateLabel.leftAnchor.constraintEqualToAnchor(topContainer.leftAnchor, constant: 30).active = true

    }
    
    func addAuthorLabel() {
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont(name: "PTSans-Regular", size: 15)
        authorLabel.text = "door Peter"
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
        postTextView.text = "Lorem pot its fo rizzle mofo amizzle, shit adipiscing you son of a bizzle. Yippiyo sapien velizzle, away volutpat, gangster bizzle, uhuh ... yih! vizzle, ass. Pellentesque rizzle tortizzle. The bizzle erizzle. \n \nGet down get down gangster dolizzle dapibus fo shizzle tempizzle owned. Maurizzle pellentesque nibh we gonna chung turpizzle. Hizzle in tortor. Phat eleifend rhoncus shiznit. In hizzle phat platea dictumst. Ghetto ghetto. Curabitizzle daahng dawg urna, pretium izzle, hizzle uhuh ... yih!, eleifend vitae, nunc. Cool suscipit. Dawg semper velit sizzle cool.Lorem pot its fo rizzle mofo amizzle, shit adipiscing you son of a bizzle. \n \nYippiyo sapien velizzle, away volutpat, gangster bizzle, uhuh ... yih! vizzle, ass. Pellentesque rizzle tortizzle. The bizzle erizzle. Get down get down gangster dolizzle dapibus fo shizzle tempizzle owned. Maurizzle pellentesque nibh we gonna chung turpizzle. Hizzle in tortor. Phat eleifend rhoncus shiznit. In hizzle phat platea dictumst. \n \nGhetto ghetto. Curabitizzle daahng dawg urna, pretium izzle, hizzle uhuh ... yih!, eleifend vitae, nunc. Cool suscipit. Dawg semper velit sizzle cool."
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

