////
////  WeatherPresentTransitionAnimator.swift
////  Weather_Forecast
////
////  Created by 신의연 on 2022/06/15.
////
//
//import Foundation
//import UIKit
//
//class WeatherPresentTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//    
//    var contentViewTopAnchor: NSLayoutConstraint!
//    var contentViewWidthAnchor: NSLayoutConstraint!
//    var contentViewHeightAnchor: NSLayoutConstraint!
//    var contentViewCenterXAnchor: NSLayoutConstraint!
//    
//    var subDescTopAnchor: NSLayoutConstraint!
//    var subDescLeadingAnchor: NSLayoutConstraint!
//    
//    var descTopAnchor: NSLayoutConstraint!
//    var descLeadingAnchor: NSLayoutConstraint!
//    
//    var targetIndexPath: IndexPath?
//    var targetData: WeatherInfo?
//    
//    init(indexPath: IndexPath) {
//        super.init()
//        targetIndexPath = indexPath
//        targetData = WeatherData.EMPTY.weatherList[indexPath.row]
//    }
//    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 1
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        
//        let containerView = transitionContext.containerView
//     
//        guard let weatherListVC = transitionContext.viewController(forKey: .from) as? WeatherListViewController else { fatalError() }
//        guard let detailVC = transitionContext.viewController(forKey: .to) as? WeatherDetailViewController else { fatalError() }
//        guard let fromView = weatherListVC.view else { fatalError() }
//        guard let toView = detailVC.view else { fatalError() }
//        
//        let targetCell = weatherListVC.weatherCollectionView.cellForItem(at: targetIndexPath!) as! WeatherListCollectionViewCell
//        let startFrame = weatherListVC.weatherCollectionView.convert(targetCell.frame, to: fromView)
//        targetCell.transform = .identity
//        
//        let contentView = AppContentView(isContentView: true, isTransition: true)
//        
//        contentView.fetchDataForContentVC(image: targetData!.image, subD: targetData!.subDescription!, desc: targetData!.description!, content: (targetData?.content)!, contentView: containerView.frame, isTransition: true)
//        
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = GlobalConstants.cornerRadius
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let vcTabBarItem = UITabBarItem(title: "투데이", image: nil, tag: 0)
//        let vc2TabBarItem = UITabBarItem(title: "설정", image: nil, tag: 1)
//        
//        vc2TabBarItem.isEnabled = false
//        
//        fallingTabbar.items = [vcTabBarItem, vc2TabBarItem]
//        fallingTabbar.selectedItem = fallingTabbar.items?.first
//        
//        appStoreMenuVC.appCollectionView.cellForItem(at: targetIndexPath!)?.contentView.alpha = 0.0
//        
//        toView.alpha = 0.0
//        contentView.alpha = 1.0
//        targetCell.alpha = 0.0
//        targetTabbar.alpha = 0.0
//        
//        containerView.addSubview(toView)
//        containerView.addSubview(contentView)
//        containerView.addSubview(fallingTabbar)
//        
//        //MARK: - configure Layout
//        
//        NSLayoutConstraint.activate(makeConstraints(containerView: containerView, contentView: contentView, Originframe: startFrame))
//        containerView.layoutIfNeeded()
//        
//        //MARK:- TopConstraints Animation
//        
//        contentViewTopAnchor.constant = 0
//        
//        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveLinear, animations: {
//            contentView.layoutIfNeeded()
//        }) { (comp) in
//            toView.alpha = 1.0
//            contentView.removeFromSuperview()
//            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        }
//       
//        //MARK:- View's Height and Width Animation
//        
//        contentViewWidthAnchor.constant = containerView.frame.width
//        contentViewHeightAnchor.constant = containerView.frame.height
//        
//        contentView.subDescriptionLabel.snp.remakeConstraints { (const) in
//            const.top.equalTo(contentView.snp.top).offset(GlobalConstants.safeAreaLayoutTop)
//            const.leading.equalTo(contentView.snp.leading).offset(20)
//            const.width.equalTo(contentView.snp.width).multipliedBy(0.8)
//        }
//        contentView.descriptionLabel.snp.remakeConstraints { (const) in
//            const.top.equalTo(contentView.subDescriptionLabel.snp.bottom).offset(10)
//            const.leading.equalToSuperview().offset(20)
//            const.width.equalTo(contentView.snp.width).multipliedBy(0.8)
//        }
//        
//        UIView.animate(withDuration: 0.6 * 0.6) {
//            fallingTabbar.frame.origin.y = fromView.frame.maxY
//            contentView.layer.cornerRadius = 0
//            containerView.layoutIfNeeded()
//        }
//    }
//    
//    func makeConstraints(containerView: UIView, contentView: AppContentView, Originframe: CGRect) -> [NSLayoutConstraint] {
//        
//        contentViewCenterXAnchor = contentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
//        contentViewTopAnchor = contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Originframe.minY)
//        contentViewHeightAnchor = contentView.heightAnchor.constraint(equalToConstant: Originframe.height)
//        contentViewWidthAnchor = contentView.widthAnchor.constraint(equalToConstant: Originframe.width)
//
//        return [contentViewCenterXAnchor, contentViewTopAnchor, contentViewHeightAnchor, contentViewWidthAnchor]
//        
//    }
//}
