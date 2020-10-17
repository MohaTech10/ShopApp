import UIKit

class SalesContainerCell: BaseCell {
    static let salesId = "salesId"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    override func setupViews() {
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.delegate = self    // Protocol
        collectionView.dataSource = self  // Protocol
        collectionView.register(SalesCell.self, forCellWithReuseIdentifier: "saleCell")
    }
}

extension SalesContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "saleCell", for: indexPath)
//        cell.backgroundColor = .green
//        cell.layer.cornerRadius = 7
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}

extension SalesContainerCell: UICollectionViewDelegateFlowLayout {
    // Cell sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let properHeight: CGFloat = 230 - 40
        
        return CGSize(width: frame.width / 1.3, height: properHeight)  // height the cell itself
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 40, left: 12, bottom: 0, right: 12)
    }
}


class SalesCell: BaseCell {
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ashkan-forouzani-sUlR4Iul-9c-unsplash")
        iv.layer.cornerRadius = 5
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints  = false
        iv.clipsToBounds = true
        return iv
    }()
    override func setupViews() {
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
