//
//  ATSViewController.swift
//  NetworkingStudy
//
//  Created by 김정민 on 2020/04/16.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit
import WebKit

class ATSViewController: UIViewController {
    
    /*
        App Transport Security
     1. https로 안된 사이트를 접속해야할 때 info.plist 에서 http로 접속이 가능하도록 설정 가능
     --> 되도록 https를 사용하는게 좋음
     2. App Transport Security Settings 항목을 추가하고 Exception Domains 속성을 추가한 후 daum.net을 추가(dic)
     3. 이후 daum.net에 boolean 형태의 NSExceptionAllowsInsecureHTTPLoads와 NSIncludesSubdomains 를 추가
     4. 모바일의 경우 www가 아닌 m 이 붙으므로 서브 도메인을 다 처리해줘야함
     5. 만약 http 설정을 한 경우 앱심사가 거부될 수 있으므로 정당한 이유를 설명해줘야함
     */
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        showSiteMenu(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
    }
}

extension ATSViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}

extension ATSViewController{
    func go(to urlStr : String){
        guard let url = URL(string: urlStr) else{
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func showSiteMenu(_ sender : UIBarButtonItem){
        let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let apple = UIAlertAction(title: "Apple", style: .default) { (action) in
            self.go(to: "http://www.apple.com")
        }
        menu.addAction(apple)
        
        let daum = UIAlertAction(title: "Daum", style: .default) { (action) in
            self.go(to: "http://www.daum.net")
        }
        menu.addAction(daum)
        
        let daumDic = UIAlertAction(title: "Daum Dictionary", style: .default) { (action) in
            self.go(to: "http://dic.daum.net")
        }
        menu.addAction(daumDic)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        menu.addAction(cancel)
        
        if let pc = menu.popoverPresentationController{
            pc.barButtonItem = sender
        }
        
        present(menu, animated: true, completion: nil)
    }
}
