//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 木下健一 on 2021/08/02.
//
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", /*"iPad Pro (12.9-inch) (2nd generation)"*/], id: \.self) { deviceName in
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
    }
}
    