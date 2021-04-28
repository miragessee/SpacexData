//
//  ViewController.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import UIKit
import Alamofire
import RxSwift
import JGProgressHUD
import PopupDialog
import SwiftDate

class ViewController: UIViewController {

    let hud = JGProgressHUD()
    
    @IBOutlet weak var tableView: UITableView!
    
    var launches : [LaunchesModelElement]?
    
    var filteredLaunches : [LaunchesModelElement]?
    
    var isFilter = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.separatorColor = UIColor.clear
        
        hud.show(in: self.view)
        
        LaunchesAPI.getLaunches() { (response, error) in
            if response != nil
            {
//                print(response)
                
                self.launches = response
                
                self.tableView.reloadData()
                
                self.hud.dismiss()
            }
            else
            {
                print("error")
            }
        }
    }

    @IBAction func filtreleAction(_ sender: UIBarButtonItem) {
        // Create a custom view controller
        let ratingVC = RatingViewController(nibName: "RatingViewController", bundle: nil)

        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = CancelButton(title: "Vazgeç", height: 60) {
            
        }

        // Create second button
        let buttonTwo = DefaultButton(title: "Filtrele", height: 60) {
            if ratingVC.commentTextField.text?.count ?? 0 > 0 {
//                self.filteredLaunches = self.launches?.filter { $0.launchDateUTC.toDate()?.toFormat("yyyy") == ratingVC.commentTextField.text ?? "" }
                self.filteredLaunches = self.launches?.filter { $0.launchYear == ratingVC.commentTextField.text ?? "" }
                self.isFilter = true
                self.tableView.reloadData()
            } else {
                self.isFilter = false
                self.tableView.reloadData()
            }
        }

        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])

        // Present dialog
        present(popup, animated: true, completion: nil)
    }
}

// MARK: -
// MARK: UITableView Data Source
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFilter {
            return filteredLaunches?.count ?? 0
        } else {
            return launches?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("LaunchesTableViewCell", owner: self, options: nil)?.first as! LaunchesTableViewCell
        
        if isFilter {
            cell.mvvmViewModel = filteredLaunches?[indexPath.row]
        }
        else {
            cell.mvvmViewModel = launches?[indexPath.row]
        }
        
        cell.actionButton.launchesElement = cell.mvvmViewModel
        cell.actionButton.addTarget(self, action: #selector(actionButton(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func actionButton(sender: SubclassedUIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LaunchesDetailViewController") as! LaunchesDetailViewController
        nextViewController.launchElement = sender.launchesElement
        self.navigationController?.pushViewController(nextViewController, animated:true)
    }
}

// MARK: -
// MARK: UITableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

