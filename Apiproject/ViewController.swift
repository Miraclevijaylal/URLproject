//
//  ViewController.swift
//  Apiproject
//
//  Created by Vijay Lal on 16/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viwe: UILabel!
    @IBOutlet weak var dummylink: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var phonebutton: UIButton!
    lazy var endPointURL: URL? = {
        URL(string: "https://api.restful-api.dev/objects")
    }()
    lazy var secondEndpointURL: URL? = {
        URL(string: "https://jsonplaceholder.typicode.com/todos/1")
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let unwrappedURL = endPointURL else { return }
        URLSession.shared.dataTask(with: URLRequest.init(url: unwrappedURL)) { [weak self] data, response, error in
            guard let unwrapSelf = self else { return }
            guard let unwrapdata = data else { return }
            guard let stringValue = String(data: unwrapdata, encoding: .utf8) else { return }
            DispatchQueue.main.async { [weak self] in
                guard let unwrapSelf = self else { return }
                unwrapSelf.resultLabel.text = stringValue
            }
        }.resume()
    }
    @IBAction func checkapi(_ sender: UIButton) {
        guard let unwrapURL = secondEndpointURL else { return }
        URLSession.shared.dataTask(with: URLRequest.init(url: unwrapURL)) { [weak self] data, response, error in
            guard let unwrapSelf = self else { return }
            guard let unwrapdata = data else { return }
            guard let stringValue = String(data: unwrapdata, encoding: .utf8) else { return }
            DispatchQueue.main.async { [weak self] in
                guard let unwrapSelf = self else { return }
                unwrapSelf.viwe.text = stringValue
            }
        }.resume()
    }
}

