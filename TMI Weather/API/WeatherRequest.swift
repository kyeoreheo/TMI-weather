import Foundation
enum WeatherError: Error {
    case noCityFound
    case APIError
    case canNotProcessData
}

enum WeatherType {
    case current
    case fiveDays
}

struct WeatherRequest {
    let myURL: URL
    let API_KEY = "9c7f53429bd3aa10ceb244443831b51f"
    
    init(zipCode: String, country: String, type: WeatherType) {
        switch type {
            case .current:
                let currentURL = "https://api.openweathermap.org/data/2.5/weather?zip=\(zipCode),\(country)&appid=\(API_KEY)"
                guard let resourceURL = URL(string: currentURL)
                else { fatalError() }
                myURL = resourceURL
            case .fiveDays:
                let fiveDaysURL = "https://api.openweathermap.org/data/2.5/forecast?zip=\(zipCode),\(country)&appid=\(API_KEY)"
                guard let resourceURL = URL(string: fiveDaysURL)
                else { fatalError() }
                myURL = resourceURL
        }
    }
    
    func getCurrentWeather (completion: @escaping (Result<CurrentWeatherResponse, WeatherError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: myURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.APIError))
                return
            }
            do {
                let myDecoder = JSONDecoder()
                let currentWeatherResponse = try myDecoder.decode(CurrentWeatherResponse.self, from: jsonData)
                completion(.success(currentWeatherResponse))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
    func getFiveDaysWeather (completion: @escaping (Result<FiveDaysResponse, WeatherError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: myURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.APIError))
                return
            }
            do {
                let myDecoder = JSONDecoder()
                let fiveDaysResponse = try myDecoder.decode(FiveDaysResponse.self, from: jsonData)
                completion(.success(fiveDaysResponse))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
