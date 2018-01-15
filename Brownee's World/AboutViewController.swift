//
//  AboutViewController.swift
//  Brownees World
//
//  Created by Benjamin Bucca on 8/11/16.
//  Copyright © 2016 Animal Assistance. All rights reserved.
//

import UIKit
import paper_onboarding
import Foundation
import JSSAlertView

class AboutViewController: UIViewController, PaperOnboardingDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  paper onboarding
        let onboarding = PaperOnboarding(itemsCount: 3)
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(onboarding)
        
        // add constraints for onboarding
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0)
            view.addConstraint(constraint)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // func for onboarding
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        // font for each title text
        let titleFont = UIFont(name: "Helvetica Neue", size: 38.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        // font for each description text
        let descriptionFont = UIFont(name: "Helvetica Neue", size: 16.0) ?? UIFont.systemFont(ofSize: 14.0)
        
        // array: main image, title text, description text, tab image, background color,
        // title text color, description text color, title font, description font
        return[
            (UIImage(named:"browneeOnboard")!, "Brownee's World", "Swipe left to see more or swipe right to exit.", UIImage(named:"dogTab")!, UIColorFromHex(0xFFF7F2), UIColorFromHex(0x442C1D), UIColorFromHex(0x442C1D), titleFont, descriptionFont),
            
            (UIImage(named:"footOnboard")!, "Education", "Answer questions about a dog's life before and after rescuing from a shelter. Swipe left to see more or swipe right to go back.", UIImage(named:"dog_footprint_tab")!, UIColorFromHex(0xF8E6D6), UIColorFromHex(0x442C1D), UIColorFromHex(0x442C1D), titleFont, descriptionFont),
            
            (UIImage(named:"houseOnboard")!, "Search", "Search for animal shelters and rescue organizations via any 5 digit USA ZIP code. View a list of common items that shelters will accept as donations. Swipe left to exit or swipe right to go back.", UIImage(named:"dog_house_tab")!, UIColorFromHex(0xFFF7F2), UIColorFromHex(0x442C1D), UIColorFromHex(0x442C1D), titleFont, descriptionFont)
            ][index]
    }
    // func for number of onboarding pages
    func onboardingItemsCount() -> Int {
        return 3
    }

}

