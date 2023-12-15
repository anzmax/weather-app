import UIKit

class ContainerVC: UIPageViewController {
    
    private let coordinator: AppCoordinator
    private var weatherArchiver = WeatherArchiver()
    private var weatherService = WeatherService()
    
    var pageControl: UIPageControl?
    
    private var pages: [MainScreenVC] = []
    lazy var weatherData: [Weather] = []
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupData()
        setupBarButton()

        self.dataSource = self
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(handleLocationRemoval(notification:)), name: NSNotification.Name("LocationDidRemove"), object: nil)
    }
    
    func setupBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .customBlack
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "locationImage"), style: .plain, target: self, action: #selector(locationButtonTapped(_:)))
        navigationItem.rightBarButtonItem?.tintColor = .customBlack
    }
    
    @objc func settingsButtonTapped(_ sender: UIBarButtonItem) {
        coordinator.showSettingsViewController()
    }
    
    @objc func locationButtonTapped(_ sender: UIBarButtonItem) {
        coordinator.showListVC()
    }
    
//    @objc func handleLocationRemoval(notification: Notification) {
//        guard let userInfo = notification.userInfo,
//              let removedLocation = userInfo["removedLocation"] as? Location else { return }
//        
//        if let index = weatherData.firstIndex(where: { $0.geoObject.locality.name == removedLocation.name }) {
//            weatherData.remove(at: index)
//        }
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    func setupData() {
        let weathersFromArchiver = weatherArchiver.fetch()
        print(weathersFromArchiver.count)
        
        if weathersFromArchiver.isEmpty {
            
            weatherService.fetchWeather(latitude: 55.7522, longitude: 37.6156) { result in
                
                switch result {
                case .success(let weather):
                    self.weatherData.append(weather)
                    self.setupPages()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            weatherData = weathersFromArchiver
            self.setupPages()
        }
    }

    func setupPages() {
        setupPageControl()
        setupControllers()
    }
    
    func setupControllers() {
        for weather in weatherData {
            let mainVC = MainScreenVC(coordinator: coordinator)
            mainVC.currentWeather = weather
            print(weather)
            pages.append(mainVC)
        }

        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        self.title = "\(weatherData[0].geoObject.locality.name), \(weatherData[0].geoObject.country.name)"
    }
        
    func setupPageControl() {
        
        self.pageControl = UIPageControl(frame: CGRect(x: 0,
                                                       y: 80,
                                                       width: UIScreen.main.bounds.width,
                                                       height: 50))
        
        if let pageControl = self.pageControl {
            pageControl.numberOfPages = weatherData.count
            pageControl.currentPage = 0
            pageControl.alpha = 0.5
            pageControl.tintColor = UIColor.black
            pageControl.pageIndicatorTintColor = UIColor.gray
            pageControl.currentPageIndicatorTintColor = UIColor.black
            pageControl.isUserInteractionEnabled = false

            view.addSubview(pageControl)
        }
    }
}

extension ContainerVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainScreenVC,
              let currentIndex = pages.firstIndex(of: mainVC),
              currentIndex > 0 else {
            return nil
        }

        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainScreenVC,
              let currentIndex = pages.firstIndex(of: mainVC),
              currentIndex < pages.count - 1 else {
            return nil
        }
        
        return pages[currentIndex + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if completed, let currentVC = pageViewController.viewControllers?.first as? MainScreenVC,
           let currentIndex = pages.firstIndex(of: currentVC) {
            
            self.pageControl?.currentPage = currentIndex
            self.title = "\(weatherData[currentIndex].geoObject.locality.name), \(weatherData[currentIndex].geoObject.country.name)"
        }
    }
}


