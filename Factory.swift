public protocol Pizza {
    var name: String { get set }
    var dough: String { get set }
    var sauce: String { get set }

    var toppings: [String] { get set }

    func prepare()

    func bake()
    func cut()
    func box()

    func getName() -> String
}

extension Pizza {
    func prepare()
    {
        print("Preparing \(name)")
        print("Tossing dough...")
        print("Adding sauce...")
        print("Adding toppings:")

        for topping in toppings {
            print("\(topping)\n")
        }
    }

    func bake()
    {
        print("Bake for 25 minutes at 350")
    }

    func cut()
    {
        print("Cutting the pizza into diagonal slices")
    }

    func box()
    {
        print("Place pizza in official PizzaStore box")
    }

    func getName() -> String {
        return name
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
    func createPizza(type: String) -> Pizza {
        if type.contains("cheese") {
            return NYStyleCheesePizza()
        } else {
            return NYStyleVeggiePizza()
        }
    }
}

class ChicagoPizzaStore: PizzaStore {
    func createPizza(type: String) -> Pizza {
        return ChicagoStyleCheesePizza()
    }
}

class NYStyleCheesePizza: Pizza {
    var name: String
    var dough: String
    var sauce: String

    var toppings: [String] = []

    init() {
        name = "NY Style Sauce and Cheese Pizza"
        dough = "Thin Crust Dough"
        sauce = "Marinara Sauce"

        toppings.append("Grated Reggiano Cheese")
    }
}

class NYStyleVeggiePizza: Pizza {
    var name: String
    var dough: String
    var sauce: String

    var toppings: [String] = []

    init() {
        name = "NY Style Veggie Pizza"
        dough = "Veggie"
        sauce = "Veggie"

        toppings.append("Veggie")
    }
}

class ChicagoStyleCheesePizza: Pizza {
    var name: String
    var dough: String
    var sauce: String

    var toppings: [String] = []

    init() {
        name = "Chicago Style Deep Dish Cheese Pizza"
        dough = "Extra Thick Crust Dough"
        sauce = "Plum Tomato Sauce"

        toppings.append("Shredded Mozzarella Cheese")
    }

    func cut() {
        print("Cutting the pizza into square slices")
    }
}

//let nyStore = NYPizzaStore()
//let chStore = ChicagoPizzaStore()
//
//var pizza: Pizza = nyStore.orderPizza(type: "cheese")
//print(pizza.getName())
//
//pizza = chStore.orderPizza(type: "whatever")
//print(pizza.getName())


