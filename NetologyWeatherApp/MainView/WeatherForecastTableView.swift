import UIKit

final class WeatherForecastTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var forecasts: [Forecast] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        tableView.backgroundColor = .systemBackground
        
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(WeatherForecastTableCell.self, forCellReuseIdentifier: "WeatherForecastTableCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
    }
    
    func configure(with forecasts: [Forecast]) {
        self.forecasts = forecasts
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // if 7 or 25
        forecasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastTableCell", for: indexPath) as? WeatherForecastTableCell else {
            return UITableViewCell()
        }
        
        let item = forecasts[indexPath.row]
        cell.configure(day: item.day, date: item.date, humidityIcon: item.humidityIcon, humidity: item.humidity, weatherDetails: item.weatherDetails, minTemp: item.minTemp, maxTemp: item.maxTemp)
        return cell
    }
    
}
