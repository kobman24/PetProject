//
//  Api.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import Foundation
class Networking: ObservableObject {
    @Published var finalquote: ForismaticQuote? = nil
    
    
    init() {
        fetchRandomQuote()
    }
    func fetchRandomQuote() {
        let baseUrl = "http://api.forismatic.com/api/1.0/"
        let method = "getQuote"
        let format = "json"
        let lang = "ru"

        guard var components = URLComponents(string: baseUrl) else { return }
        components.queryItems = [
            URLQueryItem(name: "method", value: method),
            URLQueryItem(name: "format", value: format),
            URLQueryItem(name: "lang", value: lang)
        ]

        if let url = components.url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка: \(error)")
                } else if let data = data {
                    do {
                       
                        let quote = try JSONDecoder().decode(ForismaticQuote.self, from: data)
                        DispatchQueue.main.async {
                            self.finalquote = quote
                        }
                        
                        print("Цитата: \(quote.quoteText)")
                        print("Автор: \(quote.quoteAuthor)")
                        
                    } catch {
                        print("Ошибка при декодировании JSON: \(error)")
                    }
                }
            }.resume()
        }
        
        
    }

}
