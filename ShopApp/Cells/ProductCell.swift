import UIKit

class ProductCell: BaseCell {
    static let productId = "productId"
    private let productImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "wengang-zhai-_fOL6ebfECQ-unsplash")
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let productInfo: UILabel = {
        let nameLabel = UILabel()
        let attributedText = NSMutableAttributedString(string: "Kobe Mamba Focus", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: "\nBasketball Shoes", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
        attributedText.append(NSAttributedString(string: "\n$19023999", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
//        nameLabel.textAlignment = .center
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 4
//        let range = NSMakeRange(0, attributedText.length)
//        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        nameLabel.attributedText  = attributedText
        
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.textColor = .label
        return nameLabel
    }()
    override func setupViews() {
        addSubview(productImage)
        addSubview(productInfo)
        //        left  => Positive
        //        right => - Value
        productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        productImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        productImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        // 4 Constraint
        
        productImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        productInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        productInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        productInfo.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 12).isActive = true
//        productInfo.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
