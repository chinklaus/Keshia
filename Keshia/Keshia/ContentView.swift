//
//  ContentView.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/24.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var persons: [Person] = []
    
    var body: some View {
        NavigationView{
            List(persons) { person in
                PersonCell(person: person)
        }
        .navigationBarTitle(Text("Person"))
      }
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(persons: testData)
    }
}

struct PersonCell: View {
    let person: Person
    var body: some View {
        NavigationLink(destination: PersonDetail (person: person)){
            Image(person.imageName).cornerRadius(5.0)
            VStack(alignment: .leading) {
                Text(person.name)
 Text(person.headline).font(.subheadline).foregroundColor(Color.gray)
            }
        }
    }
}
