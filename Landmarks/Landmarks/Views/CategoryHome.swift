//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 木下健一 on 2021/08/06.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image/*Faturedの下部に大きく画像を表示*/
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())/*Top画像の横幅をフルスクリーン*/
                
                //サムネイル画像を並べて表示
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())/*Topと同じくエッジインセットをゼロに設定して拡張*/
            }
            //タイトル表示
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
