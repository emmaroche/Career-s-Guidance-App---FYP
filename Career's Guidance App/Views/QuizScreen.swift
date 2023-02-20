//
//  QuizScreen.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import SwiftUI

struct QuizScreen: View {
    @State var isOn = false
    @State var isOnn = false
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Toggle(isOn: $isOn, label:{
                        Text("hah")
                    })
                    
                    Toggle(isOn: $isOnn, label:{
                        Text("hah")
                    })
                    
                    Toggle(isOn: $isOn, label:{
                        Text("hah")
                    })
                    
                }
                Spacer()
            }
            .navigationTitle("Settings")
        }
    }
}

struct QuizScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreen()
    }
}
