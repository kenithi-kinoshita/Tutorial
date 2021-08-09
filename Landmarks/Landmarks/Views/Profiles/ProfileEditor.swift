//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 木下健一 on 2021/08/09.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var detaRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalData)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalData)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seaonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
            
            DatePicker(selection: $profile.goalData, in: detaRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
