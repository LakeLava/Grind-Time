//
//  LeaderboardView.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import SwiftUI
import Foundation

struct LeaderboardView: View {
    @Binding var store: DataStore
    
    let formatter = DateComponentsFormatter()

    var body: some View {
        VStack {
            Text("Leaderboard").font(.title)
            List {
                ForEach(DataStore.sampleData.timeAtBuildings) {tb in
                    VStack(alignment: .leading) {
                        Text(locationToString(loc:tb.building))
                        Text("   Spent \(formatter.string(from: tb.lastSessionDuration)!) on \(tb.lastSessionDate.formatted())")
                    }
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(store: .constant(DataStore.sampleData))
    }
}

func locationToString(loc: DataStore.Location) -> String {
    switch loc {
    case DataStore.Location.administrativeServicesBuilding:
        return "Administrative Services Building"
    case DataStore.Location.agriculturalServiceCenter:
        return "agriculturalServiceCenter"
    case DataStore.Location.alumniCenter:
        return "Alumni Center"
    case DataStore.Location.barnettHall:
        return "barnettHall"
    case DataStore.Location.barreHall:
        return "barreHall"
    case DataStore.Location.benetHall:
        return "benetHall"
    case DataStore.Location.biologicalSciencesFieldStation:
        return "biologicalSciencesFieldStation"
    case DataStore.Location.biosystemsResearchComplex:
        return "biosystemsResearchComplex"
    case DataStore.Location.botanicalGarden:
        return "botanicalGarden"
    case DataStore.Location.bowenHall:
        return "bowenHall"
    case DataStore.Location.brackettHall:
        return "brackettHall"
    case DataStore.Location.bradleyHall:
        return "bradleyHall"
    case DataStore.Location.brooksCenterforthePerformingArts:
        return "Brooks Center for the Performing Arts"
    case DataStore.Location.byrnesHall:
        return "byrnesHall"
    case DataStore.Location.calhounCourtsApartments:
        return "calhounCourtsApartments"
    case DataStore.Location.calhounsOffice:
        return "calhounsOffice"
    case DataStore.Location.campbellCarriageHouseCoffeeandGiftShop:
        return "campbellCarriageHouseCoffeeandGiftShop"
    case DataStore.Location.campbellGeologyMuseum:
        return "campbellGeologyMuseum"
    case DataStore.Location.campbellMuseumofNaturalHistory:
        return "campbellMuseumofNaturalHistory"
    case DataStore.Location.carillonGarden:
        return "carillonGarden"
    case DataStore.Location.centerfortheImprovementofConstructionandManagementProcesses:
        return "centerfortheImprovementofConstructionandManagementProcesses"
    case DataStore.Location.centralEnergyFacilities:
        return "centralEnergyFacilities"
    case DataStore.Location.classof1957Rotunda:
        return "classof1957Rotunda"
    case DataStore.Location.clemsonHouse:
        return "clemsonHouse"
    case DataStore.Location.clemsonMemorialStadiumandFrankHowardField:
        return "clemsonMemorialStadiumandFrankHowardField"
    case DataStore.Location.clemsonStatue:
        return "clemsonStatue"
    case DataStore.Location.clemsonUniversityFoundation_ShirleyCenterforPhilanthropy:
        return "clemsonUniversityFoundation_ShirleyCenterforPhilanthropy"
    case DataStore.Location.cookAgriculturalServiceLaboratory:
        return "cookAgriculturalServiceLaboratory"
    case DataStore.Location.cookEngineeringLaboratory:
        return "cookEngineeringLaboratory"
    case DataStore.Location.cooperLibrary:
        return "Cooper Library"
    case DataStore.Location.copeHall:
        return "copeHall"
    case DataStore.Location.coxPlaza:
        return "coxPlaza"
    case DataStore.Location.danielHall:
        return "danielHall"
    case DataStore.Location.dillardBuilding:
        return "dillardBuilding"
    case DataStore.Location.donaldsonHall:
        return "donaldsonHall"
    case DataStore.Location.earleHall:
        return "earleHall"
    case DataStore.Location.edwardsHall:
        return "edwardsHall"
    case DataStore.Location.endocrinePhysiologyLaboratory:
        return "endocrinePhysiologyLaboratory"
    case DataStore.Location.fernowStreetCafe:
        return "fernowStreetCafe"
    case DataStore.Location.fikeRecreationCenter:
        return "fikeRecreationCenter"
    case DataStore.Location.fireStation:
        return "fireStation"
    case DataStore.Location.fluorDanielEngineeringInnovationBuilding:
        return "fluorDanielEngineeringInnovationBuilding"
    case DataStore.Location.fortHill:
        return "fortHill"
    case DataStore.Location.franHansonDiscoveryCenter:
        return "franHansonDiscoveryCenter"
    case DataStore.Location.freemanHall:
        return "freemanHall"
    case DataStore.Location.ganttCircle:
        return "ganttCircle"
    case DataStore.Location.geerHall:
        return "geerHall"
    case DataStore.Location.gentryHall:
        return "gentryHall"
    case DataStore.Location.godfreyHall:
        return "godfreyHall"
    case DataStore.Location.godley_SnellResearchCenter:
        return "godley_SnellResearchCenter"
    case DataStore.Location.greenhouseComplex:
        return "greenhouseComplex"
    case DataStore.Location.hanoverHouse:
        return "hanoverHouse"
    case DataStore.Location.harcombeDiningHall:
        return "harcombeDiningHall"
    case DataStore.Location.hardinHall:
        return "hardinHall"
    case DataStore.Location.haydenConferenceCenter:
        return "haydenConferenceCenter"
    case DataStore.Location.hendrixStudentCenter:
        return "Hendrix Student Center"
    case DataStore.Location.holmesHall:
        return "holmesHall"
    case DataStore.Location.holtzendorffHall:
        return "holtzendorffHall"
    case DataStore.Location.hopewell:
        return "hopewell"
    case DataStore.Location.housingMaintenanceFacility:
        return "housingMaintenanceFacility"
    case DataStore.Location.houstonCenter:
        return "houstonCenter"
    case DataStore.Location.hunterChemistryLaboratory:
        return "hunterChemistryLaboratory"
    case DataStore.Location.iPTAY_TicketOffice:
        return "iPTAY_TicketOffice"
    case DataStore.Location.indoorTrack:
        return "indoorTrack"
    case DataStore.Location.internalAuditingOffice:
        return "internalAuditingOffice"
    case DataStore.Location.jerveyAthleticCenter:
        return "jerveyAthleticCenter"
    case DataStore.Location.johnstoneHall:
        return "johnstoneHall"
    case DataStore.Location.jordanHall:
        return "jordanHall"
    case DataStore.Location.kinardLaboratoryPhysics:
        return "kinardLaboratoryPhysics"
    case DataStore.Location.kiteHillRecyclingCenter:
        return "kiteHillRecyclingCenter"
    case DataStore.Location.laMasterDairyCenter:
        return "laMasterDairyCenter"
    case DataStore.Location.leeHall:
        return "leeHall"
    case DataStore.Location.lehotskyHall:
        return "lehotskyHall"
    case DataStore.Location.leverHall:
        return "leverHall"
    case DataStore.Location.lightseyBridgeIApartments:
        return "lightseyBridgeIApartments"
    case DataStore.Location.lightseyBridgeIIApartments:
        return "lightseyBridgeIIApartments"
    case DataStore.Location.littlejohnColiseum:
        return "littlejohnColiseum"
    case DataStore.Location.littlejohnHouse:
        return "littlejohnHouse"
    case DataStore.Location.longHall:
        return "longHall"
    case DataStore.Location.lowryHall:
        return "lowryHall"
    case DataStore.Location.madrenCenter:
        return "madrenCenter"
    case DataStore.Location.maintenanceStores:
        return "maintenanceStores"
    case DataStore.Location.manningHall:
        return "manningHall"
    case DataStore.Location.martinHall:
        return "martinHall"
    case DataStore.Location.mauldinHall:
        return "mauldinHall"
    case DataStore.Location.mcAdamsHall:
        return "mcAdamsHall"
    case DataStore.Location.mcCabeHall:
        return "mcCabeHall"
    case DataStore.Location.mcFaddenBuilding:
        return "mcFaddenBuilding"
    case DataStore.Location.mellHall:
        return "mellHall"
    case DataStore.Location.militaryHeritagePlaza:
        return "militaryHeritagePlaza"
    case DataStore.Location.moormanHouse:
        return "moormanHouse"
    case DataStore.Location.morganPoultryCenter:
        return "morganPoultryCenter"
    case DataStore.Location.motorPool:
        return "motorPool"
    case DataStore.Location.nationalDropoutPreventionCenter:
        return "nationalDropoutPreventionCenter"
    case DataStore.Location.newmanHall:
        return "newmanHall"
    case DataStore.Location.normanTrack:
        return "normanTrack"
    case DataStore.Location.norrisHall:
        return "norrisHall"
    case DataStore.Location.olinHall:
        return "olinHall"
    case DataStore.Location.outdoorTheatre:
        return "outdoorTheatre"
    case DataStore.Location.plantGermplasmResearchLaboratory:
        return "plantGermplasmResearchLaboratory"
    case DataStore.Location.policeDepartment:
        return "policeDepartment"
    case DataStore.Location.pooleAgriculturalCenter:
        return "pooleAgriculturalCenter"
    case DataStore.Location.presidentsHome:
        return "presidentsHome"
    case DataStore.Location.redfernHealthCenter:
        return "redfernHealthCenter"
    case DataStore.Location.reunionSquare:
        return "reunionSquare"
    case DataStore.Location.rhodesAnnex:
        return "rhodesAnnex"
    case DataStore.Location.rhodesEngineeringResearchCenter:
        return "rhodesEngineeringResearchCenter"
    case DataStore.Location.riggsField:
        return "riggsField"
    case DataStore.Location.riggsHall:
        return "riggsHall"
    case DataStore.Location.roderickInternationalHouse:
        return "roderickInternationalHouse"
    case DataStore.Location.foundationSeed:
        return "foundationSeed"
    case DataStore.Location.sandersHall:
        return "sandersHall"
    case DataStore.Location.schilletterDiningHall:
        return "schilletterDiningHall"
    case DataStore.Location.scrollofHonorMemorial:
        return "scrollofHonorMemorial"
    case DataStore.Location.searsHouse:
        return "searsHouse"
    case DataStore.Location.sheepBarn:
        return "sheepBarn"
    case DataStore.Location.sikesHall:
        return "sikesHall"
    case DataStore.Location.simpsonHallNorth:
        return "simpsonHallNorth"
    case DataStore.Location.simpsonHallSouth:
        return "simpsonHallSouth"
    case DataStore.Location.sirrineHall:
        return "sirrineHall"
    case DataStore.Location.sloanTennisCenter:
        return "sloanTennisCenter"
    case DataStore.Location.smithBuildingforSonocoInstituteofPackagingDesignandGraphics:
        return "smithBuildingforSonocoInstituteofPackagingDesignandGraphics"
    case DataStore.Location.smithHall:
        return "smithHall"
    case DataStore.Location.stadiumResidenceHall:
        return "stadiumResidenceHall"
    case DataStore.Location.strodeTower:
        return "strodeTower"
    case DataStore.Location.thornhillVillageApartments:
        return "thornhillVillageApartments"
    case DataStore.Location.thurmondInstitute:
        return "thurmondInstitute"
    case DataStore.Location.tigerField:
        return "tigerField"
    case DataStore.Location.tillmanHall:
        return "tillmanHall"
    case DataStore.Location.trusteeHouse:
        return "trusteeHouse"
    case DataStore.Location.universityFacilitiesEnvironmentalHealthandSafety:
        return "universityFacilitiesEnvironmentalHealthandSafety"
    case DataStore.Location.universityFacilitiesOperations:
        return "universityFacilitiesOperations"
    case DataStore.Location.universityUnion:
        return "universityUnion"
    case DataStore.Location.EdgarBrown:
        return "universityUnion"
    case DataStore.Location.vickeryHall:
        return "vickeryHall"
    case DataStore.Location.visitorsCenter:
        return "visitorsCenter"
    case DataStore.Location.Classof1944:
        return "Class of 1944 Visitors Center"
    case DataStore.Location.walkerGolfCourseClubhouse:
        return "walkerGolfCourseClubhouse"
    case DataStore.Location.wannamakerHall:
        return "wannamakerHall"
    case DataStore.Location.womensRowingBoathouses:
        return "womensRowingBoathouses"
    case DataStore.Location.woodlandCemetery:
        return "woodlandCemetery"
    case DataStore.Location.youngHall:
        return "youngHall"
    default:
        return "That is not a building"
    }
}
