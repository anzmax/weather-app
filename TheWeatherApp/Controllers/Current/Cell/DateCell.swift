import UIKit

class DateCollectionCell: UICollectionViewCell {
    
    static let id = "DateCollectionCell"
    
    lazy var dateLabel = RegularLabel(text: "00/00", color: .black, size: 17)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.layer.cornerRadius = 5
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 70),
            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
        ])
    }
    
    //MARK: - Update
    func update(with date: String) {
        dateLabel.text = date
    }
}

//MARK: - TableViewCell
class DateCell: UITableViewCell {
    
    var onDateCellTapped: ((Int)->())?
    
    static let id = "DateCell"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 107, height: 36)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 18
        
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.register(DateCollectionCell.self, forCellWithReuseIdentifier: DateCollectionCell.id)
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
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
}

//MARK: - Delegate
extension DateCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        generateDateRange().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionCell.id, for: indexPath) as! DateCollectionCell
        let date = generateDateRange()[indexPath.row]
        cell.update(with: date)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DateCollectionCell
        cell.contentView.backgroundColor = .customBlue
        cell.dateLabel.textColor = .white
        onDateCellTapped?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DateCollectionCell {
            cell.contentView.backgroundColor = .white
            cell.dateLabel.textColor = .black
        }
    }
}
