import UIKit

final class WeatherCollectionViewCell: UICollectionViewCell {
    
    private let timeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .systemGray4
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    private let weatherImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let temperatureLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperatureLabel)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            
            weatherImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            weatherImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 5),
        ])
    }
    
    func configure(time: String, weatherIcon: String, temperature: String) {
        timeLabel.text = time
        weatherImage.image = UIImage(systemName: weatherIcon)
        temperatureLabel.text = "\(temperature)°"
    }
    
}
