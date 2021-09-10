//
//  GameCell.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/31/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//  icons8.com - иконки

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var scoreOneLabel: UILabel! {
        didSet {
            scoreOneLabel.textColor = UIColor.black
            scoreOneLabel.textAlignment = .center
            scoreOneLabel.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    @IBOutlet weak var scoreTwoLabel: UILabel! {
        didSet {
            scoreTwoLabel.textColor = UIColor.black
            scoreTwoLabel.textAlignment = .center
            scoreTwoLabel.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    @IBOutlet weak var doublePointImage: UIImageView! {
        didSet {
            doublePointImage.image = UIImage(named: "doublePoint")
        }
    }
    @IBOutlet weak var nameOneButton: UIButton! {
        didSet {
            nameOneButton.tintColor = UIColor.black
            nameOneButton.titleLabel?.textAlignment = .center
            nameOneButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(15))
        }
    }
    @IBOutlet weak var nameTwoButton: UIButton! {
        didSet {
            nameTwoButton.tintColor = UIColor.black
            nameTwoButton.titleLabel?.textAlignment = .center
            nameTwoButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(15))
        }
    }
    @IBOutlet weak var flagHomeTeam: UIImageView!
    
    @IBOutlet weak var flagVisitorTeam: UIImageView!
    
    var game: Game?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIButton {
    func underlineText() {
        guard let title = title(for: .normal) else { return }
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(titleString, for: .normal)
    }
}
