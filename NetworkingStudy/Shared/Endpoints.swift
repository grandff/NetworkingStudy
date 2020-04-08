//
//  Endpoints.swift
//  NetworkingStudy
//
//  Created by 김정민 on 2020/04/08.
//  Copyright © 2020 kjm. All rights reserved.
//

import Foundation

/*
    Network Overview
    1. Network 공부 전에 미리 환경 설정을 함
    2. Postman을 설치해서 API sample code 확인
    --> 파일 임포트 후 콜렉션에 추가된 항목을 선택해서 확인 가능함
    3. 파일 업로드, 다운로드는 드롭박스를 통해서 하므로 드롭박스에서 선택
    4. 미리 주어진 파일 올려놓고, 링크 생성
    5. 드롭 박스에서 개발자 모드로 들어간 후 앱을 생성하면 AccessToken을 만들 수 있음
 */

// 파일 링크 생성 (4)
let bigFileUrlStr = "https://dl.dropboxusercontent.com/s/omsh5xb8c2dlkge/intro-big.mp4?dl=0"
let smallFileUrlStr = "https://dl.dropboxusercontent.com/s/u0uzj91bco13pu1/intro-small.mp4?dl=0"
let picUrlStr = "https://dl.dropboxusercontent.com/s/zxnwfgybe0d71jl/pic.jpg?dl=0"

// AccessToken 생성 (5)
let dropBoxAccessToken = "7Tm6LSlSkdAAAAAAAAAALWfHGvmVubsAmaDXi9bjarE6VRvBmRRzTXnQc9gqpaAP"
