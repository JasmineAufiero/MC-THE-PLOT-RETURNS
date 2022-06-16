//
//  ScanView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for scanning the box of med: Both the front and the side.

import SwiftUI
import VisionKit

import Vision

struct ScanDocumentView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var recognizedText: String
    @Binding var showingNewItemView : Bool
    
    func makeCoordinator() -> Coordinator {
        do{
            showingNewItemView = true
        }
        return Coordinator(recognizedText: $recognizedText, parent: self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentViewController = VNDocumentCameraViewController()
        documentViewController.delegate = context.coordinator
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // nothing to do here
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var recognizedText: Binding<String>
        var parent: ScanDocumentView
        
        init(recognizedText: Binding<String>, parent: ScanDocumentView) {
            self.recognizedText = recognizedText
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let extractedImages = extractImages(from: scan)
            let processedText = recognizeText(from: extractedImages)
            recognizedText.wrappedValue = processedText
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        fileprivate func extractImages(from scan: VNDocumentCameraScan) -> [CGImage] {
            var extractedImages = [CGImage]()
            for index in 0..<scan.pageCount {
                let extractedImage = scan.imageOfPage(at: index)
                guard let cgImage = extractedImage.cgImage else { continue }
                
                extractedImages.append(cgImage)
            }
            return extractedImages
        }
        
        fileprivate func recognizeText(from images: [CGImage]) -> String {
            var entireRecognizedText = ""
            let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
                guard error == nil else { return }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
                
                let maximumRecognitionCandidates = 1
                for observation in observations {
                    guard let candidate = observation.topCandidates(maximumRecognitionCandidates).first else { continue }
                    
                    entireRecognizedText += "\(candidate.string)\n"
                   
                }
            }
            recognizeTextRequest.recognitionLevel = .accurate
            
            for image in images {
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                
                try? requestHandler.perform([recognizeTextRequest])
            }
//            "en-US", "en-GB"
            recognizeTextRequest.recognitionLanguages = ["it-IT"]
            recognizeTextRequest.usesLanguageCorrection = true
            recognizeTextRequest.recognitionLevel = .accurate
            
         
            
            return entireRecognizedText
        }
    }
}











struct ScanView: UIViewControllerRepresentable {
    var didFinishScanning: ((_ result: Result<[UIImage], Error>)-> Void)
    var didCancelScanning: () -> Void
   
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanViewController = VNDocumentCameraViewController()
        scanViewController.delegate = context.coordinator
        return scanViewController
    }
     
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let scanView : ScanView
        init(with scanView: ScanView) {
            self.scanView = scanView
        }
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedBoxes = [UIImage]()
            for _ in 0..<scan.pageCount {
                scannedBoxes.append(scan.imageOfPage(at: 1))
            }
            scanView.didFinishScanning(.success(scannedBoxes))
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            scanView.didCancelScanning()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController,didFailWithError error: Error){
            scanView.didFinishScanning(.failure(error))
        }
    }
    
    
}

//struct ScanView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScanView()
//    }
//}
