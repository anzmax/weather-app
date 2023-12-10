import UIKit

class CurrentDayVC: UIViewController {
    
    private let currentDayView = CurrentDayView()
    var currentWeather: Weather?
    
    override func loadView() {
        view = currentDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDayView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        currentDayView.locationLabel.text = "\(currentWeather?.geoObject.locality.name ?? "")"
        
        currentDayView.update(currentWeather?.forecasts ?? [])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            if let dateCell = self.currentDayView.tableView.cellForRow(at: IndexPath(row: 0, section: CurrentCellType.dates.rawValue)) as? DateCell {
                dateCell.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
                dateCell.collectionView(dateCell.collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
            }
        }
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
