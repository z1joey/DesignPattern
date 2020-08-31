public protocol TimerOption {
    var hours: Int { get set }
    var minutes: Int { get set }
    var seconds: Int { get set }
}

public protocol TemperatureOption {
    var temperature: Float { get set }
}

public protocol MotorOption {
    var speed: Int { get set }
    var isClockwise: Bool { get set }
}

public protocol HeatOption {
    var heatAt: Int { get set }
}

public protocol FanOption {
    var isFanOn: Bool { get set }
}

public protocol ScaleOption {
    var weight: Float { get set }
}

public protocol DeviceMode {
    static var cellIndexes: [Int] { get set }
}

public protocol SteamingMode: DeviceMode, TimerOption {}
public protocol RoastingMode: DeviceMode, TimerOption, TemperatureOption {}
public protocol ScalingMode: DeviceMode, ScaleOption {}
public protocol KneadingMode: DeviceMode, TimerOption {}

public struct Steaming: SteamingMode {
    public static var cellIndexes: [Int] = [0, 1]
    public var hours: Int = 0
    public var minutes: Int = 10
    public var seconds: Int = 0
}

public struct Device {
    public let mode: DeviceMode
}

let steaming = Steaming()
let device = Device(mode: steaming)
print(device.mode is SteamingMode)
print(device.mode is RoastingMode)

let castedMode = device.mode as? SteamingMode
print(castedMode?.minutes)

