//
//  Destination.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftData
import MapKit

@Model
class Destination {
    var name: String
    var latitude: Double?
    var longitude: Double?
    var latitudeDelta: Double?
    var longitudeDelta: Double?
    @Relationship(deleteRule: .cascade)
    var placemarks: [MTPlacemark] = []
    
    init(name: String, latitude: Double? = nil, longitude: Double? = nil, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
    }
    
    var region: MKCoordinateRegion? {
        if let latitude, let longitude, let latitudeDelta, let longitudeDelta {
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
            )
        } else {
            return nil
        }
    }
}

extension Destination {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: Destination.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
//        let bangkok = CLLocationCoordinate2D(latitude: 13.753253, longitude: 100.501641)
//        let bangkokSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let bangkok = Destination(
            name: "Bangkok",
            latitude: 13.753253,
            longitude: 100.501641,
            latitudeDelta: 0.15,
            longitudeDelta: 0.15
        )
        container.mainContext.insert(bangkok)
        var placeMarks: [MTPlacemark] {
            [
                MTPlacemark(name: "National Stadium", address: "Rama 1 Rd. Wang Mai, Pathum Wan Bangkok 10330 Thailand", latitude: 13.746409, longitude: 100.530101),
                
                MTPlacemark(name: "Siam", address: "Rama 1 Rd. Pathum Wan, Pathum Wan Bangkok 10330 Thailand", latitude: 13.745667, longitude: 100.534318),
                
                MTPlacemark(name: "Chidrom", address: "Phloen Chit Rd. Lumphini, Pathum Wan Bangkok 10330 Thailand", latitude: 13.746409, longitude: 100.530101),
                
                MTPlacemark(name: "Ratchadamri", address: "Rama 1 Rd. Wang Mai, Pathum Wan Bangkok 10330 Thailand", latitude: 13.746409, longitude: 100.530101),
                
                MTPlacemark(name: "Sala Daeng", address: "Si Lom Rd. Si Lom, Bang Rak Bangkok 10500 Thailand", latitude: 13.739401, longitude: 100.539472),
                
                MTPlacemark(name: "Chong Non Si", address: "Naradhiwas Rajanagarindra Rd. Si Lom, Bang Rak Bangkok 10500 Thailand", latitude: 13.724091, longitude: 100.529081),
                
                MTPlacemark(name: "Saint Louis", address: "120 Soi Sathon 12 Si Lom, Bang Rak Bangkok 10500 Thailand", latitude: 13.720831, longitude: 100.526697),
                
                MTPlacemark(name: "Surasak", address: "Yan Nawa, Sathon Bangkok 10120 Thailand", latitude: 13.746409, longitude: 100.530101),
                
                MTPlacemark(name: "Saphan Taksin", address: "RSathorn Tai Road Bang Rak, Bang Rak Bangkok 10120 Thailand", latitude: 13.718712, longitude: 100.514717),
                
                MTPlacemark(name: "Krung Thon Buri", address: "77/151 Krung Thon Buri Rd. Khlong Ton Sai, Khlong San Bangkok 10600 Thailand", latitude: 13.720920, longitude: 100.503065),
                
                MTPlacemark(name: "Wongwian Yai", address: "Krung Thon Buri Rd. Khlong San Bangkok 10600 Thailand", latitude: 13.721110, longitude: 100.495198),
                
                MTPlacemark(name: "Pho Nimit", address: "Bukkhalo, Thon Buri Bangkok 10600 Thailand", latitude: 13.719257, longitude: 100.486075),
                
                MTPlacemark(name: "Talat Pru", address: "Ratchaphruek Rd. Dao Khanong, Thon Buri Bangkok 10600 Thailand", latitude: 13.714257, longitude: 100.476845),
                
                MTPlacemark(name: "Wutthakat", address: "264 Wutthakat Rd. Thon Buri Bangkok 10600 Thailand", latitude: 13.713445, longitude: 100.467975),
                
                MTPlacemark(name: "Bangwa", address: "Bang Wa, Phasi Charoen Bangkok 10160 Thailand", latitude: 13.720246, longitude: 100.457143),
                
                MTPlacemark(name: "ศูนย์บริการคนพิการกรุงเทพมหานคร กรมส่งเสริมและพัฒนาคุณภาพชีวิตคนพิการ", address: "2255 Ratchawithi Rd. Ratchathewi Bangkok 10400 Thailand", latitude: 13.770202, longitude: 100.527781),
                
                MTPlacemark(name: "ศูนย์บริการคนพิการกรุงเทพมหานคร ลาดกระบัง บ้านเอื้ออาทรลาดกระบัง", address: "Bang Wa, Phasi Charoen Bangkok 10160 Thailand", latitude: 13.716012, longitude: 100.801283),
                
                MTPlacemark(name: "ศูนย์บริการคนพิการกรุงเทพมหานคร อ้อมน้อย", address: "Sam Phran Nakhon Pathom 73210 Thailand", latitude: 13.720513, longitude: 100.302267),
                
                MTPlacemark(name: "ศูนย์บริการคนพิการกรุงเทพมหานคร มีนบุรี", address: "11/11 Soi Ramkhamhaeng 172 Min Buri Bangkok 10510 Thailand", latitude: 13.797421, longitude: 100.718574),
                
                MTPlacemark(name: "ศูนย์บริการคนพิการกรุงเทพมหานคร สายไหม", address: "27/25 Soi Sai Mai 35 Sai Mai Bangkok 10220 Thailand", latitude: 13.926279, longitude: 100.655404),
                
                MTPlacemark(name: "โรงพยาบาลเมตตาประชารักษ์ (วัดไร่ขิง)", address: "52 Moo 2 Rai Khing, Sam Phran Nakhon Pathom 73210 Thailand", latitude: 13.738630, longitude: 100.256161),
                
                MTPlacemark(name: "โรงพยาบาลสิรินธร", address: "20 Soi On Nut 90 Prawet Bangkok 10250 Thailand", latitude: 13.717378, longitude: 100.706842),
                
                MTPlacemark(name: "โรงพยาบาลผู้สูงอายุบางขุนเทียน", address: "1075/1 Bang Khun Thian Chai Thale Road Tha Kham, Bang Khun Thian Bangkok 10150 Thailand", latitude: 13.572644, longitude: 100.423366),
                
                MTPlacemark(name: "โรงพยาบาลพระราม 2", address: "280 Ram 2 Road Samae Dam Bang Khun Thian Bangkok 10150 Thailand", latitude: 13.651715, longitude: 100.422002),
                
                MTPlacemark(name: "สถาบันราชานุกูลกรมสุขภาพจิต", address: "4737 Din Daeng Rd. Din Daeng Bangkok 10400 Thailand", latitude: 13.761768, longitude: 100.553450),
                
                MTPlacemark(name: "โรงพยาบาลนพรัตน์ราชธานี", address: "Nopparat Rajathanee Hospital 679 Raminthra KM.13 Road Khan Na Yao, Khan Na Yao Bangkok 10230 Thailand", latitude: 13.816833, longitude: 100.687997),
                
                MTPlacemark(name: "โรงพยาบาลเวชการุณย์รัศมี", address: "Wetchakarunrasm Hospital Nong Chok Bangkok 10530 Thailand", latitude: 13.856447, longitude: 100.858897),
                
                MTPlacemark(name: "สถาบันสุขภาพเด็กแห่งชาติมหาราชินี ", address: "420/8 Ratchawithi Rd. Thung Phaya Thai, Ratchathewi Bangkok 10400 Thailand", latitude: 13.765852, longitude: 100.535248),
            ]
        }
        placeMarks.forEach {placemark in
            bangkok.placemarks.append(placemark)
        }
        return container
    }
}
