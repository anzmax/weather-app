import UIKit

final class ForecastCell: UITableViewCell {
    
    static let id = "ForecastCell"
    
    lazy var forecastLabel = MediumLabel(text: "Ежедневный прогноз".localized, color: .customBlack, size: 18)
    
    lazy var detailButton: UIButton = {
        let button = UIButton()
        let titleString = "25 дней".localized
        let attributedTitle = NSMutableAttributedString(string: titleString)

        let rubikFont = UIFont.rubik(.regular, size: 16)
        attributedTitle.addAttribute(.font, value: rubikFont, range: NSRange(location: 0, length: titleString.count))
        attributedTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: titleString.count))

        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.customBlack, for: .normal) 

        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [forecastLabel, detailButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            forecastLabel.widthAnchor.constraint(equalToConstant: 200),
            forecastLabel.heightAnchor.constraint(equalToConstant: 22),
            forecastLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -144),
            forecastLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            forecastLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.5),
            forecastLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            detailButton.widthAnchor.constraint(equalToConstant: 83),
            detailButton.heightAnchor.constraint(equalToConstant: 20),
            detailButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            detailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
        ])
    }
}
