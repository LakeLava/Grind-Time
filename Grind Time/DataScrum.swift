//
//  DataStore.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import Foundation
import CoreLocation

struct DataScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var locationHistories: [LocationHistory]
    var timeAtBuildings: [TimeAtBuilding]
    
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
        self.locationHistories = []
        self.timeAtBuildings = []
    }
}

extension DataScrum {
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
/*
extension DataScrum {
    static let sampleData: [DataScrum] =
    [
        DataScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DataScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DataScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}

*/
