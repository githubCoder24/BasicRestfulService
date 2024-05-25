//
//  ContentView.swift
//  MyECGApp
//
//  Created by Pavan Tatikonda on 5/23/24.
//
//import SwiftUI
//import UIKit
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hi Pavan!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
//import SwiftUI
//import UIKit
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hi Pavan!")
//            ECGViewControllerRepresentable() // Embed the UIViewController here
//                .frame(height: 400) // Adjust the frame as needed
//        }
//        .padding()
//    }
//}
//
//struct ECGViewControllerRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> ViewController {
//        return ViewController() // Return an instance of your ViewController
//    }
//
//    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
//        // No updates needed for now
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hi Pavan!")
            ECGViewControllerRepresentable()
                .frame(height: 400) // Adjust the frame as needed
        }
        .padding()
    }
}

struct ECGViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        let a = ViewController()
        print("controller_output\(a)")
        return a
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // No updates needed for now
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
