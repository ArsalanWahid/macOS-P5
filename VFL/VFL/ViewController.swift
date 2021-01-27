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
        //        createVFL()
        //        createAnchors()
    }
    
    func makeView(_ number: Int) -> NSView {
        let vw = NSTextField(labelWithString: "View #\(number)")
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.alignment = .center
        vw.wantsLayer = true
        vw.layer?.backgroundColor = NSColor.cyan.cgColor
        return vw
    }
    
    //wMARK:- VFL
    func createVFL() {
        //set up a dictionary of strings and views
        let textFields = [
            "view0": makeView(0),
            "view1": makeView(1),
            "view2": makeView(2),
            "view3": makeView(3),
        ]
        
        // loop over each item
        for (name, textField) in textFields {
            // add it to our view
            view.addSubview(textField)
            
            // add horizontal constraints saying that this view should stretch from edge to edge
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[\(name)(>=100)]-15-|", options: [], metrics: nil, views: textFields))
        }
        
        // add another set of constraints that cause the views to be aligned vertically, one above the other
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view0]-[view1]-[view2]-10-[view3(>=300)]-|", options: [], metrics: nil, views: textFields))
    }
    
    //MARK:- Anchors
    func createAnchors() {
        //create a var to track previos view added
        var previous: NSView!
        
        //Make four views and put them in an array
        let views = [makeView(0),makeView(1),makeView(2),makeView(3)]
        
        for vw in views {
            //add the view to the superview
            view.addSubview(vw)
            
            //set the anchors, where are the docs for anchors??
            vw.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            vw.heightAnchor.constraint(equalToConstant: 88).isActive = true
            vw.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            // If prev view exists vertically position current view 10 pts away from it
            if previous != nil {
                vw.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            }else{
                vw.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            }
            previous = vw
        }
        previous.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

