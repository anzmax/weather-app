import UIKit

class HourlyCollectionCell: UICollectionViewCell {
    
    static let id = "HourlyCollectionCell"
        
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 12.5) ?? UIFont.systemFont(ofSize: 12.5)
        let textColor = UIColor.customBlack

        let attributedString = NSMutableAttributedString(string: "00:00", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.28
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
        let textColor = UIColor.customBlack

        let attributedString = NSMutableAttributedString(string: "23°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.28
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView ()
        view.image = UIImage(named: "sun")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with time: String) {
        timeLabel.text = time
    }
    
    private func setupViews() {
        contentView.layer.cornerRadius = 22
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.customLightBlue.cgColor
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.widthAnchor.constraint(equalToConstant: 37),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            tempLabel.widthAnchor.constraint(equalToConstant: 20),
            tempLabel.heightAnchor.constraint(equalToConstant: 18),
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 57),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

        ])
    }
}

class HourlyCell: UITableViewCell {
    
    static let id = "HourlyCell"
    
    var timeRange = ["00:00", "02:00", "04:00", "06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00",]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 43, height: 84)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.register(HourlyCollectionCell.self, forCellWithReuseIdentifier: HourlyCollectionCell.id)
        collection.delegate = self
        collection.dataSource = self
        
        
        return collection
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
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 85),
        ])
    }
}

extension HourlyCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        timeRange.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionCell.id, for: indexPath) as! HourlyCollectionCell
        let time = timeRange[indexPath.item]
        cell.update(with: time)
        return cell
    }
    
    
    
}
