import UIKit

class MainVC: UIViewController, LocationsSliderViewDelegate {
    
    private let locations: Array<String> = ["Moscow", "Beijing"]
    private let locationScroll = LocationsSliderView(count: 2)
    
    private lazy var locationButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "location.magnifyingglass"), for: .normal)
        view.addTarget(self, action: #selector(didTapLocationButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var settingsButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "gear"), for: .normal)
        view.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var detailsButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonText = "24 hours details"
        let attributedText = NSMutableAttributedString(string: buttonText)
        let underLineAttributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
        attributedText.addAttributes(underLineAttributes, range: NSRange(location: 0, length: attributedText.length))
        view.setAttributedTitle(attributedText, for: .normal)
        
        view.addTarget(self, action: #selector(didTapDetailsButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = locations[0]
        return view
    }()
    
    private lazy var forecastDescLabel: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        //if 7days {} else {}
        view.text = "Week forecast"
        
        return view
    }()
    
    private lazy var forecastDaysLabel: UIButton = {
        //if 7days {} else {}
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonText = "25 days"
        let attributedText = NSMutableAttributedString(string: buttonText)
        let underLineAttributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
        attributedText.addAttributes(underLineAttributes, range: NSRange(location: 0, length: attributedText.length))
        view.setAttributedTitle(attributedText, for: .normal)
        
        view.addTarget(self, action: #selector(didTapForecastButton), for: .touchUpInside)
        return view
        
    }()
    
    private lazy var weatherDisplay = WeatherDisplayView()
    private lazy var weatherCollection = WeatherCollectionView()
    private lazy var weatherForecastTable = WeatherForecastTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        
        setupTable()
        setupCollection()
        setupUI()
    }
    
    internal func dotSelectorView(_ selector: LocationsSliderView, didSelect index: Int) {
        print("Выбрана точка №\(index)")
        locationLabel.text = "\(locations[index])"
    }
    
    private func setupUI() {
        weatherDisplay.translatesAutoresizingMaskIntoConstraints = false
        weatherCollection.translatesAutoresizingMaskIntoConstraints = false
        weatherForecastTable.translatesAutoresizingMaskIntoConstraints = false
        
        locationScroll.delegate = self
        locationScroll.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(settingsButton)
        view.addSubview(locationButton)
        view.addSubview(locationLabel)
        view.addSubview(locationScroll)
        view.addSubview(weatherDisplay)
        view.addSubview(detailsButton)
        view.addSubview(weatherCollection)
        view.addSubview(forecastDescLabel)
        view.addSubview(forecastDaysLabel)
        view.addSubview(weatherForecastTable)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            settingsButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            settingsButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 32),
            settingsButton.widthAnchor.constraint(equalToConstant: 32),
            
            locationButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            locationButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 32),
            locationButton.widthAnchor.constraint(equalToConstant: 32),
            
            locationLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            locationLabel.topAnchor.constraint(equalTo: locationButton.bottomAnchor),

            locationScroll.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            locationScroll.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weatherDisplay.topAnchor.constraint(equalTo: locationScroll.bottomAnchor, constant: 15),
            weatherDisplay.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            weatherDisplay.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            weatherDisplay.heightAnchor.constraint(equalToConstant: 150),
            
            detailsButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            detailsButton.topAnchor.constraint(equalTo: weatherDisplay.bottomAnchor, constant: 15),
            detailsButton.heightAnchor.constraint(equalToConstant: 15),
            
            weatherCollection.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 15),
            weatherCollection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            weatherCollection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 15),
            weatherCollection.heightAnchor.constraint(equalToConstant: 80),
            
            forecastDescLabel.topAnchor.constraint(equalTo: weatherCollection.bottomAnchor, constant: 30),
//            forecastDescLabel.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 15),
            
            forecastDescLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            forecastDescLabel.widthAnchor.constraint(equalToConstant: 200),
            
            forecastDaysLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            forecastDaysLabel.topAnchor.constraint(equalTo: forecastDescLabel.topAnchor),
            forecastDaysLabel.widthAnchor.constraint(equalToConstant: 100),
            
            weatherForecastTable.topAnchor.constraint(equalTo: forecastDescLabel.bottomAnchor, constant: 15),
            weatherForecastTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            weatherForecastTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            weatherForecastTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15)
        ])
    }
    
    private func filledCircle() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 20, height: 20))
        return renderer.image { context in
            let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
            let path = UIBezierPath(ovalIn:  rect)
            let color = UIColor.black
            color.setFill()
            path.fill()
        }
    }
    
    private func setupCollection() {
        
        let shortForecasts: [ShortForecast] = [
            .init(time: "12:00", weatherIcon: "sun.max.fill", temperature: "12"),
            .init(time: "13:00", weatherIcon: "sun.max.fill", temperature: "11"),
            .init(time: "14:00", weatherIcon: "sun.max.fill", temperature: "12"),
            .init(time: "15:00", weatherIcon: "sun.max.fill", temperature: "10"),
            .init(time: "16:00", weatherIcon: "sun.max.fill", temperature: "10"),
            .init(time: "17:00", weatherIcon: "sun.max.fill", temperature: "10"),
            
            .init(time: "18:00", weatherIcon: "sun.max.fill", temperature: "9"),
            .init(time: "19:00", weatherIcon: "sun.max.fill", temperature: "9"),
            .init(time: "20:00", weatherIcon: "sun.max.fill", temperature: "8"),
            .init(time: "21:00", weatherIcon: "sun.max.fill", temperature: "8"),
            .init(time: "22:00", weatherIcon: "sun.max.fill", temperature: "10"),
            .init(time: "23:00", weatherIcon: "sun.max.fill", temperature: "12"),
        ]
        
        weatherCollection.configure(with: shortForecasts)
        
    }
    
    private func setupTable() {
        let forecasts: [Forecast] = [
            .init(day: "Sat", date: "17/04", humidityIcon: "cloud.drizzle", humidity: "13", weatherDetails: "Rain", minTemp: "1", maxTemp: "5"),
            .init(day: "Sun", date: "18/04", humidityIcon: "cloud.drizzle", humidity: "73", weatherDetails: "Cloud", minTemp: "10", maxTemp: "6"),
            .init(day: "Mon", date: "19/04", humidityIcon: "cloud.drizzle", humidity: "23", weatherDetails: "Rain", minTemp: "15", maxTemp: "55"),
            .init(day: "Tue", date: "20/04", humidityIcon: "cloud.drizzle", humidity: "14", weatherDetails: "Sun", minTemp: "41", maxTemp: "12"),
            .init(day: "Wed", date: "21/04", humidityIcon: "cloud.drizzle", humidity: "15", weatherDetails: "Cloud", minTemp: "51", maxTemp: "21"),
            .init(day: "Thur", date: "2/04", humidityIcon: "cloud.drizzle", humidity: "16", weatherDetails: "Rain", minTemp: "11", maxTemp: "22121"),
            .init(day: "Fr", date: "23/04", humidityIcon: "cloud.drizzle", humidity: "0", weatherDetails: "Sun", minTemp: "11", maxTemp: "2"),
        ]
        
        weatherForecastTable.configure(with: forecasts)
    }
    
    @objc private func didTapLocationButton() {
        print("Location Button")
    }
    
    @objc private func didTapSettingsButton() {
        print("Settings Button")
    }
    
    @objc private func didTapDetailsButton() {
        print("Details Button")
    }
    
    @objc private func didTapForecastButton() {
        print("Forecast Button")
    }
    
}
