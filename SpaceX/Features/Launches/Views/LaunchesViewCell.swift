//
//  LaunchesViewCell.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import UIKit
import Kingfisher

class LaunchesViewCell: UITableViewCell {

    private lazy var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "ic-placeholder"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = ColorPalete.gray.toColor()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()

    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.clipsToBounds = true
        return stack
    }()

    private lazy var btLaunchSuccess: UIButton = {
        let bt = UIButton(type: .custom)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.isUserInteractionEnabled = false
        bt.setImage(UIImage(named: "ic-launch-success"), for: .selected)
        bt.setImage(UIImage(named: "ic-launch-failed"), for: .normal)
        return bt
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        contentStackView.removeAllArrangedSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) { }

    private func setup() {

        contentView.addSubview(img)
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.M.rawValue).isActive = true
        img.heightAnchor.constraint(equalToConstant: Sizing.L.rawValue).isActive = true
        img.widthAnchor.constraint(equalToConstant: Sizing.L.rawValue).isActive = true

        contentView.addSubview(btLaunchSuccess)
        btLaunchSuccess.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        btLaunchSuccess.topAnchor.constraint(equalTo: img.topAnchor).isActive = true

        contentView.addSubview(contentStackView)
        contentStackView.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: Spacing.M.rawValue).isActive = true
        contentStackView.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: btLaunchSuccess.leadingAnchor, constant: -Spacing.S.rawValue).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true
    }
}

extension LaunchesViewCell {

    public func configure(launch: Launch) {

        let launchView = LaunchView(launchValidator: LaunchViewValidator(launch: launch))
        img.kf.setImage(with: URL(string: launch.links.mission_patch ?? ""))

        btLaunchSuccess.isSelected = launchView.sucess
        for row in launchView.rows {
            let rowView = RowView(key: row.key, value: row.value ?? "")
            contentStackView.addArrangedSubview(rowView)
        }
    }
}
