// MARK: - Beverage
public protocol Beverage {
    var description: String { get set }

    func getDescription() -> String
    func cost() -> Double
}

extension Beverage {
    public func getDescription() -> String {
        return description
    }
}

// MARK: - CodimentDecorator
public protocol CodimentDecorator: Beverage {
    func getDescription() -> String
}

// MARK: - Classes
public class Espresso: Beverage {

    public var description: String

    public func cost() -> Double {
        return 1.99
    }

    init() {
        description = "Espresso"
    }

}

public class HouseBlend: Beverage {

    public var description: String

    public func cost() -> Double {
        return 0.89
    }

    init() {
        description = "HouseBlend"
    }

}

public class Mocha: CodimentDecorator {

    var beverage: Beverage

    public var description: String = ""

    init(beverage: Beverage) {
        self.beverage = beverage
    }

    public func cost() -> Double {
        return 0.20 + beverage.cost()
    }

    public func getDescription() -> String {
        return beverage.getDescription() + ", Mocha"
    }

}

//var espresso = Espresso()
//print("\(espresso.getDescription()), \(espresso.cost())$")
//
//var mocha = Mocha(beverage: espresso)
//print("\(mocha.getDescription()), \(mocha.cost())$")



