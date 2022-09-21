//
//  ContentView.swift
//  Shared
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import SwiftUI
import SwiftUIViewComponents

struct HomePageView: View {
    @ObservedObject var viewModel = HomePageViewModel()
    
    init() {
        viewModel.fetchData()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.1).ignoresSafeArea(.all, edges: .bottom)
                
                List {
                    ForEach($viewModel.rows, id:\.rowId) { row in
                        ListRowView(title: row.title.wrappedValue, subtitle: row.subtitle.wrappedValue, content: row.content
                            .wrappedValue, thumbURL: row.thumbURL.wrappedValue).listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.0, trailing: 0))
                    }
                }.listStyle(.plain)
            }.navigationCustomTitle("Home Page")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
