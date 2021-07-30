//
//  EmptyView.swift
//  SpaceX
//
//  Created by Renata Martins on 30/07/2021.
//

import UIKit

public enum EmptyType {

    case loading
    case error
    case empty
}

public protocol EmptyViewDelegate: AnyObject {

    func emptyViewDidTryToRetry()
}

public class EmptyView: UIView {

    private lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()

    private lazy var btRetry: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = ColorPalete.orange.toColor()
        bt.setTitle("empty-retry", for: .normal)
        bt.addTarget(self, action: #selector(retryAction), for: .touchUpInside)
        return bt
    }()

    private var loading: UIActivityIndicatorView = {
        var view: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            view = UIActivityIndicatorView(style: .large)
        } else {
            view = UIActivityIndicatorView(style: .gray)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()

    weak var delegate: EmptyViewDelegate?

    public init(type: EmptyType, delegate: EmptyViewDelegate? = nil) {

        self.delegate = delegate

        super.init(frame: .zero)

        self.configureEmptyView(type: type)
    }

    required public init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {

        super.layoutSubviews()

        defineSubviewConstraints()
    }

    private func defineSubviews() {

        addSubview(lblTitle)
        addSubview(btRetry)
        addSubview(loading)
    }

    private func defineSubviewConstraints() {

        lblTitle.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.M.rawValue).isActive = true

        btRetry.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        btRetry.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        btRetry.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true
        btRetry.heightAnchor.constraint(equalToConstant: Sizing.L.rawValue).isActive = true

        loading.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loading.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func configureEmptyView(type: EmptyType) {

        defineSubviews()

        btRetry.isHidden = type != .error
        loading.isHidden = type != .loading

        lblTitle.isHidden = type == .loading
        lblTitle.textAlignment = .center

        switch type {
        case .loading:
            loading.startAnimating()
        case .error:
            lblTitle.text = "error-title".localized
        case .empty:
            lblTitle.text = "empty-title".localized
        }
    }
}

extension EmptyView {

    @objc
    func retryAction() {
        delegate?.emptyViewDidTryToRetry()
    }
}
