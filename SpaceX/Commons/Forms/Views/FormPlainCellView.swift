//
//  FormPlainCellView.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import UIKit

class FormPlainCellView: UITableViewCell, FormConformity {

    private lazy var lblPlaceholder: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()

    private lazy var imgRight: UIImageView = {
        let img = UIImageView(image: UIImage(named: "ic-check"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isHidden = true
        return img
    }()

    var formItem: FormItem?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupUI()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {

        contentView.addSubview(lblPlaceholder)
        contentView.addSubview(imgRight)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressAction))
        contentView.addGestureRecognizer(tapGesture)

        imgRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        imgRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        lblPlaceholder.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.M.rawValue).isActive = true
        lblPlaceholder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        lblPlaceholder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true
    }

    @objc
    func pressAction() {

        formItem?.actionCompletion?()
    }
}

extension FormPlainCellView: FormUpdatable {

    func update(with formItem: FormItem) {

        self.formItem = formItem

        self.lblPlaceholder.text = formItem.placeholder

        imgRight.isHidden = formItem.value != formItem.placeholder
    }
}
