//
//  WKLoginViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 29.06.2021.
//

import UIKit
import WebKit
import Alamofire

class WKLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authToVK(view: webView)
        
    }

    @IBOutlet weak var webView: WKWebView!  {
        didSet{
            webView.navigationDelegate = self
        }
    }

    
    func authToVK(view: WKWebView!) {
     
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7890187"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "270342"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "revoke", value: "1"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
        view.load(request)
        
    }

    
}

// MARK: - WKNavigationDelegate

extension WKLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        if let token = params["access_token"], let userId = params["user_id"] {
            print("Token is \(token)")
            Session.shared.token = token
            Session.shared.userID = userId
        }
        
        
        decisionHandler(.cancel)
        
        showMainTabBar()
    }
    
    // MARK: - Segue
    func showMainTabBar() {
        
        performSegue(withIdentifier: "showTabBarSegue", sender: nil)
        
    }
}



