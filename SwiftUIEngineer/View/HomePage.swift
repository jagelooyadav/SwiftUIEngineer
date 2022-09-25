//
//  ContentView.swift
//  Shared
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import SwiftUI
import SwiftUIViewComponents

struct HomePage: View {
    @ObservedObject private var viewModel = HomePageViewModel()
    
    init() {
        viewModel.fetchData()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.background.ignoresSafeArea(.all, edges: .bottom)
                
                NavigationLink(isActive: $viewModel.isNavigationActive, destination: {
                    if let selectedRowData = viewModel.selectRow {
                        DetailPage(viewModel: DetailPageViewModel(rowId: viewModel.selectedRowId, rowData: selectedRowData))
                    } else {
                        EmptyView()
                    }
                },
                               label: { EmptyView() })
                List {
                    ForEach($viewModel.rows, id:\.rowId) { row in
                        ListRowView(title: row.title.wrappedValue, subtitle: row.subtitle.wrappedValue, content: row.content
                            .wrappedValue, thumbURL: row.thumbURL.wrappedValue).listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.0, trailing: 0))
                            .onTapGesture {
                                self.viewModel.selectedRowId = row.rowId.wrappedValue
                                self.viewModel.isNavigationActive = true
                            }
                    }
                }.listStyle(.plain)
            }.navigationCustomTitle("Home Page")
        }
    }
}
