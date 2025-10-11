import UIKit

final class WeatherForecastTableCell: UITableViewCell{
    
    private lazy var dayLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private lazy var humidityImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textColor = .blue
        return view
    }()
    
    private lazy var weatherDetailesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    private lazy var temperatureSpreadLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemGray6
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(humidityImage)
        contentView.addSubview(humidityValueLabel)
        contentView.addSubview(weatherDetailesLabel)
        contentView.addSubview(temperatureSpreadLabel)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            dayLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            
            dateLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
            
            humidityImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 15),
            humidityImage.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            humidityValueLabel.leadingAnchor.constraint(equalTo: humidityImage.trailingAnchor, constant: 5),
            humidityValueLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            weatherDetailesLabel.leadingAnchor.constraint(equalTo: humidityValueLabel.trailingAnchor, constant: 15),
            weatherDetailesLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            temperatureSpreadLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            temperatureSpreadLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
            
        ])
        
    }

    func configure(
        day: String ,
        date: String,
        humidityIcon: String,
        humidity: String,
        weatherDetails: String,
        minTemp: String,
        maxTemp: String,
    ) {
        dayLabel.text = day
        dateLabel.text = date
        humidityImage.image = UIImage(systemName: humidityIcon)
        humidityValueLabel.text = "\(humidity)%"
        weatherDetailesLabel.text = weatherDetails
        temperatureSpreadLabel.text = "\(minTemp)° - \(maxTemp)°"
    }
    
}
