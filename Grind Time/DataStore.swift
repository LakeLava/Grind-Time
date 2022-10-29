//
//  DataStore.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import Foundation
import CoreLocation

struct DataStore: Identifiable, Codable {
    let id: UUID
    var locationHistories: [LocationHistory]
    var timeAtBuildings: [TimeAtBuilding]
    
    init(id: UUID = UUID(), locationHistories: [LocationHistory], timeAtBuildings: [TimeAtBuilding]) {
        self.id = id
        self.locationHistories = locationHistories
        self.timeAtBuildings = timeAtBuildings
    }
}

extension DataStore {
    // Stores location and date - used in app backround - will be processessed on launching the app
    struct LocationHistory: Identifiable, Codable {
        let id: UUID
        var coordinate: Coordinate
        var date: Date
        
        init(id: UUID = UUID(), coordinate: CLLocationCoordinate2D, date: Date) {
            self.id = id
            self.coordinate = Coordinate(location: coordinate)
            self.date = date
        }
    }
    // Enables us to encode a location
    struct Coordinate: Codable {
        let latitude: Double
        let longitude: Double

        func locationCoordinate() -> CLLocationCoordinate2D {
            return CLLocationCoordinate2D(latitude: self.latitude,
                                          longitude: self.longitude)
        }
        
        init(location: CLLocationCoordinate2D) {
            self.latitude = location.latitude
            self.longitude = location.longitude
        }
    }
    
    // Keeps track of all buildings, and how long you spend there
    struct TimeAtBuilding: Identifiable, Codable {
        let id: UUID
        let building: Location
        let totalTime: TimeInterval
        let lastSessionDuration: TimeInterval
        let lastSessionDate: Date
        
        init(id: UUID = UUID(), building: Location, totalTime: TimeInterval, lastSessionDuration: TimeInterval, lastSessionDate: Date) {
            self.id = id
            self.building = building
            self.totalTime = totalTime
            self.lastSessionDuration = lastSessionDuration
            self.lastSessionDate = lastSessionDate
        }
        
    }
    enum Location: Codable {
        case administrativeServicesBuilding, agriculturalServiceCenter, alumniCenter, barnettHall, barreHall,
             benetHall, biologicalSciencesFieldStation, biosystemsResearchComplex, botanicalGarden,  bowenHall,
             brackettHall, bradleyHall, brooksCenterforthePerformingArts, byrnesHall, calhounCourtsApartments,
             calhounsOffice, campbellCarriageHouseCoffeeandGiftShop, campbellGeologyMuseum,
             campbellMuseumofNaturalHistory, carillonGarden,
             centerfortheImprovementofConstructionandManagementProcesses, centralEnergyFacilities, classof1957Rotunda,
             clemsonHouse, clemsonMemorialStadiumandFrankHowardField, clemsonStatue,
             clemsonUniversityFoundation_ShirleyCenterforPhilanthropy, cookAgriculturalServiceLaboratory,
             cookEngineeringLaboratory, cooperLibrary, copeHall, coxPlaza, danielHall, dillardBuilding, donaldsonHall,
             earleHall, edwardsHall, endocrinePhysiologyLaboratory, fernowStreetCafe, fikeRecreationCenter,
             fireStation, fluorDanielEngineeringInnovationBuilding, fortHill, franHansonDiscoveryCenter, freemanHall,
             ganttCircle, geerHall, gentryHall, godfreyHall, godley_SnellResearchCenter, greenhouseComplex,
             hanoverHouse, harcombeDiningHall, hardinHall, haydenConferenceCenter, hendrixStudentCenter, holmesHall,
             holtzendorffHall, hopewell, housingMaintenanceFacility, houstonCenter, hunterChemistryLaboratory,
             iPTAY_TicketOffice, indoorTrack, internalAuditingOffice, jerveyAthleticCenter, johnstoneHall, jordanHall,
             kinardLaboratoryPhysics, kiteHillRecyclingCenter, laMasterDairyCenter, leeHall, lehotskyHall, leverHall,
             lightseyBridgeIApartments, lightseyBridgeIIApartments, littlejohnColiseum, littlejohnHouse, longHall,
             lowryHall, madrenCenter, maintenanceStores, manningHall, martinHall, mauldinHall, mcAdamsHall,
             mcCabeHall, mcFaddenBuilding, mellHall, militaryHeritagePlaza, moormanHouse, morganPoultryCenter,
             motorPool, nationalDropoutPreventionCenter, newmanHall, normanTrack, norrisHall, olinHall,
             outdoorTheatre, plantGermplasmResearchLaboratory, policeDepartment, pooleAgriculturalCenter,
             presidentsHome, redfernHealthCenter, reunionSquare, rhodesAnnex, rhodesEngineeringResearchCenter,
             riggsField, riggsHall, roderickInternationalHouse, foundationSeed, sandersHall, schilletterDiningHall,
             scrollofHonorMemorial, searsHouse, sheepBarn, sikesHall, simpsonHallNorth, simpsonHallSouth, sirrineHall,
             sloanTennisCenter, smithBuildingforSonocoInstituteofPackagingDesignandGraphics, smithHall,
             stadiumResidenceHall, strodeTower, thornhillVillageApartments, thurmondInstitute, tigerField,
             tillmanHall, trusteeHouse, universityFacilitiesEnvironmentalHealthandSafety,
             universityFacilitiesOperations, universityUnion, EdgarBrown, vickeryHall, visitorsCenter,Classof1944,
             walkerGolfCourseClubhouse, wannamakerHall, womensRowingBoathouses, woodlandCemetery, youngHall
    }


    /*
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
     */
}

extension DataStore {
    static let sampleData: [DataStore] = [
        DataStore(
            locationHistories: [
                LocationHistory(coordinate: CLLocationCoordinate2D(latitude: 34.676975, longitude: -82.836354), date: Date.now),
                LocationHistory(coordinate: CLLocationCoordinate2D(latitude: 34.676965, longitude: -82.836364), date: Date.now)
            ],
            timeAtBuildings: [
                TimeAtBuilding(building: Location.cooperLibrary, totalTime: TimeInterval(49231),
                               lastSessionDuration: TimeInterval(12301), lastSessionDate: Date.now),
                TimeAtBuilding(building: Location.hendrixStudentCenter, totalTime: TimeInterval(29231),
                               lastSessionDuration: TimeInterval(11301), lastSessionDate: Date.now)

            ]
        )
    ]
}
