//
//  CustomTextField.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

enum TextFieldType {
    case normal
    case secure
}

struct CustomTextField: View {
    var title: String
    @Binding var value: String
    var textfieldStyle: TextFieldType = .normal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            switch textfieldStyle {
            case .normal:
                TextField(title, text: $value, prompt: Text(title))
                    .textFieldStyle(.roundedBorder)
            case .secure:
                SecureField(title, text: $value, prompt: Text(title))
            }
        }
    }
}

#Preview {
    CustomTextField(title: "Username", value: .constant("username"))
}
