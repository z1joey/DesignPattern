enum FlyBehaviour {
    case withWings, noWay

    func fly() {
        switch self {
        case .withWings:
            print("Fly with wings !!")
        case .noWay:
            print("Fly No Way !!")
        }
    }
}

enum QuackBehaviour {
    case quack, squeak, mute

    func quack() {
        switch self {
        case .quack:
            print("Quack")
        case .squeak:
            print("Squeak")
        case .mute:
            print("MuteQuack")
        }
    }
}

protocol Duck {
    var quackBehaviour: QuackBehaviour { get set }

    func setQuackBehaviour(quack: QuackBehaviour)
    func setFlyBehaviour(fly: FlyBehaviour)
}

class SomeDuck {
    var quackBehaviour: QuackBehaviour?

    func setQuackBehaviour(quack: QuackBehaviour) {
        quackBehaviour = quack
    }
}

//let mDuck = SomeDuck()
//mDuck.setQuackBehaviour(quack: .quack)

