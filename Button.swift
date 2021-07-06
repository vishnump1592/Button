//
//  Button.swift
//  iOS Coding
//
//  Created by Vishnu M P on 06/07/21.
//

import UIKit

@IBDesignable
class Button: UIButton {
    
    @IBInspectable var border : CGFloat = 0.0 {
        didSet { self.layer.borderWidth = border }
    }
    
    @IBInspectable var textBelow : Bool = false {
        didSet {
            if textBelow == true {
                self.alignTextBelow()
            }
        }
    }
    
    @IBInspectable var bottomBorder : Bool = false {
        didSet {
            if bottomBorder {
                self.addBottomBorder()
            }
        }
    }
    
    @IBInspectable  var contentHAlignment : UIControl.ContentHorizontalAlignment = .left  {
        didSet { self.contentHorizontalAlignment = contentHAlignment }
    }
    
    @IBInspectable var contentVAlignment: UIControl.ContentVerticalAlignment = .center {
        didSet { self.contentVerticalAlignment = contentVAlignment }
    }
    
    @IBInspectable var shadow : Bool = false {
        didSet {
            self.layer.cornerRadius = 12
            self.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 3)
            self.layer.shadowOpacity = 0.7
            self.layer.shadowRadius = 5.0
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if textBelow {
            let padding : CGFloat = 8.0
            if let imageView = self.imageView {
                imageView.frame.origin.x = (self.bounds.size.width - imageView.frame.size.width) / 2.0
                imageView.frame.origin.y = max(0,(self.bounds.size.height - (imageView.frame.size.height + (titleLabel?.frame.size.height ?? 0.0) + padding)) / 2.0)
            }
            if let titleLabel = self.titleLabel {
                titleLabel.frame.origin.x = 0
                titleLabel.frame.origin.y = self.bounds.size.height - (titleLabel.frame.size.height + padding)
                titleLabel.frame.size.width = self.bounds.size.width
                titleLabel.textAlignment = .center
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
           let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude)) ?? .zero
           let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
           return desiredButtonSize
       }
}

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
    }
}



