//
//  AvatarView.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 06.07.2021.
//

import Foundation
import UIKit

@IBDesignable
class AvatarView: UIView {
    
    @IBInspectable
    var shadowColor: UIColor = .black {
        didSet {
            self.updateShadowColor()
        }
    }
    
    @IBInspectable
    var shadowWidth: CGFloat = 5 {
        didSet {
            self.updateShadowWidth()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 5 {
        didSet {
            self.updateShadowOpacity()
        }
    }
    
    @IBInspectable
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = image
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])
        
        self.backgroundColor = .clear
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 2
        imageView.contentMode = .scaleAspectFill
    }
    
    func updateShadowOpacity() {
        self.layer.shadowOpacity = shadowOpacity
    }
    
    func updateShadowWidth() {
        self.layer.shadowRadius = shadowWidth
    }
    
    func updateShadowColor() {
        self.layer.shadowColor = shadowColor.cgColor
    }
    
}

