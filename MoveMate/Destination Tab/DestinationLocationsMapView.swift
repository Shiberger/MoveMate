//
//  DestinationLocationsMapView.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftUI
import MapKit

struct DestinationLocationsMapView: View {
    
    @State private var cameraPositon: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    
    var body: some View {
        Map(position: $cameraPositon) {
            Marker("National Stadium", image: "btsIcon", coordinate: .btsNationalStadium).tint(.btsLine)
            
            Marker("Siam", image: "btsIcon", coordinate: .btsSiam).tint(.btsLine)
            
            Marker("Ratchadamri", image: "btsIcon", coordinate: .btsRatchadamri).tint(.btsLine)
            
            Marker("Sala Daeng", image: "btsIcon", coordinate: .btsSalaDaeng).tint(.btsLine)

            Marker("Chong Nonsi", image: "btsIcon", coordinate: .btsChongNonSi).tint(.btsLine)
            
            Marker("Saint Louis", image: "btsIcon", coordinate: .btsSaintLouis).tint(.btsLine)
            
            Marker("Surasak", image: "btsIcon", coordinate: .btsSurasak).tint(.btsLine)
            
            Marker("Saphan Taksin", image: "btsIcon", coordinate: .btsSaphanTaksin).tint(.btsLine)
            
            Marker("Krung Thon Buri", image: "btsIcon", coordinate: .btsKrungThonBuri).tint(.btsLine)
            
            Marker("Wongwian Yai", image: "btsIcon", coordinate: .btsWongwianYai).tint(.btsLine)
            
            Marker("Pho Nimit", image: "btsIcon", coordinate: .btsPhoNimit).tint(.btsLine)
            
            Marker("Talat Plu", image: "btsIcon", coordinate: .btsTalatPru).tint(.btsLine)
            
            Marker("Wutthakat", image: "btsIcon", coordinate: .btsWutthakat).tint(.btsLine)
            
            Marker("Bang Wa", image: "btsIcon", coordinate: .btsBangwa).tint(.btsLine)
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร กรมส่งเสริมและพัฒนาคุณภาพชีวิตคนพิการ", coordinate: .disabilitiesBangkok, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร ลาดกระบัง บ้านเอื้ออาทรลาดกระบัง", coordinate: .disabilitiesLKB, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร อ้อมน้อย", coordinate: .disabilitiesOmNoi, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร มีนบุรี", coordinate: .disabilitiesMinBuri, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร สายไหม", coordinate: .disabilitiesSaiMai, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลเมตตาประชารักษ์ (วัดไร่ขิง)", coordinate: .disabilitiesWatRaiKhing, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลสิรินธร", coordinate: .disabilitiesSrindhornHospital, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("ศูนย์บริการคนพิการกรุงเทพมหานคร มีนบุรี", coordinate: .disabilitiesMinBuri, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลผู้สูงอายุบางขุนเทียน", coordinate: .disabilitiesBangKhunTian, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลพระราม 2", coordinate: .disabilitiesPhaRam2, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("สถาบันราชานุกูลกรมสุขภาพจิต", coordinate: .disabilitiesRajanukul, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลนพรัตน์ราชธานี", coordinate: .disabilitiesNopparatRajthanee, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("โรงพยาบาลเวชการุณย์รัศมี", coordinate: .disabilitiesWatchakarunrasm, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("สถาบันสุขภาพเด็กแห่งชาติมหาราชินี", coordinate: .disabilitiesChildren, anchor: .center) {
                Image(.disabledLocationHelp)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            MapCircle(
                center: CLLocationCoordinate2D(latitude: 13.753253, longitude: 100.501641),
                radius: 5000
            )
            .foregroundStyle(.red.opacity(0.5))
        }
        .onMapCameraChange(frequency: .onEnd) { context in visibleRegion = context.region
        }
            .onAppear {
                // 13.753253, 100.501641
                let bangkok = CLLocationCoordinate2D(latitude: 13.753253, longitude: 100.501641)
                let bangkokSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                let bangkokRegion = MKCoordinateRegion(center: bangkok, span: bangkokSpan)
                cameraPositon = .region(bangkokRegion)
        }
    }
}

#Preview {
    DestinationLocationsMapView()
}
