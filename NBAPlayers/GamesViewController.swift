//
//  GamesViewController.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/30/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
        gradient.locations = [0, 1]
        gradient.opacity = 0.8
        gradient.cornerRadius = 12
        return gradient
    }()
    
    lazy var gl: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.9)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.1)
        gradient.cornerRadius = 12
        return gradient
    }()
    
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var errorView: UIView! {
        didSet {
            gl.frame = CGRect(x: -10, y: -10, width: errorView.bounds.width + 20, height: errorView.bounds.height + 20)
            gradient.frame = errorView.bounds
            errorView.layer.insertSublayer(gradient, at: 0)
            errorView.layer.insertSublayer(gl, at: 0)
        }
    }
    
    var games: [Game] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reload()
    }
    @IBAction func onReloadButtonClick(_ sender: Any) {
        reload()
    }
    
    private func showLoading() {
        activityIndicator.startAnimating()
        tableView.backgroundView = UIImageView(image: UIImage(named: "nba2"))
        errorView.isHidden = true
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    private func showError() {
        activityIndicator.stopAnimating()
        tableView.backgroundView = UIImageView(image: UIImage(named: "nba2"))
        errorView.isHidden = false
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    private func showData() {
        activityIndicator.stopAnimating()
        tableView.backgroundView = .none
        errorView.isHidden = true
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    private func reload() {
        showLoading()
        apiClient.getGames(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let games):
                    self.games = games
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.games = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
        
        let game = games[indexPath.row]
        
        cell.nameOneButton.setTitle(game.homeTeam.name, for: .normal)
        cell.nameTwoButton.setTitle(game.visitorTeam.name, for: .normal)
        cell.scoreOneLabel.text = String(game.homeTeamScore)
        cell.scoreTwoLabel.text = String(game.visitorTeamScore)
        cell.flagHomeTeam.image = UIImage(named: game.homeTeam.name)
        cell.flagVisitorTeam.image = UIImage(named: game.visitorTeam.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let gameDetailsViewController = storyboard.instantiateViewController(identifier: "GameDetailsViewController") as! GameDetailsViewController
        
        let game = games[indexPath.row]
        gameDetailsViewController.game = game
        
        navigationController?.pushViewController(gameDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
