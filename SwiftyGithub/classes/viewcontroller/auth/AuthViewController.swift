//
//  AuthViewController.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/27/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController, UIWebViewDelegate {

    private var webView = UIWebView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(webView)
        webView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).insets(EdgeInsetsZero)
        }
        
        webView.delegate = self
        loadAuthorize()
    }
    
    private func loadAuthorize() {
        let urlString = String(format: "https://github.com/login/oauth/authorize?client_id=\(AuthService.clientId)")
        if let url = NSURL(string: urlString) {
            webView.loadRequest(NSURLRequest(URL: url))
        }
    }
    
    //MARK: - UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return fetchAccessTokenIfNeeded(request.URL)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
    }
    
    func fetchAccessTokenIfNeeded(url: NSURL?) -> Bool {
        if let scheme = url?.scheme, host = url?.host, lastPathComponent = url?.lastPathComponent, query = url?.query {
            if scheme == "swiftygithub" && host == "oauth" && lastPathComponent == "github" {
                let keyValue = query.componentsSeparatedByString("=")
                if keyValue[0] != "code" {
                    return false
                }
                AuthService.sharedService.signInWithCode(keyValue[1], completionBlock: { (error) -> Void in
                    if let error = error {
                        //TODO: error handling
                        return
                    }
                    (UIApplication.sharedApplication().delegate as? AppDelegate)?.setupViewController()
                })
                
                return false
            }
            return true
        }
        return true
    }
}