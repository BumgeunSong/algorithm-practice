//
//  RESTAPI.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func topArticles(limit: Int, completion: @escaping ([String]?) -> Void)  {
    let session = URLSession.shared
    
    let urlComponents = URLComponents(string: "https://jsonmock.hackerrank.com/api/articles")!
    let url = urlComponents.url!
    let request = URLRequest(url: url)
    
    var totalPages = 0
    let getTotalPage = DispatchGroup()
    
    getTotalPage.enter()
    session.dataTask(with: request) { data, response, error in
        guard let data = data else { return }
        
        guard let wrapper = try? JSONDecoder().decode(Response.self, from: data) else {
            return
        }
        
        totalPages = wrapper.totalPages
        getTotalPage.leave()
    }.resume()
    
    
    let getTotalArticle = DispatchGroup()
    var totalArticle = [Article]()
    
    
    let getEveryArticle = DispatchWorkItem {
        let urls: [URL] = (0..<totalPages).map { pageNumber in
            var urlComponents = urlComponents
            urlComponents.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)")]
            return urlComponents.url!
        }
        
        for url in urls {
            let request = URLRequest(url: url)
            getTotalArticle.enter()
            session.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    
                    return
                }
                guard let wrapper = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
                totalArticle += wrapper.data
                getTotalArticle.leave()
            }.resume()
        }
        
        
        getTotalArticle.notify(queue: .global(), work: DispatchWorkItem {
            let totalArticleWithNumComments = totalArticle.filter {
                return $0.numComments != nil
            }
            
            let sortedArticles = totalArticleWithNumComments.sorted {
                guard let leftNumComments = $0.numComments, let rightNumComments = $1.numComments else {
                    return true
                }
                
                if leftNumComments == rightNumComments {
                    let leftTitle = $0.title != nil ? $0.title! : $0.storyTitle!
                    let rightTitle = $1.title != nil ? $1.title! : $1.storyTitle!
                    return leftTitle > rightTitle
                }
                
                return leftNumComments > rightNumComments
            }
            
            let topArticles = sortedArticles[0..<limit]
            completion(topArticles.compactMap { $0.title })
        })
    }
    getTotalPage.notify(queue: .global(), work: getEveryArticle)
   
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Article]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - Datum
struct Article: Codable, CustomStringConvertible {
    let title: String?
    let url: String?
    let author: String
    let numComments: Int?
    let storyID: JSONNull?
    let storyTitle: String?
    let storyURL: String?
    let parentID: Int?
    let createdAt: Int
    
    enum CodingKeys: String, CodingKey {
        case title, url, author
        case numComments = "num_comments"
        case storyID = "story_id"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAt = "created_at"
    }
    
    var description: String {
        """
        title: \(title)\n
        storyTitle: \(storyTitle)\n
        numComments: \(numComments)\n
        """
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
