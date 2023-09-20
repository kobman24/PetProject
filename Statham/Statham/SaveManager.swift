//
//  SaveManager.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//
import Foundation
class SaveManager: ObservableObject {
    @Published var arrayFinalQuote: [String] = []
    
    let defaults = UserDefaults.standard
    
    init() {
        
        if let loadedValues = UserDefaults.standard.stringArray(forKey: "dataFinalQuote") {
            self.arrayFinalQuote = loadedValues
        }
    }
    
    func saveFinalQuote(finalquote: String) {
        self.arrayFinalQuote.append(finalquote)
        defaults.set(arrayFinalQuote, forKey: "dataFinalQuote")
    }
    
    func loadFinalQuote() {
        guard let loadedValues = UserDefaults.standard.stringArray(forKey: "dataFinalQuote") else { return }
        self.arrayFinalQuote = loadedValues
        print("Загруженные значения переменной: \(loadedValues)")
    }
}
