public protocol Option {
    var index: Int { get set }
    var description: String { get }
}

public protocol TimerOption: Option {
    var hours: Int { get set }
    var minutes: Int { get set }
    var seconds: Int { get set }
}

public protocol TemperatureOption: Option {
    var temperature: Float { get set }
}

public protocol SpeedOption: Option {
    var speed: Int { get set }
}

public protocol ReversableOption: Option {
    var isReverse: Bool { get set }
}

public protocol HeatOption: Option {
    var heatAt: Int { get set }
}

public protocol FanOption: Option {
    var isFanOn: Bool { get set }
}

public protocol ScaleOption: Option {
    var weight: Float { get set }
}

public class Fan: FanOption {
    public var index: Int = 0
    public var isFanOn: Bool = false

    public var description: String {
        return "index: \(index), isFanOn: \(isFanOn)"
    }
}

public class Heat: Option {
    public var index: Int = 1
    public var heatAt: Int = 3

    public var description: String {
        return "index: \(index), heatAt: \(heatAt)"
    }
}

public struct DeviceControl {
    public var options: [Option]
}

let fan = Fan()
let heat = Heat()

let deviceControl = DeviceControl(options: [fan, heat])

//print(deviceControl.options.count)

//for option in deviceControl.options {
//    if option.index == 0 && option is Fan {
//        (option as! Fan).isFanOn.toggle()
//    }
//    if option.index == 1 && option is Heat {
//        (option as! Heat).heatAt = 6
//    }
//}

//print(deviceControl.options.first?.description)
//print(deviceControl.options.last?.description)
