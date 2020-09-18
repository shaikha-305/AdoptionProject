//
//  DesignableTextField.swift
//  Cats
//
//  Created by shaikha aljenaidel on 9/17/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import UIKit
    @IBDesignable
class DesignableTextField: UITextField {
        @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet{
                layer.cornerRadius = cornerRadius
            }
        }
        @IBInspectable var leftImage: UIImage? {
            didSet {
                updateView()
            }
        }
        @IBInspectable var leftPadding: CGFloat = 0 {
            didSet {
                updateView()
            }
        }
        
        func updateView(){
            if let image = leftImage {
                leftViewMode = .unlessEditing
                let imageView = UIImageView(frame: CGRect(x: leftPadding, y: -5, width: 25, height: 25))
                imageView.image = image
                imageView.tintColor = tintColor
                
                var width = leftPadding + 20
                if borderStyle == BorderStyle.none || borderStyle == BorderStyle.line {
                    width += 10
                }
                let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
                view.addSubview(imageView)
                
                leftView = view
                
            }else{
                // image is nill
                leftViewMode = .never
            }
            
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor : tintColor])
        }

}
