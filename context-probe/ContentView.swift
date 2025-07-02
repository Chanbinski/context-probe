//
//  ContentView.swift
//  context-probe
//
//  Created by Chanbin Park on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appMonitor = ActiveAppMonitor()
    
    var body: some View {
        VStack {
            HStack {
                Text("Active App:")
                Text(appMonitor.currentAppName)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
