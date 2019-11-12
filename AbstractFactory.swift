protocol PizzaIngredientFactory {
    func createDough() -> String
    func createSauce() -> String
    func createCheese() -> String
    func createPepperoni() -> String
    func createClam() -> String

    func createVeggies() -> [String]
}

extension PizzaIngredientFactory {
    func createDough() -> String {
        return "Dough"
    }

    func createSauce() -> String {
        return "Sauce"
    }

    func createCheese() -> String {
        return "Cheese"
    }

    func createPepperoni() -> String {
        return "Pepperoni"
    }

    func createClam() -> String {
        return "Clam"
    }

    func createVeggies() -> [String] {
        return []
    }
}

class NYPizzaIngredientFactory: PizzaIngredientFactory {
    func createCheese() -> String {
        return "NY Cheese"
    }

    func createVeggies() -> [String] {
        return ["Garlic", "Onion"]
    }
}

protocol Pizza {
    var name: String { get set }
    var dough: String { get set }
    var sauce: String { get set }
    var cheese: String { get set }
    var clams: String { get set }

    var veggies: [String] { get set }
    var toppings: [String] { get set }

    func prepare()

    func bake()
    func cut()
    func box()

    func getName() -> String
}

extension Pizza {
    func prepare() {
        print("Preparing \(name)")
        print("Tossing dough...")
        print("Adding sauce...")
        print("Adding toppings:")

        for topping in toppings {
            print("\(topping)\n")
        }
    }

    func bake() {
        print("Bake for 25 minutes with \(dough)")
    }

    func cut() {
        print("Cutting the pizza into diagonal slices")
    }

    func box() {
        print("Place pizza in official PizzaStore box")
    }

    func getName() -> String {
        return name
    }
}

class CheesePizza: Pizza {
    var factory: PizzaIngredientFactory

    var name: String = "Cheese Pizza"
    var dough: String = String()
    var sauce: String = String()
    var cheese: String = String()
    var clams: String = String()
    var veggies: [String] = []
    var toppings: [String] = []

    init(ingredientFactory: PizzaIngredientFactory) {
        factory = ingredientFactory
        prepare()
    }

    func prepare() {
        dough = factory.createDough()
        sauce = factory.createSauce()
        cheese = factory.createCheese()
        clams = factory.createClam()
        veggies = factory.createVeggies()
    }
}

protocol PizzaStore {
    func orderPizza(type: String) -> Pizza
    func createPizza(type: String) -> Pizza
}

extension PizzaStore {
    func orderPizza(type: String) -> Pizza {
        let pizza = createPizza(type: type)

        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()

        return pizza
    }
}

class NYPizzaStore: PizzaStore {
    var factory = NYPizzaIngredientFactory()

    func createPizza(type: String) -> Pizza {
        return CheesePizza(ingredientFactory: factory)
    }
}

//let nyStore = NYPizzaStore()
//nyStore.orderPizza(type: "")


