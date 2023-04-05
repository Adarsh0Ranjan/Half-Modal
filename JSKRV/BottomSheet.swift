//
//  BottomSheet.swift
//  JSKRV
//
//  Created by Roro Solutions on 04/04/23.
//

import SwiftUI

struct BottomSheet: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    @Binding var shouldShowSheet: Bool
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                ZStack {
                   Color.purple
                       .ignoresSafeArea()
                    VStack{
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 40, height: 5)
                            .padding(8)
                        
                        Button(action: {
                            print("hello world")
                            // Code to execute when the button is tapped
                        }) {
                            Text("Button One")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            print("Second Button Tapped")
                            // Code to execute when the button is tapped
                        }) {
                            Text("Button Two")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            print("Third Button Tapped")
                            // Code to execute when the button is tapped
                        }) {
                            Text("Button Three")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .offset(y: translation.height + offsetY)
                .onAppear{
                    let quarter = geo.size.height / 4
                    offsetY = quarter * 2
                }
//                .gesture(
//                   DragGesture()
//                    .onChanged { value in
//                        translation = value.translation
//                    }
//                    .onEnded { value in
//                        withAnimation(.easeOut){
//                            let snap = translation.height + offsetY
//                            let quarter = geo.size.height / 4
//                            if snap > quarter && snap < quarter * 3{
//                                offsetY = quarter * 2
//                            } else if snap > quarter && snap < quarter * 4 {
//                                offsetY = quarter * 3 + 100
//                            } else if snap > quarter * 4 {
//                                withAnimation {
//                                    shouldShowSheet.toggle()
//                                }
//                            } else {
//                                offsetY = 0
//                            }
//                            translation = .zero
//                        }
//
//                    }
//                )
//                .ignoresSafeArea(edges: .bottom)
            }
            Button  {
                withAnimation{
                    shouldShowSheet.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.bold())
                    .padding(12)
                   
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            .opacity( shouldShowSheet ? 1 : 0)
            
        }
        
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(shouldShowSheet: .constant(true))
        
    }
}
