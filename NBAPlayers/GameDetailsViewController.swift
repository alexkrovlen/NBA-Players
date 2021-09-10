//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 9/1/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameVisitorTeam: UIButton! {
        didSet {
            nameVisitorTeam.tintColor = UIColor.black
            nameVisitorTeam.titleLabel?.textAlignment = .center
            nameVisitorTeam.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(35))
        }
    }
    @IBOutlet weak var nameHomeTeam: UIButton! {
        didSet {
            nameHomeTeam.tintColor = UIColor.black
            nameHomeTeam.titleLabel?.textAlignment = .center
            nameHomeTeam.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(35))
        }
    }
    
    @IBOutlet weak var flagHomeTeam: UIImageView!
    @IBOutlet weak var flagVisitorTeam: UIImageView!
    
    @IBOutlet weak var scoreVisitorTeam: UILabel! {
        didSet {
            scoreVisitorTeam.layer.shadowColor = UIColor.red.cgColor
            scoreVisitorTeam.layer.shadowOpacity = 1.0
            scoreVisitorTeam.layer.shadowOffset = CGSize(width: 5, height: -1)
            scoreVisitorTeam.layer.shadowRadius = 3.0
            scoreVisitorTeam.textAlignment = .center
            scoreVisitorTeam.textColor = UIColor.black
            scoreVisitorTeam.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    @IBOutlet weak var scoreHomeTeam: UILabel! {
        didSet {
            scoreHomeTeam.layer.shadowColor = UIColor.green.cgColor
            scoreHomeTeam.layer.shadowOpacity = 1.0
            scoreHomeTeam.layer.shadowOffset = CGSize(width: 6, height: -1)
            scoreHomeTeam.layer.shadowRadius = 3.0
            scoreHomeTeam.textAlignment = .center
            scoreHomeTeam.textColor = UIColor.black
            scoreHomeTeam.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var viewHome: UIView! {
        didSet {
            viewHome.layer.borderColor = UIColor.green.cgColor
            viewHome.layer.borderWidth = CGFloat(5)
        }
    }
    @IBOutlet weak var viewVisitor: UIView! {
        didSet {
            viewVisitor.layer.borderColor = UIColor.red.cgColor
            viewVisitor.layer.borderWidth = CGFloat(5)
        }
    }
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        nameHomeTeam.setTitle(game?.homeTeam.name, for: .normal)
        nameHomeTeam.underlineText()
        nameVisitorTeam.setTitle(game?.visitorTeam.name, for: .normal)
        nameVisitorTeam.underlineText()
        loadData()
        isWinerTeam()
    }
    
    func loadData() {
        guard let game = game else { return }
        
        scoreHomeTeam.text = String(game.homeTeamScore)
        scoreVisitorTeam.text = String(game.visitorTeamScore)
        flagHomeTeam.image = UIImage(named: game.homeTeam.name)
        flagVisitorTeam.image = UIImage(named: game.visitorTeam.name)
    }
    
    func isWinerTeam() {
        guard let game = game else { return }
        if game.homeTeamScore > game.visitorTeamScore {
            scoreHomeTeam.layer.shadowColor = UIColor.green.cgColor
            viewHome.layer.borderColor = UIColor.green.cgColor
            scoreVisitorTeam.layer.shadowColor = UIColor.red.cgColor
            viewVisitor.layer.borderColor = UIColor.red.cgColor
        } else {
            scoreHomeTeam.layer.shadowColor = UIColor.red.cgColor
            viewHome.layer.borderColor = UIColor.red.cgColor
            scoreVisitorTeam.layer.shadowColor = UIColor.green.cgColor
            viewVisitor.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    @IBAction func onTeamButtonTap(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        teamDetailsViewController.team = (tag == 0) ? game?.homeTeam : game?.visitorTeam
        if let game = game {
            teamDetailsViewController.previousScreen = "\(game.homeTeam.abbreviation) - \(game.visitorTeam.abbreviation)"
        } else {
            teamDetailsViewController.previousScreen = "Game"
        }
        
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
    
    
}
