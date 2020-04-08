//
//  URLRequestViewController.swift
//  NetworkingStudy
//
//  Created by 김정민 on 2020/04/08.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class URLRequestViewController: UIViewController {

    /*
        Network Overview
     1. Endpoints에 설정하고, 미리 환경을 설정한 후 URL로 접근해서 이미지를 다운로드 받고 보여주는 기본적인 코드 구현
     --> 메인 스레드에서 이를 처리하면 다른 동작을 처리못하니 꼭 백그라운드에서 처리해야함
     --> 비동기 형식으로 구현해야함
     
     */
    
    @IBOutlet weak var imageView: UIImageView!
    
    // URL 접근 후 이미지 다운로드 (1)
    @IBAction func sendRequest(_ sender: Any) {
        imageView.image = nil
        
        // URL instance 생성
        guard let url = URL(string: picUrlStr) else{
            fatalError("Invalid URL")
        }
        
        // URL 연결 후 Data instance 생성
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if let error = error{
                print(error)
            }else if let data = data{
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        
        task.resume()
    }
}
