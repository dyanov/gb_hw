import Foundation

protocol Car {
    
    var model: String {get}
    var color: String {get}
    var numberOfSeats: Int {get}
    var numberOfWheels: Int {get}
    var isWindowsOpen: Bool {get set}
    var isEngineStart: Bool {get set}
    var isDoorsClosed: Bool {get set}
    func readyToGo()
    
}

extension Car {
    mutating func windowsAction() {
        self.isWindowsOpen.toggle()
        print(isWindowsOpen ? "Windows opened." : "Windows closed." )
    }
    mutating func engineAction() {
        self.isEngineStart.toggle()
        print(isEngineStart ? "Engine started." : "Engine stopped." )
    }
    mutating func doorsAction() {
        self.isDoorsClosed.toggle()
        print(isDoorsClosed ? "Doors closed." : "Doors opened." )
    }
}

class sportCar: Car {
    
    let model: String
    let color: String
    let numberOfSeats: Int = 2
    let numberOfWheels: Int = 4
    var maxspeed: Double
    var isDoorsClosed: Bool = false
    var isEngineStart: Bool = false
    var isWindowsOpen: Bool = false
    
    init(model: String, color: String, maxspeed: Double, isDoorsClosed: Bool, isEngineStart: Bool, isWindowsOpen: Bool) {
        self.model = model
        self.color = color
        self.maxspeed = maxspeed
        self.isDoorsClosed = isDoorsClosed
        self.isEngineStart = isEngineStart
        self.isWindowsOpen = isWindowsOpen
    }
    
    func readyToGo() {
        print((isDoorsClosed && isEngineStart) ? "\(model) is ready to go." : "\(model) is not ready to go.")
    }
}


class trunkCar: Car {
    
    let model: String
    let color: String
    let numberOfSeats: Int = 4
    let numberOfWheels: Int = 10
    var capacity: Int
    var isDoorsClosed: Bool
    var isEngineStart: Bool
    var isWindowsOpen: Bool
    
    init(model: String, color: String, capacity: Int, isDoorsClosed: Bool, isEngineStart: Bool, isWindowsOpen: Bool) {
        self.model = model
        self.color = color
        self.capacity = capacity
        self.isDoorsClosed = isDoorsClosed
        self.isEngineStart = isEngineStart
        self.isWindowsOpen = isWindowsOpen
    }
    
    func readyToGo() {
        print((isDoorsClosed && isEngineStart) ? "\(model) is ready to go." : "\(model) is not ready to go")
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return("We have a \(model) in \(color) color with \(numberOfSeats) seats and \(numberOfWheels) wheels. Max speed: \(maxspeed) km/h. \n Doors closed: \(isDoorsClosed). \n Engine started: \(isEngineStart). \n Windows opened: \(isWindowsOpen).")
    }
    
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return("We have a \(model) in \(color) color with \(numberOfSeats) seats and \(numberOfWheels) wheels. Capacity: \(capacity) kg. \n Doors closed: \(isDoorsClosed). \n Engine started: \(isEngineStart). \n Windows opened: \(isWindowsOpen).")
    }
    
}

var volvo = trunkCar(model: "Volvo FH16", color: "white", capacity: 10000, isDoorsClosed: false, isEngineStart: true, isWindowsOpen: true)
var man = trunkCar(model: "MAN TGX", color: "gray", capacity: 8700, isDoorsClosed: true, isEngineStart: true, isWindowsOpen: true)
var ferarri = sportCar(model: "Ferarri F40", color: "red", maxspeed: 330.5, isDoorsClosed: true, isEngineStart: false, isWindowsOpen: false)
var lamborghini = sportCar(model: "Lamborghini Aventador", color: "green", maxspeed: 360.25, isDoorsClosed: false, isEngineStart: false, isWindowsOpen: false)

print(volvo)
volvo.readyToGo()
volvo.doorsAction()
volvo.readyToGo()
print("\n")
print(man)
man.windowsAction()
print("\n")
print(ferarri)
ferarri.engineAction()
ferarri.windowsAction()
ferarri.readyToGo()
print("\n")
print(lamborghini)
lamborghini.doorsAction()

