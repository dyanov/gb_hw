import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.


enum DepositError: Error {
    
    case currencyNotFound
    case rublesIsNotEnough
}

class Deposit {
    
    private var currency = [ //перечисление валют и их курса к рублю
        
        "eur": 92,
        "usd": 83,
        "gbp": 105
        
    ]
    var rub = 1000
    
    func averageRate() -> Int {
        
        guard currency.count > 0 else {
            return 0
            
        }
        var sumRate = 0
        for curr in currency {
            sumRate += curr.value
        }
        return sumRate/currency.count
        
    }
    
    func exchangeRate(atName name: String) -> (Int?, DepositError?) {
        
        guard let name = currency[name] else {
              return(nil, DepositError.currencyNotFound)
          }
        return (name, nil)
    }
    
    
    func currencyPurchase (atName name: String, count: Int) -> (Int, DepositError?) {
        guard rub > (currency[name] ?? 0)*count else {
            return(rub, DepositError.rublesIsNotEnough)
        }
        rub -= (currency[name] ?? 0)*count
        return(rub, nil)
    }

}

let deposit = Deposit()
print(deposit.exchangeRate(atName: "eur")) //метод отобразит курс евро - 92
print(deposit.exchangeRate(atName: "czn")) //метод выбросит ошибку currencyNotFound
print(deposit.averageRate()) //93 - средний курс трех валют к рублю
deposit.currencyPurchase(atName: "eur", count: 10) //покупаем 10 евро, остается 80 рублей
deposit.currencyPurchase(atName: "usd", count: 5) //пытаемся купить 5 долларов, метод выбрасывает ошибку rublesIsNotEnough

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum CarsheringErrors: Error {
    case carNotFound
    case carOutOfStock
    case notEnoughMoney
}

struct Car {
    
    var count: Int
    var price: Int
    var name: String
    
}

class Carshering { //салон по аренде авто
    
    var cars = [
        "BMW": Car(count: 3, price: 2500, name: "BMW"),
        "Lada": Car(count: 5, price: 1000, name: "Lada"),
        "Gazel": Car(count: 1, price: 1500, name: "Gazel"),
        "Ferrari": Car(count: 1, price: 5000, name: "Ferrari")
    ]
    
    var money = 3500 //деньги, которые есть у клиента
    
    func rentACar (CarNamed name: String) throws {
        
        guard var car = cars[name] else {
            throw CarsheringErrors.carNotFound
        }
        guard car.count > 0 else {
            throw CarsheringErrors.carOutOfStock
        }
        guard  car.price < money else {
            throw CarsheringErrors.notEnoughMoney
    }
       
        money -= car.price
        car.count -= 1
        
        print("Вы взяли в аренду \(car.name). Остаток таких авто в салоне: \(car.count). Остаток денег: \(money). ")
        
    }
}

let carshering = Carshering()

do {
try carshering.rentACar(CarNamed: "Ferrari") //попытка закончится ошибкой Not enough money.

} catch CarsheringErrors.carNotFound {
    print("Car is not found.")
} catch CarsheringErrors.carOutOfStock {
    print("Car out of stock now.")
} catch CarsheringErrors.notEnoughMoney {
    print("Not enough money.")
}


