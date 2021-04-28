//
//  LaunchesDetailViewController.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import UIKit
import ImageSlideshow

class LaunchesDetailViewController: UIViewController, ImageSlideshowDelegate {

    var launchElement : LaunchesModelElement?
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var nationalityNameLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
//        slideshow.pageIndicator = UIPageControl.withSlideshowColors()
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        var kingfisherSource = [KingfisherSource]()
        for flickr in launchElement?.links.flickrImages ??  [String]() {
            kingfisherSource.append((KingfisherSource(urlString: flickr) ?? KingfisherSource(urlString: "", placeholder: UIImage(named: "placeholder_image")))!)
        }
        
        slideshow.setImageInputs(kingfisherSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        dateLabel.text = launchElement?.launchDateUTC.toDate()?.toFormat("dd.MM.yyyy")
        missionNameLabel.text = launchElement?.missionName
        rocketNameLabel.text = launchElement?.rocket.rocketName.rawValue
        
        if launchElement?.rocket.secondStage.payloads.count ?? 0 > 0 {
            nationalityNameLabel.text = launchElement?.rocket.secondStage.payloads[0].nationality
        }
        
        detailsTextView.text = launchElement?.details
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
