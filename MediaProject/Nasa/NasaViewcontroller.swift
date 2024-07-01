//
//  NasaViewController.swift
//  NetworkURLSessionGCD
//
//  Created by 최민경 on 7/1/24.
//

import UIKit

// 컴파일 최적화


class NasaViewController: BaseViewController {
    
    enum Nasa: String, CaseIterable {
        
        static let baseURL = "https://apod.nasa.gov/apod/image/"
        
        case one = "2308/sombrero_spitzer_3000.jpg"
        case two = "2212/NGC1365-CDK24-CDK17.jpg"
        case three = "2307/M64Hubble.jpg"
        case four = "2306/BeyondEarth_Unknown_3000.jpg"
        case five = "2307/NGC6559_Block_1311.jpg"
        case six = "2304/OlympusMons_MarsExpress_6000.jpg"
        case seven = "2305/pia23122c-16.jpg"
        case eight = "2308/SunMonster_Wenz_960.jpg"
        case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
         
        static var photo: URL {
            return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
        }
    }
    
    
    let nasaImageView = UIImageView()
    let progressLabel = UILabel()
    let requestButton = UIButton()
    
    var total: Double = 0 // 이미지의 총 크기
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total // buffer.count 는 몇 바이트인지, 바이트 수를 나타냄
            progressLabel.text = "\(result * 100 ) / 100"
        }
    }
    
    // 네트워크를 요청하고 주고 받기 위해서 사용함
    var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 현재 진행중인 네트워크 작업을 모드 취소
        session.invalidateAndCancel()
        // 현재 진행 중인 작업을 완료한 후 세션을 무효화합니다.
        session.finishTasksAndInvalidate()
    }
    
    func callRequest() {
        
        let request = URLRequest(url: Nasa.photo)
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
            
        session.dataTask(with: request).resume()
        
        
    }
    
    @objc func requestButtonClicked() {
        print(#function)
        
        buffer = Data() // nil이 아닌 상태로 만들어야 됨 0바이트라도 만들어야지 append 가능
        callRequest()
    }
    
    override func configureHierarchy() {
        view.addSubview(requestButton)
        view.addSubview(progressLabel)
        view.addSubview(nasaImageView)
    }
    
    override func configureView() {
        requestButton.backgroundColor = .blue
        progressLabel.backgroundColor = .lightGray
        nasaImageView.backgroundColor = .systemBrown
        requestButton.addTarget(self, action: #selector(requestButtonClicked), for: .touchUpInside)
    }
    
    override func configureLayout() {
        requestButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(requestButton.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        nasaImageView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(progressLabel.snp.bottom).offset(20)
        }
    }

}

extension NasaViewController: URLSessionDataDelegate {
    
    // 서버에서 최초로 응답 받은 경우에 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print(#function, response)
        
        // 응답을 HTTPURLResponse로 캐스팅하고, 상태 코드가 200에서 299 사이에 있는지 확인
        //HTTPURLResponse 는 HTTP 응답에 특화된 프로토콜, HTTPURLResponse를 사용하면 상태코드를 확인할 수있음
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            
            // 응답 헤더에서 "Content-Length" 값을 가져옴
            // "Content-Length" HTTP헤더 필드는 HTTP응답의 데이터의 총 바이트 수를 나타냄
            let contentLength = response.value(forHTTPHeaderField: "content-Length")!
            
            total = Double(contentLength)!
            
            return .allow
        } else {
            return .cancel
        }
    }
    
    // 서버에서 데이터를 받아올 때마다 반복적으로 호출됨
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(#function, data)
        
        buffer?.append(data) // 데이터가 계속 추가 되고 있는거 아닌가...? 제거 안 해줘도 됨??.. => vc가 메모리에서 해제 되면 변수 buffer도 해제 됨 ㅇㅇ
    }
    
    // 응답이 완료가 될 때 호출됨.
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        print(#function, error)
        
        if let error = error {
            progressLabel.text = "문제가 발생했습니다."
        } else {
            print("성공") // completionHandler 시점과 동일
            
            guard let buffer = buffer else {
                print("Buffer nil")
                return
            }
            
            let image = UIImage(data: buffer)
            nasaImageView.image = image
        }
    }
}
