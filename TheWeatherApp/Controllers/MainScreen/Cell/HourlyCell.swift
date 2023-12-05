import UIKit

final class HourlyCollectionCell: UICollectionViewCell {
    
    static let id = "HourlyCollectionCell"
        
    lazy var timeLabel = RegularLabel(text: "00:00", color: .customBlack, size: 12.5)
    lazy var tempLabel = RegularLabel(text: "23°", color: .customBlack, size: 12)
    lazy var imageView = CustomImageView(named: "sun")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.layer.cornerRadius = 22
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.customDarkBlue.cgColor

        [timeLabel, tempLabel, imageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
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
    
    //MARK: - Update
    func updateHour(with hour: Hour) {
        timeLabel.text = formattedTime(hourString: hour.hour)
        tempLabel.text = "\(hour.temp)°"
    }
}

class HourlyCell: UITableViewCell {
    
    static let id = "HourlyCell"
    
    var hours: [Hour] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 43, height: 84)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
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
    
    //MARK: - Update
    func update(_ hours: [Hour]) {
        var result: [Hour] = []
        for (index, hour) in hours.enumerated() {
            
            if index % 3 == 0 {
                result.append(hour)
            }
        }
        self.hours = result
    }
}

//MARK: - Extension
extension HourlyCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionCell.id, for: indexPath) as! HourlyCollectionCell
        let hour = hours[indexPath.row]
        cell.updateHour(with: hour)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HourlyCollectionCell
        cell.contentView.backgroundColor = .customBlue
        cell.timeLabel.textColor = .white
        cell.tempLabel.textColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HourlyCollectionCell
        cell.contentView.backgroundColor = .white
        cell.timeLabel.textColor = .black
        cell.tempLabel.textColor = .black
    }
}
