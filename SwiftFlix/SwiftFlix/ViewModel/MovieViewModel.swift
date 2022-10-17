//
//  MovieViewModel.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 13/10/22.
//

import Foundation
import Alamofire

enum Errors {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJson
}

class TMDB_API{
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-type" : "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)

    static private let basePath = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&"
    static private let key = "e6b1a12b8f0352dc460778b870447b5a"
    static private let language = "pt-BR"

    class func getMovies(page: Int = 1 , onComplete: @escaping ([MoviesData]) -> Void, onError: @escaping (Errors) -> Void) {
        guard let url = URL(string: basePath + "api_key=\(key)&language=\(language)&page=\(page)" ) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do{
                        let info = try JSONDecoder().decode(MovieInfo.self, from: data)
                        onComplete(info.results)
                    }catch{
                        print(error.localizedDescription)
                        onError(.invalidJson)
                    }
                }else {
                    print("Algum status invalido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                print(error!)
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
  }


