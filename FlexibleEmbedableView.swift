//
//  FlexibleEmbedableView.swift
//  TinTile
//
//  Created by Angad Nadkarni on 10/07/16.
//  Copyright © 2016 Hullo Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import SnapKit

protocol FitSuperviewHeightView: class {

}

extension FitSuperviewHeightView {
    func fitHeight(view: UIView) {
        (self as! UIView).snp_makeConstraints { make in
            make.height.equalTo(view)
        }
    }

    func fitSuperviewHeight() {
        fitHeight((self as! UIView).superview!)
    }
}

protocol FitSuperviewView: FitSuperviewHeightView {

}

extension FitSuperviewView {
    func fit(view: UIView) {
        (self as! UIView).snp_makeConstraints { make in
            make.size.equalTo(view)
            make.center.equalTo(view)
        }
    }

    func fitSuperview() {
        fit((self as! UIView).superview!)
    }
}

protocol FlexibleEmbedableView: FitSuperviewView {
    func addSubview(view: UIView)
    func setup(nibName: String)

    func viewWillRender(view: UIView)
    func viewDidRender(view: UIView)
}

extension FlexibleEmbedableView {
    func setup(nibName: String) {
        // Inflate our nib
        let view = UINib(nibName: nibName, bundle: NSBundle(
            forClass: self.dynamicType
        )).instantiateWithOwner(self, options: nil)[0] as! UIView

        // Add our view
        self.viewWillRender(view)
        self.addSubview(view)
        self.viewDidRender(view)
    }

    func viewWillRender(view: UIView) {

    }

    func viewDidRender(view: UIView) {

    }
}
