//
//  QRCodeViewController.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/12/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import AVFoundation
class QRCodeViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate,UINavigationBarDelegate{

    @IBOutlet weak var messageLabel: UILabel!
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
     let back = UIButton()
    var contGlobal = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        back.setTitle("Voltar", forState: .Normal)
        back.setTitleColor(UIColor.blueColor(), forState: .Normal)
        back.frame = CGRectMake(15, 15, 100, 100)
        back.addTarget(self, action: #selector(QRCodeViewController.pressed(_:)), forControlEvents: .TouchUpInside)
        let captureDevice=AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var input : AnyObject!
        do {
            input = try AVCaptureDeviceInput(device: captureDevice)
        } catch _ {
            print("hata")
        }
        captureSession = AVCaptureSession()
        captureSession?.addInput(input as! AVCaptureInput)
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        captureSession?.startRunning()
        view.bringSubviewToFront(messageLabel)
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView?.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubviewToFront(qrCodeFrameView!)
        view.addSubview(back)
        view.bringSubviewToFront(back)

        // Do any additional setup after loading the view.
    }
    
    func pressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        //Ve se o array não é nil e se tem pelo menos um objeto.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRectZero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Objeto de metadata
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds.
            let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            qrCodeFrameView?.frame = barCodeObject.bounds;
            
            if metadataObj.stringValue != nil  && contGlobal==0 {
                print(metadataObj.stringValue)
               // link = metadataObj.stringValue
                dismissViewControllerAnimated(true, completion: nil)
                
                contGlobal += 1
                return
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
