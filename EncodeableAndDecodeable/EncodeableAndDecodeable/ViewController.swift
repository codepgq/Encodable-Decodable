//
//  ViewController.swift
//  EncodeableAndDecodeable
//
//  Created by pgq on 2017/12/9.
//  Copyright © 2017年 pgq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func encodeableBtnClick(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let post = Post(body: "给我滚出去", title: "你好啊，小明", id: 787, userId: 87)
        do {
            let jsonBody = try JSONEncoder().encode(post)
            request.httpBody = jsonBody
        } catch {
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode(Post.self, from: data)
                print(json)
            }catch{
                print(error)
            }
        }.resume()
    }
    
    @IBAction func decodeableBtnClick(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do{
                //原始解析方法
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                print(json)
                
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users{
                    print(user.address.geo.lat)
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}

