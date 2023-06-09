//
//  ContentView.swift
//  phonebook
//
//  Created by Jitendra Nirnejak on 09/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var appTitle = "Hello there!"
    @State var subtitle = "Building my first SwiftUI app"

    var body: some View {
        ZStack {
            Color(.white).opacity(0)
                .ignoresSafeArea()
                .background(
                    Image("BackgroundImage")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
            ScrollView {
                VStack(spacing: 1.0) {
                    Text(appTitle)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding(.top, 70.0)
                    Text(subtitle)
                        .font(.callout).fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding(.top)
                    
                    VStack(spacing: -50.0) {
                        Card()
                        Card()
                        Card()
                        Card()
                        Card()
                        Card()
                        Card()
                        Card()
                        Card()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func Card() -> some View {
        VStack {
            VStack(alignment: .leading) {
                Text("John Doe")
                    .font(.title3).fontWeight(.semibold)
                    .padding(.top)
                Text("Designer & Developer")
                    .font(.callout).fontWeight(.regular)
                    .padding(.top, 1.0)
                
                Divider().padding(.vertical, 5.0)
                
                HStack(spacing: 20.0) {
                    Text("Twitter").font(.footnote)
                    Text("Dribbble").font(.footnote)
                    Text("Github").font(.footnote)
                }.padding(.vertical, 5.0)
                
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .background(.ultraThinMaterial)
            .foregroundColor(Color.white.opacity(0.5))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(21)
            .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .stroke(
                            LinearGradient(gradient: .init(colors: [Color.white, Color.clear]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing
                            ), lineWidth: 1.0)
                )
            .padding()
            
        }
        .frame(height: 220)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
