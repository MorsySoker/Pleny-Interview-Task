//
//  TextFieldView.swift
//  Components
//
//  Created by MorsyElsokary on 02/11/2022.
//

import SwiftUI
import Combine

struct TextFieldView<Content>: View where Content: View {
    
    @Binding var text: String
    @State private var showsPassword: Bool = false
    
    private enum Field: Int, CaseIterable {
        case secure, unSecure
    }
    @FocusState private var focusState: Field?
    private let cornerRadius: CGFloat = 8
    
    let placeholder: String
    let validation: String
    let inputType: UITextContentType
    let maxCount: Int
    let keyBoardType: UIKeyboardType = .default
    let textAlignment: TextAlignment
    let backgroundColor: Color
    let hasShadow: Bool
    let hasBoarder: Bool
    var content: () -> Content
    
    private var secureTextField: some View {
        HStack {
            if !showsPassword {
                SecureField("", text: $text)
                    .focused($focusState, equals: .secure)
            } else {
                TextField("", text: $text)
                    .focused($focusState, equals: .unSecure)
            }
        }
    }
    
    private var keyboardType: UIKeyboardType {
        get {
            switch inputType {
            case .telephoneNumber:
                return .asciiCapableNumberPad
            case .emailAddress:
                return .emailAddress
            case .givenName:
                return .asciiCapable
            default:
                return .default
            }
        }
    }
    
    private let leadingInset: CGFloat = 8
    
    init(_ text: Binding<String>,
         placeholder: String = "",
         validation: String = "",
         maxCount: Int = .max,
         inputType: UITextContentType!,
         textAlignment: TextAlignment = .leading,
         backgroundColor: Color = .white,
         hasShadow: Bool = true,
         hasBoarder: Bool = false,
         @ViewBuilder content: @escaping () -> Content ) {
        self._text = text
        self.placeholder = placeholder
        self.validation = validation
        // Disable password autofill
        self.inputType = inputType == .newPassword || inputType == .password ? .oneTimeCode : inputType
        self.maxCount = maxCount
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.hasShadow = hasShadow
        self.hasBoarder = hasBoarder
        self.content = content
    }
    
    var body: some View {
            ZStack(alignment: .center) {
                TextFieldLabel(placeholder, textAlignment: textAlignment)
                    .font(!text.isEmpty ? .sfBold(of: 12) : .sfRegular(of: 17))
                    .offset(y: !text.isEmpty ? -12 : 0)
                    .animation(.easeInOut(duration: 0.22), value: text.count)
                HStack {
                    Group {
                        if inputType == .password || inputType == .newPassword || inputType == .oneTimeCode {
                            HStack {
                                secureTextField
                                    .padding(.top, text.count > 0 ? 16 : 0)
                
                                Button {
                                    showsPassword.toggle()
                                    focusState = focusState == .secure ? .unSecure : .secure
                                } label: {
                                    Image(systemName: showsPassword ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                            }
                        } else {
                            HStack {
                                TextField("", text: $text)
                                    .padding(.top, text.count > 0 ? 16 : 0)
                                
                                content()
                            }
                            
                        }
                    }
                    .onChange(of: text) { text = String($0.prefix(maxCount)) }
                    .textInputAutocapitalization(.never)
                    .foregroundColor(.appBlue)
                    .keyboardType(keyboardType)
                    .textContentType(inputType)
                    .autocorrectionDisabled()
                }
            }
            .padding(.horizontal, leadingInset)
            .padding(5)
            .padding(.horizontal, 2)
            .frame(height: 42)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .multilineTextAlignment(textAlignment)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(hasBoarder ? Color.appGrayBoarders : .clear, lineWidth: 1)
            }
            .shadow(color: Color.black.opacity(hasShadow ? 0.1 : 0), radius: 16, y: 6)
            .animation(.easeInOut(duration: 0.22), value: text.count)
        }
    }


extension TextFieldView where Content == EmptyView {
    init(_ text: Binding<String>,
         placeholder: String = "",
         validation: String = "",
         maxCount: Int = .max,
         inputType: UITextContentType!,
         textAlignment: TextAlignment = .leading,
         backgroundColor: Color = .white,
         hasShadow: Bool = true,
         hasBoarder: Bool = false) {
        self.init(text, placeholder: placeholder, validation: validation, maxCount: maxCount, inputType: inputType, textAlignment: textAlignment, backgroundColor: backgroundColor, hasShadow: hasShadow, hasBoarder: hasBoarder) {
            EmptyView()
        }
    }
}
