//
//  WebContentViewController.swift
//  NetworkingStudy
//
//  Created by 김정민 on 2020/04/13.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController {

    /*
        Displaying Web Content
     1. TextField에 주소 입력 후 Return 키를 누르면 자동으로 웹뷰에 호출되도록 구현
     --> textfield의 delegate를 추가해줘야함
     2. 뒤로가기, 앞으로가기, 새로고침 기능 구현
     --> 만약 webkit 접속이 안되면 build phase에서 webkit 추가하기(구글 신 참고)
     */
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var webView: WKWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        // 기본 사이트 설정
        urlField.text = "http://www.apple.com"
    }
    
    // 입력받은 값으로 URL 이동 (1)
    func go(to urlStr : String){
        // 전달받은 값으로 URL 인스턴스 생성
        guard let url = URL(string: urlStr) else{
            fatalError("Invalid URL")
        }
        
        // html page load
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // 뒤로가기 구현 (2)
    @IBAction func goBack(_ sender: Any) {
        // 뒤로가기가 가능한지 먼저 확인
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    // 새로고침 구현 (2)
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    // 앞으로 가기 구현 (2)
    @IBAction func goForward(_ sender: Any) {
        // 앞으로 가기가 가능한지 먼저 확인
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
}

// Return 키 누를 경우 자동으로 URL 이동 (1)
extension WebContentViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let str = textField.text else {return true}
        go(to: str)
        textField.resignFirstResponder()
        return true
    }
}

extension WebContentViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("fucking error : \(error)")
    }
}
