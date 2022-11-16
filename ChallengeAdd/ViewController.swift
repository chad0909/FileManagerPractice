//
//  ViewController.swift
//  ChallengeAdd
//
//  Created by 077tech on 2022/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var directoryName: UITextField!
    @IBOutlet weak var fileName: UITextField!
    
    
    @IBAction func presentButton(_ sender: Any) {
           guard let ViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") else {return}
        ViewController2.modalPresentationStyle = .fullScreen
           self.present(ViewController2, animated: true, completion: nil)
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func makeDirectory(_ sender: Any) {
        //디렉토리 만드는법
        let directoryNameIn = directoryName.text!
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath =  documentsURL.appendingPathComponent("\(directoryNameIn)")
            if !fileManager.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    NSLog("Couldn't create document directory")
                }
            }
    }
    @IBAction func makeFile(_ sender: Any) {
        print("click")
        //파일 만드는법
        let fileNameIn = fileName.text!
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("\(fileNameIn).txt")
        let myTextString = NSString(string: "Hello World!")
        try? myTextString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8.rawValue)
    }
    
    
}

