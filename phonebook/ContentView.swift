//
//  ContentView.swift
//  phonebook
//
//  Created by Jitendra Nirnejak on 09/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var appTitle = "Contacts"
    @State var subtitle = "List of people from Breaking Bad"
    
    struct Contact {
        var name: String
        var role: String
        var age: Int
        
        var twitter: String
        var github: String
        var dribbble: String
    }
    
    @State var contacts = [
        Contact(
            name: "Walter White",
            role: "Chemistry Teacher",
            age: 51,
            twitter: "https://twitter.com/walterwhite",
            github: "https://github.com/walterwhite",
            dribbble: "https://dribbble.com/walterwhite"
        ),
        Contact(
            name: "Jessie Pinkman",
            role: "Unemployed",
            age: 25,
            twitter: "https://twitter.com/jessie",
            github: "https://github.com/jessie",
            dribbble: "https://dribbble.com/jessie"
        ),
        Contact(
            name: "Saul Goodman",
            role: "Lawyer",
            age: 38,
            twitter: "https://twitter.com/saulgoodman",
            github: "https://github.com/saulgoodman",
            dribbble: "https://dribbble.com/saulgoodman"
        ),
        Contact(
            name: "Hank Schrader",
            role: "DEA Agent",
            age: 48,
            twitter: "https://twitter.com/jessie",
            github: "https://github.com/jessie",
            dribbble: "https://dribbble.com/jessie"
        ),
        Contact(
            name: "Gustavo Fring",
            role: "Businessman",
            age: 57,
            twitter: "https://twitter.com/gustavofring",
            github: "https://github.com/gustavofring",
            dribbble: "https://dribbble.com/gustavofring"
        ),
    ]

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
                        ForEach(0 ..< contacts.count, id: \.self) { index in
                            Card(
                                name: contacts[index].name,
                                role: contacts[index].role,
                                age: contacts[index].age,
                                twitter: contacts[index].twitter,
                                dribbble: contacts[index].dribbble,
                                github: contacts[index].github
                            )
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func Card(
        name: String,
        role: String,
        age: Int,
        twitter: String,
        dribbble: String,
        github: String
    ) -> some View {
        VStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title3).fontWeight(.semibold)
                    .padding(.top)
                
                Text("\(age), \(role)")
                    .font(.callout).fontWeight(.regular)
                    .padding(.top, 1.0)
                
                Divider().padding(.vertical, 5.0)
                
                HStack(spacing: 20.0) {
                    Text("[Twitter](\(twitter))").font(.footnote)
                    Text("[Dribbble](\(dribbble))").font(.footnote)
                    Text("[Github](\(github))").font(.footnote)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
