//
//  PlayersDetailsViewController.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/26/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import UIKit

class PlayersDetailsViewController: UIViewController {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButtom: UIButton!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = player?.fullName
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        teamButtom.setTitle(player?.team.fullName, for: .normal)
    }
    
    @IBAction func teamButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        teamDetailsViewController.team = player?.team
        teamDetailsViewController.previousScreen = player?.fullName
        
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
        
    }
}
