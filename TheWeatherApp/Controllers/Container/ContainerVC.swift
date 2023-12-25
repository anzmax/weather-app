import UIKit
import CoreData

class ContainerVC: UIPageViewController {
    
    private let coordinator: AppCoordinator
    private var weatherArchiver = WeatherArchiver()
    private var weatherService = WeatherService()
    private let coreDataService = CoreDataService()
    
    private var weatherData: [WeatherModel] = []
    private var pages: [MainScreenVC] = []
    
    var pageControl: UIPageControl?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBarButton()
        setupPageControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWeatherDataAndUpdateUI()
    }

    private func loadWeatherDataAndUpdateUI() {
        weatherData = coreDataService.fetchWeather()
        setupPages()
    }

    private func setupPages() {
        setupControllers()
        updatePageControl()
        updateTitleBasedOnCurrentPage()
    }
    
    private func setupControllers() {
        pages = weatherData.map { weather in
            let mainVC = MainScreenVC(coordinator: coordinator)
            mainVC.currentWeather = weather
            return mainVC
        }

        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }

    private func updatePageControl() {
        pageControl?.numberOfPages = weatherData.count
        pageControl?.currentPage = 0
    }

    private func updateTitleBasedOnCurrentPage() {
        if let currentPage = viewControllers?.first as? MainScreenVC,
           let currentIndex = pages.firstIndex(of: currentPage) {
            let currentWeather = weatherData[currentIndex]
            title = "\(currentWeather.geoObject?.locality?.name ?? ""), \(currentWeather.geoObject?.country?.name ?? "")"
        }
    }
    
    private func setupPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 50))
        pageControl?.alpha = 0.5
        pageControl?.tintColor = .black
        pageControl?.pageIndicatorTintColor = .gray
        pageControl?.currentPageIndicatorTintColor = .black
        pageControl?.isUserInteractionEnabled = false
        view.addSubview(pageControl!)
    }
    
    private func setupBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .customBlack
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "locationImage"), style: .plain, target: self, action: #selector(locationButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .customBlack
    }
    
    @objc private func settingsButtonTapped() {
        coordinator.showSettingsViewController()
    }
    
    @objc private func locationButtonTapped() {
        coordinator.showListVC()
    }
}

extension ContainerVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let mainVC = viewController as? MainScreenVC,
              let currentIndex = pages.firstIndex(of: mainVC),
              currentIndex > 0 else {
            return nil
        }

        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let mainVC = viewController as? MainScreenVC,
              let currentIndex = pages.firstIndex(of: mainVC),
              currentIndex < pages.count - 1 else {
            return nil
        }
        
        return pages[currentIndex + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentVC = pageViewController.viewControllers?.first as? MainScreenVC,
           let currentIndex = pages.firstIndex(of: currentVC) {
            pageControl?.currentPage = currentIndex
            updateTitleBasedOnCurrentPage()
        }
    }
}
