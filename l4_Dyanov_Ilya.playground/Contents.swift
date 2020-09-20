import Foundation

enum Color: String {
    case red, white
    //    case cool = "cool"
    //    case notSoCool = "not so cool"
}

enum NumberOfSeats: Int {
    case two = 2
    case four = 4
}

enum NumberOfWheels: Int {
    case four = 4
    case ten = 10
}

enum CargoStatus: String {
    case unloaded, loaded
}

enum EngineStatus: String {
    case started, stopped
}

enum FuelTank: String {
    case empty, petrol, diesel
}
class Car {
    
    let color: Color
    let seats: NumberOfSeats
    let wheels: NumberOfWheels
    
    init(color: Color, seats: NumberOfSeats, wheels: NumberOfWheels) {
        self.color = color
        self.seats = seats
        self.wheels = wheels
        
    }
    
    func description() {
        print("Auto in \(color) color. Wheels: \(wheels). Seats: \(seats)")
    }
    
}

class SportCar: Car {
    
    var maxspeed: Double
    let model: String
    var engine: EngineStatus = .stopped
    var openWindows: Bool = false
    var fuelTank: FuelTank = .empty
    
    
    init(maxspeed: Double, model: String) {
        self.maxspeed = maxspeed
        self.model = model
        super.init(color: .red, seats: .two, wheels: .four)
    }
    
    func isWindowsOpen() {
        self.openWindows.toggle()
        print(openWindows ? "\(self.model) windows opened." : "\(self.model) windows closed." )
    }
    
    func changeEngineStatus() {
        switch self.engine {
        case .stopped:
            print("Start engine.")
            self.engine = .started
        case .started:
            print("Stop engine.")
            self.engine = .stopped
        }
    }
    
    func refuelCar() {
        switch self.fuelTank {
        case .empty:
            print("Petrol is filled in \(model).")
            self.fuelTank = .petrol
        case .petrol:
            print("Petrol has already been filled in \(model).")
        case .diesel:
            print("Incorrect fuel in the fuel tank. Contact a car service.")
        }
    }
    
    func upgradeEngine () {
        self.maxspeed = round(maxspeed*1.21*100)/100
        print("Engine of \(model) has been upgraded. Currently max speed: \(self.maxspeed) km/h.")
    }
    
    override func description() {
        super.description()
        print("Model: \(model). Maxspeed: \(maxspeed) km/h. Fuel: \(fuelTank). Engine: \(engine).")
    }
    
}

class TrunkCar: Car {
    
    var capacity: Double
    let model: String
    var cargo: CargoStatus = .unloaded
    var readyToGo: Bool = false
    var fuelTank: FuelTank = .empty
    
    init(capacity: Double, model: String) {
        self.capacity = capacity
        self.model = model
        super.init(color: .white, seats: .four, wheels: .ten)
        
    }
    
    func upgradeCapacity() {
        self.capacity = round(capacity*1.45*100)/100
        print("Capacity of \(model) has been upgraded. Currently value: \(self.capacity) kg.")
    }
    
    func changeCargoStatus() -> Double {
        switch self.cargo {
        case .loaded:
            self.capacity = capacity + 5000
            print("Unload cargo 5000 kg. Currently capacity: \(self.capacity) kg.")
            self.cargo = .unloaded
            
        case .unloaded:
            self.capacity = capacity - 5000
            print("Load cargo 5000 kg. Currently capacity: \(self.capacity) kg.")
            self.cargo = .loaded
        }
        return self.capacity
        
    }
    
    func refuelCar() {
        switch self.fuelTank {
        case .empty:
            print("Diesel is filled in \(model).")
            self.fuelTank = .diesel
        case .diesel:
            print("Diesel has already been filled in \(model).")
        case .petrol:
            print("Incorrect fuel in the fuel tank. Contact a car service.")
        }
    }
    
    override func description() {
        super.description()
        print("Model: \(model). Capacity: \(capacity) kg. Cargo status: \(cargo). Fuel: \(fuelTank).")
    }
    
}

var ferrari = SportCar(maxspeed: 317, model: "F40")
var lamborghini = SportCar(maxspeed: 343, model: "Aventador")
var volvo = TrunkCar(capacity: 10000, model: "FH 16")
var man = TrunkCar(capacity: 8000, model: "TGX")

ferrari.description()
ferrari.upgradeEngine()
ferrari.refuelCar()
ferrari.changeEngineStatus()
print("\n")
lamborghini.description()
lamborghini.refuelCar()
lamborghini.isWindowsOpen()
lamborghini.changeEngineStatus()
print("\n")
man.description()
man.refuelCar()
man.changeCargoStatus()
print("\n")
volvo.description()
volvo.upgradeCapacity()
volvo.changeCargoStatus()





