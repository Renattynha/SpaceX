//
//  YearViewCell.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import UIKit

class YearViewCell: UITableViewCell {

    private var lblValue: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalete.black.toColor()
        return lbl
    }()

    private lazy var imgRight: UIImageView = {
        let img = UIImageView(image: UIImage(named: "ic-check"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        self.imgRight.isHidden = !selected
    }

    private func setup() {

        contentView.addSubview(imgRight)
        imgRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        imgRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        contentView.addSubview(lblValue)
        lblValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        lblValue.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.M.rawValue).isActive = true
        lblValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        lblValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true
    }
}

extension YearViewCell {

    public func configure(value: String) {

        self.lblValue.text = value
    }
}
