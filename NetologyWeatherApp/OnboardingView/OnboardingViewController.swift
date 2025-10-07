import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "onboardingImage")
        
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.numberOfLines = 0
        view.textColor = .white
        view.textAlignment = .center
        view.text = "Allow the Weather app to use your device's location data?"
        
        return view
    }()
    
    private lazy var labelText: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.numberOfLines = 0
        view.textColor = .white
        view.textAlignment = .center
        view.text = "This will help to get more accurate weather forecasts while driving or traveling.\n\nYou can change the selection at any time from the app settings."
        
        return view
    }()
    
    private lazy var acceptButton: UIButton = {
        let view = UIButton(type: .custom)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appYelow
        view.setTitle("Allow geolocation", for: .normal)
        view.layer.cornerRadius = 15
        view.addTarget(self, action: #selector(didTapAccept), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var declineButton: UIButton = {
        let view = UIButton(type: .custom)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appBlue
        view.setTitle("Don't allow geolocation", for: .normal)
        view.layer.cornerRadius = 15
        view.addTarget(self, action: #selector(didTapDecline), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appBlue
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(labelText)
        view.addSubview(acceptButton)
        view.addSubview(declineButton)
        
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            image.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            image.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300),
            
            label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            
            labelText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            labelText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            labelText.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            
            acceptButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            acceptButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            acceptButton.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 60),
            acceptButton.heightAnchor.constraint(equalToConstant: 40),
           
            declineButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            declineButton.topAnchor.constraint(equalTo: acceptButton.bottomAnchor, constant: 30),
            declineButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc private func didTapAccept(){
        print("Geo Accepted")
    }
    
    @objc private func didTapDecline(){
        print("Geo refused")
    }
    
}
