//
//  DetailView.swift
//  CollectionViewsWithJSON
//
//  Created by Güray Gül on 10.10.2023.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    
    var body: some View {
        VStack(spacing: 10) {
            Image("\(person.image)")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(alignment: .bottomTrailing, content: {
                    Text("\(person.firstName) \(person.surname)")
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                })
            
            VStack(alignment: .leading, spacing: 20) {
                Text("\(person.firstName) \(person.surname)")
                    .font(.largeTitle)
                
                Text("Number: \(person.phoneNumbers[0].number)")
                    .multilineTextAlignment(.leading)
                
                Text("Street Adress: \(person.address.streetAddress)")
                    .multilineTextAlignment(.leading)
                
                Text("City: \(person.address.city)")
                    .multilineTextAlignment(.leading)
            }
            .bold()
            .frame(width: 300, height: 200)
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
            .padding()
//            Text("\(person.phoneNumbers[0].number)")
//            Text("\(person.address.streetAddress)")
//            Text("\(person.address.city)")
        }
        
    }
}

#Preview {
    DetailView(person: Person.samplePerson)
}
