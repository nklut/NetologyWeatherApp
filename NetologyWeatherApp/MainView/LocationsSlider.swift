import UIKit

protocol LocationsSliderViewDelegate: AnyObject {
    func dotSelectorView(_ selector: LocationsSliderView, didSelect index: Int)
}

class LocationsSliderView: UIView {
    
    weak var delegate: LocationsSliderViewDelegate?
    
    private let stackView = UIStackView()
    private var dots: [UIView] = []
    private var count: Int
    private var selectedIndex: Int = 0
    
    var dotSize: CGFloat = 14
    var spacing: CGFloat = 20
    var selectedColor: UIColor = .black
    var normalColor: UIColor = .gray
    
    init(count: Int) {
        self.count = count
        super.init(frame: .zero)
        setupView()
        createDots()
        selectDot(at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createDots() {
        for i in 0..<count {
            let dot = UIView()
            dot.backgroundColor = normalColor
            dot.layer.cornerRadius = dotSize / 2
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            dot.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            
            dot.tag = i
            dot.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(dotTapped(_:)))
            dot.addGestureRecognizer(tap)
            
            stackView.addArrangedSubview(dot)
            dots.append(dot)
        }
    }
    
    @objc private func dotTapped(_ gesture: UITapGestureRecognizer) {
        guard let dot = gesture.view else { return }
        selectDot(at: dot.tag)
        delegate?.dotSelectorView(self, didSelect: dot.tag)
    }
    
    func selectDot(at index: Int) {
        guard index >= 0 && index < dots.count else { return }
        for (i, dot) in dots.enumerated() {
            UIView.animate(withDuration: 0.2) {
                dot.backgroundColor = (i == index) ? self.selectedColor : self.normalColor
                dot.transform = (i == index) ? CGAffineTransform(scaleX: 1.4, y: 1.4) : .identity
            }
        }
        selectedIndex = index
    }
}
