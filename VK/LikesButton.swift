//
//  LikesButton.swift
//  VK
//
//  Created by пользовтель on 16.03.2021.
//

import UIKit

@IBDesignable class LikesButton: UIControl {
    @IBInspectable var likesCount: Int = 0 {
        didSet {
            updateLabelText ()
        }
    }
    @IBInspectable var imageLike: UIImage? = nil{
        didSet {
            likeImageView.image = imageLike
        }
    }
    
    private var stackView: UIStackView!
    private var likeImageView: UIImageView!
    private var likesLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func commonInit() {
        let likeImage = UIImage (named: "like-1")
        likesLabel = UILabel()
        likeImageView = UIImageView(image: likeImage)
        likeImageView.contentMode = .scaleAspectFit
        likesLabel.textAlignment = .left
        stackView = UIStackView (arrangedSubviews: [likesLabel,likeImageView])
        addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        updateSelectionState()
        
    }
    private func updateLabelText () {
        let addLike = isSelected ? 1 : 0
        likesLabel.text = "\(likesCount + addLike)"
    }
    private func updateSelectionState() {
        let colour = isSelected ? tintColor : .black
        UIImageView.transition(with: stackView, duration: 0.5, options: .transitionFlipFromBottom) {
            self.likesLabel.textColor = colour
            self.likeImageView.tintColor = colour
        } completion: { (success) in
            
        }

        updateLabelText ()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSelected = !isSelected
        updateSelectionState()
    }
}
