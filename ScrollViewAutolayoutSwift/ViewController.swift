//
//  ViewController.swift
//  ScrollViewAutolayoutSwift
//
//  Created by anoop mohanan on 03/11/17.
//  Copyright © 2017 anoop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var contentScrollView: UIScrollView!
    
    private var viewsArray = [CustomView]()
    private var viewsDict  = [String: Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        contentScrollView.isPagingEnabled = true
        setUpViews()
        layoutViews()
        //layoutViewsVertically()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*!
     Create an array of views that we need to load
     @param nil
     @result creates array of views and adds it to scrollview
     */
    
    func setUpViews() {
        viewsDict["parent"] = contentScrollView
        let count = 20
        //Lets layout 20 views
        for _ in 0...count {
            // I am loading the view from xib.
            if let contenView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?[0] as? CustomView{
                contenView.translatesAutoresizingMaskIntoConstraints = false
                // Layout the text and color
                contenView.layoutTheLabel()
                contentScrollView.addSubview(contenView)
                viewsArray.append(contenView)
            }

        }
    }
    
    /*!
     Method to layout the childviews in the scrollview.
     @param nil
     @result layout the child views
     */
    
    func layoutViews() {
        var horizontalString = ""
        // Keep the start of the horizontal constraint
        horizontalString += "H:|"
        for i in 0..<viewsArray.count {
            // Here I am providing the index of the array as the view name key in the dictionary
            viewsDict["v\(i)"] = viewsArray[i]
            // Since we are having only one view vertically, then we need to add the constraint now itself. Since we need to have fullscreen, we are giving height equal to the superview.
            let verticalString = "V:|[\("v\(i)")(==parent)]|"
            // add the constraint
            contentScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalString, options: [], metrics: nil, views: viewsDict))
            // Since we need to horizontally arrange, we construct a string, with all the views in array looped and here also we have fullwidth of superview.
            horizontalString += "[\("v\(i)")(==parent)]"
        }
        // Close the string with the parent
        horizontalString += "|"
        // apply the constraint
        contentScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalString, options: [], metrics: nil, views: viewsDict))
    }
    
    
    /*!
     Method to layout the childviews in the scrollview.
     @param nil
     @result layout the child views
     */
    
    func layoutViewsVertically() {
        var verticalString = ""
        // Keep the start of the vertical constraint
        verticalString += "V:|"
        for i in 0..<viewsArray.count {
            // Here I am providing the index of the array as the view name key in the dictionary
            viewsDict["v\(i)"] = viewsArray[i]
            // Since we are having only one view horizontally, then we need to add the constraint now itself. Since we need to have fullscreen, we are giving width equal to the superview.
            let horizontalString = "H:|[\("v\(i)")(==parent)]|"
            // add the constraint
            contentScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalString, options: [], metrics: nil, views: viewsDict))
            // Since we need to horizontally arrange, we construct a string, with all the views in array looped and here also we have fullwidth of superview.
            verticalString += "[\("v\(i)")(==parent)]"
        }
        // Close the string with the parent
        verticalString += "|"
        // apply the constraint
        contentScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalString, options: [], metrics: nil, views: viewsDict))
    }
}

