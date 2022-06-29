//
//  Video.swift
//  Ma'lumotlar tuzilmasi BMI
//
//  Created by Javlonbek iOS Dev on 28/06/22.
//

import SwiftUI
import WebKit

struct Video: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: URL(string: "https://www.youtube.com/embed/\(String(videoID.suffix(11)))")!))
    }
}
