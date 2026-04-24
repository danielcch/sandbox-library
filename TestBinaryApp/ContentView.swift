//
//  ContentView.swift
//  TestBinaryApp
//
//  Created by DANIEL on 23/4/26.
//

import SwiftUI
import RealmSwift
import Base64
import NetShears

class Person: Object {
    @Persisted var name: String = ""
    @Persisted var age: Int = 0
}

struct ContentView: View {
    @State private var statusText = "Realm listo"

    var body: some View {
        VStack {
            Image(systemName: "externaldrive.badge.checkmark")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(statusText)
                .multilineTextAlignment(.center)

            Button("Guardar persona de prueba") {
                addSamplePerson()
            }
        }
        .padding()
    }

    private func addSamplePerson() {
        do {
            let realm = try Realm()
            let person = Person()
            person.name = "Daniel"
            person.age = 30

            try realm.write {
                realm.add(person)
            }

            let count = realm.objects(Person.self).count
            statusText = "Guardado OK. Personas en Realm: \(count)"
        } catch {
            statusText = "Error Realm: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
