
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let v = WeatherForecastTableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(v)
        
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            v.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            v.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            v.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
        
    }


}

