import Foundation

// MARK: - Protocols
public protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

public protocol Observer {
    func update(temp: Float, humidity: Float, pressure: Float)
}

public protocol DisplayElement {
    func display()
}

// MARK: - Classes
public class WeatherData: Subject {

    private var observers: [Observer] = []

    private var temperature: Float = 0.0
    private var humidity: Float = 0.0
    private var pressure: Float = 0.0

    // MARK: - Subject
    public func registerObserver(observer: Observer) {
        observers.append(observer)
    }

    public func removeObserver(observer: Observer) {
        observers.removeAll()
    }

    public func notifyObservers() {
        observers.forEach {
            $0.update(temp: temperature, humidity: humidity, pressure: pressure)
        }
    }

    // MARK: - APIs
    public func measurementsChanged() {
        notifyObservers()
    }

    public func setMeasurements(temp: Float, humidity: Float, pressure: Float) {
        self.temperature = temp
        self.humidity = humidity
        self.pressure = pressure

        measurementsChanged()
    }

}

public class CurrentConditionsDisplay: Observer, DisplayElement {
    private var temperature: Float = 0.0
    private var humidity: Float = 0.0

    private var weatherData: Subject

    init(weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.registerObserver(observer: self)
    }

    public func update(temp: Float, humidity: Float, pressure: Float) {
        self.temperature = temp
        self.humidity = humidity
        display()
    }

    public func display() {
        print("🏖Current conditions: \n\(temperature) F degrees \n\(humidity) % humidity")
    }
}

let weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay(weatherData: weatherData)

// weatherData.setMeasurements(temp: 90, humidity: 60, pressure: 30.4)

