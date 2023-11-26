import UIKit

class DailyCell: UITableViewCell {
    
    static let id = "DailyCell"
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
        let textColor = UIColor.customGray
        let attributedString = NSMutableAttributedString(string: "17/4", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.16
        ])
        label.attributedText = attributedString
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
        contentView.layer.cornerRadius = 5
        contentView.layer.backgroundColor = UIColor.customWhite.cgColor
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 53),
            dateLabel.heightAnchor.constraint(equalToConstant: 19),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -31)
        ])
    }
}
