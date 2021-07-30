//
//  RowView.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

class RowView: UIView {

    private var lblKey: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalete.silver.toColor()
        return lbl
    }()

    private var lblValue: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalete.black.toColor()
        return lbl
    }()

    init(key: String, value: String) {

        self.lblKey.text = key
        self.lblValue.text = value

        super.init(frame: .zero)

        self.setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {

        self.addSubview(lblKey)
        self.addSubview(lblValue)

        lblKey.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lblKey.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lblKey.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        lblValue.topAnchor.constraint(equalTo: lblKey.topAnchor).isActive = true
        lblValue.bottomAnchor.constraint(equalTo: lblKey.bottomAnchor).isActive = true
        lblValue.leadingAnchor.constraint(equalTo: lblKey.trailingAnchor, constant: Spacing.XS.rawValue).isActive = true
    }
}

