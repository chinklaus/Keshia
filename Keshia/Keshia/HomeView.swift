//
//  HomeView.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/28.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI
import Speech

struct HomeView: View {
    var persons: [Person] = []
    @State private var name:String = ""
    
    var body: some View {
        ZStack
           {
              RadialGradient(gradient: Gradient(colors:
                [Color("HomeMainColor"), .white]),
                center: .center, startRadius: 2, endRadius: 650)
            .edgesIgnoringSafeArea(.all)
    VStack {
        Spacer()
        VStack {
            Text("Keshia")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            HStack {
                Text("Your Assistant")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("Taipei")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            TextField("告訴我你想幹嘛", text: $name,
                onEditingChanged:{(editing) in print("onEditingChanged", editing)},
                onCommit: {() in print("onCommit")}
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(20)
            }
        Spacer()
        Button(action: {
            print("Say some shit")
        }) {
            Image(systemName: "mic.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
            
        }
        .buttonStyle(GradientBackgroundStyle())
        .padding()
      }
    }
  }
}

struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
           .padding(50)
           .background(
               RadialGradient(gradient: Gradient(colors:
                        [.black, Color("HomeMainColor")]),
                        center: .center, startRadius: 200, endRadius: 50)
           )
           .clipShape(Circle())
           .shadow(radius: 5.0)
    }
}

class SpeachDetectViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    // let speechRecognizer: SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    @IBOutlet weak var detectedTextLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }

}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
