import UIKit

final class ExploreView: UIViewController {
    
    // MARK: - UI Elements
    
    private let customPageControl = CustomPageControl()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        setupCollectionView()
        setupSubviews()
        setupConstraints()
        setupCustomPageControl()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.register(FirstExploreCollectionViewCell.self, forCellWithReuseIdentifier: "FirstExploreCollectionViewCell")
        view.addSubview(collectionView)
    }

    private func cellSize(for collectionView: UICollectionView) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    private func setupSubviews() {
        [customPageControl].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func startButtonTapped() {
        print("Start button tapped")
    }
    
    // MARK: - CustomPageControl Setup
    
    private func setupCustomPageControl() {
        customPageControl.numberOfPages = 2
        customPageControl.currentPage = 0
        customPageControl.pageChangedHandler = { [weak self] currentPage in
            self?.handlePageChange(currentPage)
        }
    }
    
    private func handlePageChange(_ currentPage: Int) {
      
    }
}

extension ExploreView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstExploreCollectionViewCell", for: indexPath) as! FirstExploreCollectionViewCell
            cell.navigationController = self.navigationController
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
            
            let data = DetailData(
                backgroundImage: UIImage(named: "Canada"),
                exploreImage: UIImage(named: "Image"),
                name: "King + Duke",
                rating: "4.5",
                description: """
                    One of EATER National and Atlanta Magazine’s most
                    anticipated new openings of 2013. This new restaurant by
                    Ford Fry and Rocket Farm, designed by Meyer Davis and NO
                    Architecture, is located at the corner of West Paces Ferry.
                """,
                avatarImage: UIImage(systemName: "person"),
                reviewerName: "Reviewer Name",
                additionalInfo: "2 weeks ago"
            )
            
            cell.configure(with: data)
            
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize(for: collectionView)
    }
}

extension ExploreView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        customPageControl.currentPage = currentPage
    }
}
