//
//  RESTAPI.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation
//
//func topArticles(limit: Int) -> [String] {
//    let url = URL(string: "https://jsonmock.hackerrank.com/api/articles")!
//    let request = URLRequest(url: url)
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data else {
//            return
//        }
//        
//        guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
//            return
//        }
//        
//        let totalPages = response.total_pages
//        
//        getEveryPages(totalPages: totalPages) { articles in
//            articles.filter {
//                $0.title == nil && $0.story_title
//            }.map { article in
//                if article.title == nil {
//                    return
//                } else {
//                    return article
//                }
//            }
//            articles.sorted {
//                if $0.num_comments == $1.num_comments {  }
//                $0.num_comments > $1.num_comments
//                
//            }
//        }
//    
//    }.resume()
//}

func getEveryPages(totalPages: Int, completion: @escaping ([Article]) -> Void) {
    var components = URLComponents(string: "https://jsonmock.hackerrank.com/api/articles")!

    let group = DispatchGroup()
    
    let result = Container()
    
    for i in 1...totalPages {
        components.query = "/page=\(i)"
        guard let requestURL = components.url else { return }
        group.enter()
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let data = data else { return }
            
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                return
            }
            
            result.articles += response.data
            group.leave()
        }.resume()
    }
    
    group.notify(queue: .main) {
        completion(result.articles)
    }
}

class Container {
    var articles = [Article]()
}


struct Response: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [Article]
}

struct Article: Decodable {
    let title: String?
    let story_title: String?
    let num_comments: Int
}
