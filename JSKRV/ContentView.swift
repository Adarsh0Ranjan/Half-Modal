//
//  ContentView.swift
//  JSKRV
//
//  Created by Roro Solutions on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var  shouldShowSheetBottomSheet = false
    var body: some View {
        ZStack {
            VStack{
                Button {
                    shouldShowSheetBottomSheet.toggle()
                } label: {
                    Text("tap to open bottom sheet")
                }
            }
            
            if shouldShowSheetBottomSheet {
                Color.black.opacity(0.3).ignoresSafeArea()
                BottomSheet(shouldShowSheet: $shouldShowSheetBottomSheet)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
