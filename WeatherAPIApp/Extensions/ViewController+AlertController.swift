//
//  ViewController+AlertController.swift
//  WeatherAPIApp
//
//  Created by Konstantin Petkov on 03.09.2020.
//  Copyright © 2020 Konstantin Petkov. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style,
                                      completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Odessa", "New York", "Stambul", "Kiev"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.replacingOccurrences(of: " ", with: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
