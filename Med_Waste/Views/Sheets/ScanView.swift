//
//  ScanView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for scanning the box of med: Both the front and the side.

import SwiftUI
import VisionKit

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
