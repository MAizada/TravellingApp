import UIKit

final class CustomPageControl: UIView {
    
    var pageChangedHandler: ((Int) -> Void)?
    
    var numberOfPages: Int = 0 {
        didSet {
            setupIndicators()
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            updateIndicators()
        }
    }
    
    private var indicators: [UIView] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIndicators()
    }
    
    private func setupIndicators() {
        indicators.forEach { $0.removeFromSuperview() }
        indicators.removeAll()
        
        let indicatorWidth: CGFloat = 10
        let indicatorHeight: CGFloat = 2
        let spacing: CGFloat = 10
        let totalWidth = CGFloat(numberOfPages) * (indicatorWidth + spacing) - spacing
        var xPosition = (self.frame.width - totalWidth) / 2
        
        for _ in 0..<numberOfPages {
            let indicator = UIView()
            indicator.backgroundColor = .gray
            indicator.frame = CGRect(x: xPosition, y: (self.frame.height - indicatorHeight) / 2, width: indicatorWidth, height: indicatorHeight)
            indicator.layer.cornerRadius = indicatorHeight / 2
            self.addSubview(indicator)
            indicators.append(indicator)
            xPosition += indicatorWidth + spacing
        }
        
        updateIndicators()
    }
    
    private func layoutIndicators() {
        let indicatorWidth: CGFloat = 10
        let indicatorHeight: CGFloat = 2
        let spacing: CGFloat = 10
        let totalWidth = CGFloat(numberOfPages) * (indicatorWidth + spacing) - spacing
        var xPosition = (self.frame.width - totalWidth) / 2
        
        for (index, indicator) in indicators.enumerated() {
            indicator.frame = CGRect(x: xPosition, y: (self.frame.height - indicatorHeight) / 2, width: indicatorWidth, height: indicatorHeight)
            xPosition += indicatorWidth + spacing
        }
    }
    
    private func updateIndicators() {
        for (index, indicator) in indicators.enumerated() {
            indicator.backgroundColor = (index == currentPage) ? Colors.customBlue : .gray
        }
    }
}
