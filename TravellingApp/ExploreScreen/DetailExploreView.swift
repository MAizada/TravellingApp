//
//  DetailExploreView.swift
//  TravellingApp
//
//  Created by Aizada on 09.04.2024.
//

import UIKit

class DetailExploreView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
