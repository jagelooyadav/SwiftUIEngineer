//
//  DetailPage.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation
import SwiftUI

struct DetailPage: View {
    
    @ObservedObject var viewModel: DetailPageViewModel
    @Environment(\.dismiss) var dismisAction
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                AsyncImage(url: viewModel.backgroundURL).ignoresSafeArea()
                Spacer()
            }
            
        }.backActionView(action: { dismisAction() })
    }
}
