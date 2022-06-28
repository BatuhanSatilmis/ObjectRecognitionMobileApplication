//
//  Helper.swift
//  EngineeringProject
//
//  Created by Batuhan Satilmis on 13.05.2022.
//

import Foundation
import AVFoundation


var voice:Bool = true
var synthesizer = AVSpeechSynthesizer()

func VoiceCommandText(content:String){
    
    if(voice){
        let speechUttarence = AVSpeechUtterance(string: content)
        speechUttarence.voice = AVSpeechSynthesisVoice(language : "en-EN")
        speechUttarence.rate = 0.4
        synthesizer.speak(speechUttarence)
        
    }
    
    else{
        synthesizer.stopSpeaking(at: .word)
    }
    
    voice = !voice // voice degerini tam tersi ile degistiriyorum
    
}
