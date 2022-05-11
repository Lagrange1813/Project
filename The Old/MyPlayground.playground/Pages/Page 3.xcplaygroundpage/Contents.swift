//: [Previous](@previous)

import Foundation

var numberOfLegs = ["spider": 8, "ant":6]
numberOfLegs["fly"] = 2
numberOfLegs

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

class Food {
    var name: String
    // 指定初始化器
    init(name: String) {
        self.name = name
    }
    // 便捷初始化器
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)    // 调用父类的初始化器初始化父类属性
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
var test = RecipeIngredient()

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let test1 = TemperatureUnit(symbol: "K")
print(test1!)
