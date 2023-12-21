import UIKit

class LocationListVC: UIViewController {
    
    private let locationListView = LocationListView()
    private let locationArchiver = LocationsArchiver()
    private let weatherArchiver = WeatherArchiver()
    var locations: [Location] = []
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = locationListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
        //fetchLocations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchLocations()
    }
    
    func setupBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .customBlack

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .customBlack
    }
    
    //MARK: - Action
    @objc func plusButtonTapped() {
        coordinator.showSearchLocationScreen()
    }
    
    @objc func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchLocations() {
        locations = locationArchiver.fetch()
        locationListView.update(locations)
        locationListView.tableView.reloadData()
//        locations = weatherArchiver.fetch()
//        locationListView.update(locations)
//        locationListView.tableView.reloadData()
        
    }
}

