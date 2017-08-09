//
//  WebViewController.swift
//  NewRecipe
//
//  Created by 鈴木英利 on 2017/08/09.
//  Copyright © 2017年 鈴木英利. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var pdfName = ""
    
    @IBOutlet var webView: UIWebView!
    
    @IBOutlet var sc: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        let path = Bundle.main.path(forResource: pdfName, ofType: "pdf")
        let requetURL = URL(string: path!)
        let request = URLRequest(url: requetURL!)
        webView.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
