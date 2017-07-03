//
//  ViewController.swift
//  showingAdsInUISwift
//
//  Created by Beniamin Duca on 03/07/2017.
//  Copyright © 2017 elasticad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog("ver:%@",EANative.getSDKVersion());
        
        //Initialize the SDK with the api key received when you registred your app.
        EANative.initialize(withAppKey: "eanative-test-key");
        
        //Create the ad view
        let adViewController:EAAdViewController = EAAdViewController.ad(withPlacementID: "2061", adFormat: EANativeAdFormat_sample1, config: nil) as! EAAdViewController;
        
        //adjust its position
        adViewController.view.center = CGPoint(x: 150,y :100);
        
        self.addChildViewController(adViewController);
        
        //add it to your view hierarchy
        self.view.addSubview(adViewController.view);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

