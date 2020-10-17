import UIKit

class CategoryCell: BaseCell {
    static let cellId = "cellId"
    // MARK: Cutom Properties
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "denise-jans-FQn62guPluA-unsplash")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints  = false
        iv.clipsToBounds = true
        return iv
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Shirts"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(label)
//        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
       
        imageView.heightAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.layer.cornerRadius = frame.width / 2
    }
}
