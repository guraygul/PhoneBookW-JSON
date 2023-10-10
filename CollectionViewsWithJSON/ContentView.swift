//
//  ContentView.swift
//  CollectionViewsWithJSON
//
//  Created by Güray Gül on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people, id: \.firstName) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        
                        HStack{
                            Image(person.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            VStack(alignment: .leading) {
                                Text("\(person.firstName) \(person.surname)")
                                    .bold()
                                Text("\(person.phoneNumbers[0].number)")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.trailing, 10)
                            .padding(.vertical, 5)
                        }
                    }
                    .padding(6)
                }
                .listRowInsets(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
            .listStyle(.plain)
            .navigationTitle("Phone Book")
        }
    }
}

#Preview {
    ContentView()
}
