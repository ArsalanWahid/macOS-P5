//
//  ViewController.swift
//  VFL
//
//  Created by Arsalan Wahid Asghar on 12/01/2021.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createVFL()
    }
    
    func makeView(_ number: Int) -> NSView {
        let vw = NSTextField(labelWithString: "View \(number)")
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.alignment = .center
        vw.wantsLayer = true
        vw.layer?.backgroundColor = NSColor.cyan.cgColor
        return vw
    }
    
    func createVFL(){
        // set up a dictionary of string and views
        let textFields = [
            "view0": makeView(0),
            "view1": makeView(1),
            "view2": makeView(2),
            "view3": makeView(3),
        ]
        
        //Loop over each item
        for(name, view) in textFields {
            //add to parentview
            view.addSubview(view)
            // add horizontal constaints telling this views to stretch from edge to edge
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(name)]|", options: [], metrics: nil, views: textFields))
        }
        
        // add a set of constraints that align the views vertically, one above the other
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view0]-[view1]-[view2]--[view3]|", options: [], metrics: nil, views: textFields))
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

