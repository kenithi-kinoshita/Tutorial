//
//  PageView.swift
//  Landmarks
//
//  Created by 木下健一 on 2021/08/09.
//
/*
 タイプを更新して子ビューとして宣言
 Xcordはタイプを推測できないためプレビューは失敗する
*/

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        //プレビュープロバイダーを更新して必要なビューの配列を渡すと、プレビューが機能し始める
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
