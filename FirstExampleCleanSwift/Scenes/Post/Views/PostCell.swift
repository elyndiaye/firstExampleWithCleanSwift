import UIKit

class PostCell: UITableViewCell {
    
    static let cellIdentifier = "postCell"
    
    let titleLabel: UILabel
    let contentLabel: UILabel
    
    private struct ViewTraits {
        static let margin: CGFloat = 16.0
        static let titleFontSize: CGFloat = 14.0
        static let contentFontSize: CGFloat = 12.0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        titleLabel = UILabel()
        contentLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupFonts()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        contentView.addSubviewForAutolayout(titleLabel)
        contentView.addSubviewForAutolayout(contentLabel)
        
        titleLabel.numberOfLines = 0
        contentLabel.numberOfLines = 0
        
        titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        contentLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 999), for: .vertical)
    }
    func setupFonts() {
        titleLabel.font = UIFont.systemFont(ofSize: ViewTraits.titleFontSize, weight: .bold)
        contentLabel.font = UIFont.systemFont(ofSize: ViewTraits.contentFontSize, weight: .light)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: ViewTraits.margin),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: ViewTraits.margin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -ViewTraits.margin)
            ])
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: ViewTraits.margin),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: ViewTraits.margin),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -ViewTraits.margin),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -ViewTraits.margin)
            ])
    }
    
}
