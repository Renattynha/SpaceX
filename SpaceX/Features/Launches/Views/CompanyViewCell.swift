//
//  CompanyViewCell.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

class CompanyViewCell: UITableViewCell {

    private lazy var lblInfo: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = ColorPalete.black.toColor()
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {

        contentView.addSubview(lblInfo)
        lblInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        lblInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        lblInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        lblInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
}

extension CompanyViewCell {

    public func configure(info: String) {

        self.lblInfo.text = info
    }
}
