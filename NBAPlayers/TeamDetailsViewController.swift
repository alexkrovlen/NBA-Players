//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/26/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    var team: Team?
    var previousScreen: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let backBarItem = UIBarButtonItem(title: previousScreen, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarItem
        
        navigationItem.title = team?.fullName
        teamNameLabel.text = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
        flagImage.image = UIImage(named: team!.name)
    }
}
