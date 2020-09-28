import Foundation

class Car {
    var model: String
    var maxspeed: Int
    var engine: Double
    
    init(model: String, maxspeed: Int, engine: Double){
        self.model = model
        self.maxspeed = maxspeed
        self.engine = engine
    }
}

struct Stack<T>: CustomStringConvertible {
    
    var items = [T]()
    
    var description: String {
        return "\(items.description)"
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func push(_ item: T){
        items.append(item)
    }
    
    
    mutating func pop() -> T{
        items.removeLast()
    }
    
    subscript (index: Int) -> T? {
        
        if index >= items.count {
            return nil
        }
        return items[index]
    }
}

extension Stack {
    func FilterByMaxspeed(speed: Int) -> Array<String> {
        
        var FilterByMaxspeedStackCars = [String]()
        var i = 0
        while i<(StackCars.count-1) {
            if StackCars[i]!.maxspeed > speed
            { FilterByMaxspeedStackCars.append(StackCars[i]!.model)
            }
            i += i
        }
            return FilterByMaxspeedStackCars
        }
}



var StackCars = Stack<Car>()

StackCars.push(Car(model: "BMW", maxspeed: 287, engine: 3.2))
StackCars.push(Car(model: "Audi", maxspeed: 256, engine: 2.0))
StackCars.push(Car(model: "Lada", maxspeed: 185, engine: 1.6))
StackCars.push(Car(model: "Ferarri", maxspeed: 324, engine: 4.2))
StackCars.push(Car(model: "Lamborgini", maxspeed: 357, engine: 4.8))


print(StackCars[5] as Any) //проверка вывода nil

print(StackCars[0]!.model) // проверка вывода модели

print(StackCars.count) //проверка вывода количества items в созданном стэке

StackCars.FilterByMaxspeed(speed: 200) // метод, который возвращает массив моделей, чья скорость выше указанной в аргументе функции

