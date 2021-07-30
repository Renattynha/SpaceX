//
//  FormActionCellView.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

class FormActionCellView: UITableViewCell, FormConformity {

    private lazy var lblValue: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalete.silver.toColor()
        lbl.numberOfLines = 0
        return lbl
    }()

    private lazy var lblPlaceholder: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
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

        contentView.addSubview(lblValue)
        contentView.addSubview(lblPlaceholder)
        contentView.addSubview(imgRight)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressAction))
        contentView.addGestureRecognizer(tapGesture)

        imgRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        imgRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        lblPlaceholder.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.M.rawValue).isActive = true
        lblPlaceholder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        lblPlaceholder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true

        lblValue.leadingAnchor.constraint(equalTo: lblPlaceholder.trailingAnchor, constant: Spacing.XS.rawValue).isActive = true
        lblValue.centerYAnchor.constraint(equalTo: lblPlaceholder.centerYAnchor).isActive = true
    }

    @objc
    func pressAction() {

        formItem?.actionCompletion?()
    }
}

extension FormActionCellView {

    override func setSelected(_ selected: Bool, animated: Bool) { }
}

extension FormActionCellView: FormUpdatable {

    func update(with formItem: FormItem) {

        self.formItem = formItem

        self.lblPlaceholder.text = formItem.placeholder
        self.lblValue.text = formItem.value

        imgRight.isHidden = self.lblValue != lblPlaceholder
    }
}
