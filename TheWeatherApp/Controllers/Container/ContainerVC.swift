import UIKit

class ContainerVC: UIPageViewController {
    
    private var pages: [MainScreenVC] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
    }

    func addPage(for mainScreenVC: MainScreenVC) {
        mainScreenVC.pageChanged = { [weak self] index in
            self?.goToPage(index: index)
        }
        pages.append(mainScreenVC)

        // Обновление UIPageViewController, если это первая страница
        if pages.count == 1 {
            setViewControllers([mainScreenVC], direction: .forward, animated: true, completion: nil)
        }
    }

    private func goToPage(index: Int) {
        guard index < pages.count else { return }
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}

extension ContainerVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController as! MainScreenVC) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0, pages.count > previousIndex else {
            return nil
        }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController as! MainScreenVC) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else {
            return nil
        }

        return pages[nextIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first as? MainScreenVC, let index = pages.firstIndex(of: visibleViewController) {
            visibleViewController.mainScreenView.pageControl.currentPage = index
        }
    }
}
