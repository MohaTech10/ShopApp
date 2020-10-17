import UIKit

private let cellId = "Cell"

class MainController: UICollectionViewController {
    
    // MARK: Properties
    
    private let searchController = UISearchController(searchResultsController: nil)  // where your result should be displayed
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavController()
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    fileprivate func setupNavController() {
        searchController.obscuresBackgroundDuringPresentation = false   //
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search Product", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderText])
        
        navigationItem.searchController = searchController
        definesPresentationContext = true   // to hide searchController when navigating to another screen
        navigationItem.title = "Shop"
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.productId)
        collectionView.register(CategoryContainerCell.self, forCellWithReuseIdentifier: CategoryContainerCell.categoryId)
        collectionView.register(SalesContainerCell.self, forCellWithReuseIdentifier: SalesContainerCell.salesId)
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInset = .init(top: -10, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 2 : 10
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryContainerCell.categoryId, for: indexPath)
                return cell
            case 1:  // this is the second cell in the first Section
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SalesContainerCell.salesId, for: indexPath)
                
                return cell
                
            default:
                break
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.productId, for: indexPath)
        cell.backgroundColor = .systemBackground
        return cell
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            switch indexPath.row {
                case 0:
                    return CGSize(width: view.frame.width, height: 100)
                    
                case 1:
                    return CGSize(width: view.frame.width, height: 230)  // Height of  the collectionView
                default:
                    break
                
            }
        }
        return CGSize(width: view.frame.width / 2, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
