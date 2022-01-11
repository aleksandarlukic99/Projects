//
//  HolidayRequest.swift
//  Holidays
//
//  Created by aleksandar on 27.12.21..
//

import Foundation

enum HolidayError: Error {
    case noDataAvaliable
    case canNotProcessData
}

struct HolidayRequest {
    
    let resourceURL: URL
    let apiKey = "180b76de2e99578326db197c41bbc24d851b57bb"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(apiKey)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvaliable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetail = holidaysResponse.response.holidays
                completion(.success(holidayDetail))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}
