import Foundation

struct SportCar {
    
    enum windowsPosition: String {
        case opened
        case closed
    }
    enum engineStatus: String {
        case started
        case stopped
    }
    
    let modelAuto: String
    let color: String
    let year: Int
    var maxspeed: Double
    var engine: engineStatus = .stopped
    var windows: windowsPosition = .closed
    
    mutating func changeWindowsPosition() {
        switch self.windows {
        case .closed:
            print("Open windows.")
            self.windows = .opened
        case .opened:
            print("Close windows.")
            self.windows = .closed
        }
    }
    
    mutating func changeEngineStatus() {
        switch self.engine {
        case .stopped:
            print("Start engine.")
            self.engine = .started
        case .started:
            print("Stop engine.")
            self.engine = .stopped
        }
    }
    
    mutating func upgradeEngine () {
        self.maxspeed = round(maxspeed*1.21*100)/100
        print("Engine of \(modelAuto) has been upgraded. Currently max speed: \(self.maxspeed) km/h.")
    }
    
    func description () {
        print("Model \(modelAuto) in \(color) color. Production year: \(year). Max speed: \(maxspeed) km/h. Engine: \(engine). Windows: \(windows)")
    }
    
}

struct TrunkCar {
    
    enum engineStatus: String {
        case started
        case stopped
    }
    
    enum cargoStatus: String {
        case loaded
        case unloaded
    }
    
    var modelAuto: String
    var color: String
    var year: Int
    var engine: engineStatus = .stopped
    var capacity: Double
    var cargo: cargoStatus = .unloaded
    
    mutating func changeEngineStatus() {
        switch self.engine {
        case .stopped:
            print("Start engine.")
            self.engine = .started
        case .started:
            print("Stop engine.")
            self.engine = .stopped
        }
    }
    
    mutating func upgradeCapacity() {
        self.capacity = round(capacity*1.45*100)/100
        print("Capacity of \(modelAuto) has been upgraded. Currently value: \(self.capacity) kg.")
    }
    
    mutating func changeCargoStatus() -> Double {
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
    
    func description () {
           print("Model \(modelAuto) in \(color) color. Production year: \(year). Capacity: \(capacity) kg. Cargo: \(cargo). Engine: \(engine).")
       }
    
}

var ferrari = SportCar(modelAuto: "F40", color: "yellow", year: 2011, maxspeed: 357)
ferrari.description()
ferrari.upgradeEngine()
ferrari.changeWindowsPosition()
ferrari.changeEngineStatus()
ferrari.description()

print("\n")

var lamborghini = SportCar(modelAuto: "Aventador", color: "green", year: 2017, maxspeed: 321)
lamborghini.description()
lamborghini.upgradeEngine()
lamborghini.changeWindowsPosition()
lamborghini.changeEngineStatus()
lamborghini.description()

print("\n")

var belaz = TrunkCar(modelAuto: "B-75710", color: "white", year: 1998, capacity: 10000)
belaz.description()
belaz.upgradeCapacity()
belaz.changeCargoStatus()
belaz.description()

print("\n")

var volvo = TrunkCar(modelAuto: "VNL 760", color: "gray", year: 2007, capacity: 5000)
volvo.description()
volvo.changeEngineStatus()
volvo.description()





