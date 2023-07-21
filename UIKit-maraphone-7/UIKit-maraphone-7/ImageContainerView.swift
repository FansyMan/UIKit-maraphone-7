import UIKit

class ImageContainerView: UIView {
    private let imageView = UIImageView()
    private let containerView = UIView()
    
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottomInset = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 270))
        
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        

        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        imageViewBottomInset = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)

        NSLayoutConstraint.activate([
            containerViewHeight,
            imageViewBottomInset,
            imageViewHeight,
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        if offsetY >= 0 {
            imageViewBottomInset.constant = 0
        } else {
            imageViewBottomInset.constant = offsetY / 2
        }
        
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
