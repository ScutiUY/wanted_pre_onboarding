//
//  TransitionController.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/15.
//

import Foundation
import UIKit

class TransitionController: NSObject, UIViewControllerTransitioningDelegate {
    
    var superViewcontroller: UIViewController?
    var targetCellFrame: CGRect?
    var indexPath: IndexPath?
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return WeatherPresentation(presentedViewController: presented, presenting: presenting)
    }
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return WeatherPresentTransitioningAnimator(indexPath: indexPath!)
//    }
    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return 
//    }
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return nil
//    }
    
}
