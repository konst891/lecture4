import UIKit

class BaseCar {
    
    enum Transmission {
        case auto, manual
    }
    
    enum TyresType {
        case winter, summer
    }
    
    var brand: String
    var transmission: Transmission
    var tyresType: TyresType
    
    static var carCount: Int = 0
    
    init(brand: String, transmission: Transmission, tyresType: TyresType) {
        self.brand = brand
        self.transmission = transmission
        self.tyresType = tyresType
        
        BaseCar.carCount += 1
    }
    
    func honk() {
        print("Car says honk honk in superclass")
    }
    
    func printInfo() {
        print("Car \(brand) with \(transmission)")
    }
    
    static func getCarCount() {
        print("Cars were produced \(carCount) units")
    }
    
}

class CivilCar: BaseCar {
    
    enum AirConditioningSystem: String {
        case climate = "climate control", airConditioner = "airconditioner"
    }
    
    var seatPlaces: Int
    var security: Bool
    var airConditioning: AirConditioningSystem
    
    init(brand: String, transmission: Transmission, tyresType: TyresType, seatPlaces: Int, security: Bool, airConditioning: AirConditioningSystem) {
        self.seatPlaces = seatPlaces
        self.security = security
        self.airConditioning = airConditioning
        
        super.init(brand: brand, transmission: transmission, tyresType: tyresType)
    }
    
    func checkSecurity(security: Bool) -> String {
        if(security) {
            return "It has security installed"
        } else {
            return "It has no security installed"
        }
    }
    
    override func printInfo() {
        print("Civil car \(brand) with \(transmission) it has \(seatPlaces) and \(checkSecurity(security: security)) and it has \(airConditioning.rawValue)")
    }

}

class TruckCar: BaseCar {
    
    enum LoadState {
        case full, empty
    }
    
    var hasTrailer: Bool
    var numOfWheels: Int
    var loadState: LoadState
    
    init(brand: String, transmission: Transmission, tyresType: TyresType, hasTrailer: Bool, numOfWheels: Int, loadState: LoadState) {
        self.hasTrailer = hasTrailer
        self.numOfWheels = numOfWheels
        self.loadState = loadState
        
        super.init(brand: brand, transmission: transmission, tyresType: tyresType)
    }
    
    func checkTrailer(hasTrailer: Bool) -> String {
        if(hasTrailer) {
            return "connected"
        } else {
            return "disconnected"
        }
    }
    
    override func printInfo() {
        print("Truck car \(brand) with \(transmission) it has \(numOfWheels) the trailer is \(checkTrailer(hasTrailer: hasTrailer)) and it \(loadState)")
    }
    
}

var volkswagen = CivilCar(brand: "Volkswagen", transmission: .auto, tyresType: .summer, seatPlaces: 5, security: true, airConditioning: .climate)
volkswagen.printInfo();
volkswagen.honk();

var renaultTruck = TruckCar(brand: "Renault", transmission: .manual, tyresType: .summer, hasTrailer: true, numOfWheels: 10, loadState: .full)
renaultTruck.printInfo();
renaultTruck.honk();

BaseCar.getCarCount()
