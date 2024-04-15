import UIKit

struct DetailData {
    let backgroundImage: UIImage?
    let exploreImage: UIImage?
    let name: String
    let rating: String
    let description: String
    let avatarImage: UIImage?
    let reviewerName: String
    let additionalInfo: String
}


final class DetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let exploreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.customYellow
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let text: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 10)
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let reviewerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Colors.customBlue
        return label
    }()
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(backgroundImage)
        addSubview(whiteView)
        
        whiteView.addSubview(exploreImageView)
        whiteView.addSubview(nameLabel)
        whiteView.addSubview(ratingIcon)
        whiteView.addSubview(ratingLabel)
        whiteView.addSubview(text)
        whiteView.addSubview(avatarImageView)
        whiteView.addSubview(reviewerLabel)
        whiteView.addSubview(additionalLabel)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            whiteView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            whiteView.heightAnchor.constraint(equalToConstant: 380),
            
            exploreImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 5),
            exploreImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 5),
            exploreImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -5),
            exploreImageView.heightAnchor.constraint(equalToConstant: 180),
            
            nameLabel.topAnchor.constraint(equalTo: exploreImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            
            ratingLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            
            ratingIcon.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            ratingIcon.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -5),
            ratingIcon.widthAnchor.constraint(equalToConstant: 20),
            ratingIcon.heightAnchor.constraint(equalToConstant: 20),
            
            text.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            text.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            
            avatarImageView.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 25),
            avatarImageView.heightAnchor.constraint(equalToConstant: 25),
            
            reviewerLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            reviewerLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            additionalLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            additionalLabel.leadingAnchor.constraint(equalTo: reviewerLabel.trailingAnchor, constant: 10),
        ])
    }
    
    // MARK: - Configure cell with data
    
    func configure(with data: DetailData) {
        backgroundImage.image = data.backgroundImage
        exploreImageView.image = data.exploreImage
        nameLabel.text = data.name
        ratingLabel.text = data.rating
        text.text = data.description
        avatarImageView.image = data.avatarImage
        reviewerLabel.text = data.reviewerName
        additionalLabel.text = data.additionalInfo
        ratingIcon.image = UIImage(systemName: "star.fill")
    }
}
