//
//  ContentView.swift
//  Ma'lumotlar tuzilmasi BMI
//
//  Created by Javlonbek iOS Dev on 26/06/22.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    let arr = ["mavzu", "amaliy", "labaratoriya", "video darslik", "test"]
    let size = UIScreen.main.bounds
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                Text("Toshkent axborot texnalogiyalari universiteti")
                Spacer()
                NavigationLink{
                    ScrollView {
                        VStack {
                            ForEach(arr, id: \.self){ item in
                                NavigationLink{
                                    VStack{
                                        if item != "video darslik" {
                                            PDFKitRepresentedView(Bundle.main.url(forResource: "BMI", withExtension: "pdf")!)
                                        } else {
                                            Video(videoID: "https://www.youtube.com/watch?v=GaNYWnlV3R4")
                                                .frame(width: size.width, height: size.width*11/20)
                                        }
                                            
                                    }
                                } label: {
                                    Text(item)
                                        .multilineTextAlignment(.leading)
                                        .font(.title3)
                                        .frame(width: size.width-20, height: 40)
                                        .foregroundColor(.black)
                                        .background(.gray.opacity(0.2))
                                        .cornerRadius(5)
                                }
                            }
                        }
                        .navigationTitle("Ma'lumotlar tuzilmasi")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(trailing: Button{
                            
                        } label: {
                            Image(systemName: "plus")
                        })
                    }
                } label: {
                    Text("Ma'lumotlar tuzilmasi fanidan online darslik")
                        .padding()
                        .background(.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Spacer()
                Text("Abdullayev Ilyos")
                Spacer()
            }
            .font(.title2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView

    let url: URL
    let singlePage: Bool

    init(_ url: URL, singlePage: Bool = false) {
        self.url = url
        self.singlePage = singlePage
    }

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        if singlePage {
            pdfView.displayMode = .singlePage
        }
        return pdfView
    }

    func updateUIView(_ pdfView: UIViewType, context _: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(url: url)
    }
}
