//
//  MessageCell.swift
//  OSU!!
//
//  Created by 直井翔汰 on 2018/04/28.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class LetterCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.masksToBounds = true
            backView.layer.cornerRadius = 8
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundView?.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
