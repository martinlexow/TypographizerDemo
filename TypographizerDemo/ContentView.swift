

import SwiftUI
import Typographizer


struct ContentView: View {
    
    @State var textValue: String = "Avoid using \"dumb\" quotes."
    @State var selectedLanguageTag: Int = 0
    @State var selectedLanguage: String = "en"
    
    var body: some View {
        
        VStack {
            
            Picker("Language Picker", selection: $selectedLanguageTag) {
                Text("en").tag(0)
                Text("de").tag(1)
                Text("fr").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            Text(textValue.typographized(language: selectedLanguage))
                .font(Font.title.weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.green)
                .animation(.easeOut)
                .padding([.bottom], 64)
            
            Spacer()
            
            TextField("Input", text: self.$textValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding(32)
        .onChange(of: selectedLanguageTag, perform: {
            changedValue in
            
            if changedValue == 0 {
                selectedLanguage = "en"
            }
            
            if changedValue == 1 {
                selectedLanguage = "de"
            }
            
            if changedValue == 2 {
                selectedLanguage = "fr"
            }
            
        })
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
