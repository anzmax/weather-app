import UIKit

class AirInfoCell: UITableViewCell {
    
    static let id = "AirInfoCell"
    
    lazy var qualityLabel = RegularLabel(text: "Качество воздуха".localized, color: .customBlack, size: 18)
    lazy var numberLabel = RegularLabel(text: "42", color: .customBlack, size: 30)
    lazy var descriptionLabel = RegularLabel(text: .descriptionText, color: .customGray, size: 14)
    
    lazy var ratinglabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .customGreen
        label.text = "хорошо".localized
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.rubik(.regular, size: 16)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
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
        [qualityLabel, numberLabel, ratinglabel, descriptionLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            qualityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            qualityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            qualityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -130),
            
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            numberLabel.topAnchor.constraint(equalTo: qualityLabel.bottomAnchor, constant: 10),
            
            ratinglabel.widthAnchor.constraint(equalToConstant: 95),
            ratinglabel.heightAnchor.constraint(equalToConstant: 26),
            ratinglabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 15),
            ratinglabel.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10)
        ])
    }
}
