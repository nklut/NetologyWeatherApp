import UIKit

class WeatherDisplayView: UIView {
    
    private var currentTemp = "10"
    private var daylyMaxTemp = "13"
    private var daylyMinTemp = "7"
    private var weatherText = "Heavy rain"
    private var windValue = 3
    private var humidityValue = 80
    
    private lazy var dayNightTempLabel: UILabel = {
        let view = UILabel()
        view.text = "\(daylyMinTemp)°/\(daylyMaxTemp)°"
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentTempLabel: UILabel = {
        let view = UILabel()
        view.text = "\(currentTemp)°"
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherDescLabel: UILabel = {
        let view = UILabel()
        view.text = weatherText
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // wind
    private lazy var windImage: UIImageView = {
        let view = UIImageView()
        // if windValue < 3 {} else if windValue < 7 {} else {}
        view.image = UIImage(systemName: "wind")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windValueLabel: UILabel = {
        let view = UILabel()
        view.text = "\(windValue) m\\s"
        view.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // humidity
    private lazy var humidityImage: UIImageView = {
        let view = UIImageView()
        // if humidityValue < 3 {} else if humidityValue < 7 {} else {}
        view.image = UIImage(systemName: "cloud.drizzle")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let view = UILabel()
        view.text = "\(humidityValue) %"
        view.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBlue
        
        addSubview(dayNightTempLabel)
        addSubview(currentTempLabel)
        addSubview(weatherDescLabel)
        addSubview(windImage)
        addSubview(windValueLabel)
        addSubview(humidityImage)
        addSubview(humidityValueLabel)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            dayNightTempLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            dayNightTempLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            dayNightTempLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            
            currentTempLabel.topAnchor.constraint(equalTo: dayNightTempLabel.bottomAnchor, constant: 10),
            currentTempLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            currentTempLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            
            weatherDescLabel.topAnchor.constraint(equalTo: currentTempLabel.bottomAnchor, constant: 10),
            weatherDescLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            weatherDescLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            
            windValueLabel.topAnchor.constraint(equalTo: weatherDescLabel.bottomAnchor, constant: 15),
            windValueLabel.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -50),

            windImage.topAnchor.constraint(equalTo: windValueLabel.topAnchor),
            windImage.trailingAnchor.constraint(equalTo: windValueLabel.leadingAnchor, constant: -5),
            windImage.heightAnchor.constraint(equalToConstant: 16),
            windImage.widthAnchor.constraint(equalToConstant: 16),

            humidityImage.topAnchor.constraint(equalTo: weatherDescLabel.bottomAnchor, constant: 15),
            humidityImage.leadingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 50),
            humidityImage.heightAnchor.constraint(equalToConstant: 10),
            humidityImage.widthAnchor.constraint(equalToConstant: 10),
            
            humidityValueLabel.topAnchor.constraint(equalTo: humidityImage.topAnchor),
            humidityValueLabel.leadingAnchor.constraint(equalTo: humidityImage.trailingAnchor, constant: 5),
        ])
    }
    
}
