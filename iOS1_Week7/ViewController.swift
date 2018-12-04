//
//  ViewController.swift
//  iOS1_Week7
//
//  Created by Kadir Kemal Dursun on 4.12.2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtEstimate: UITextField!
    @IBOutlet weak var btnEstimate: UIButton!
    @IBOutlet weak var estimationHistory: UITextView!
    
    var onGame = false
    var number: Int = 0
    var estimateCount = 0
    let maxEstimateCount = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        estimationHistory.text = ""
        btnEstimate .setTitle("Oyuna Başla", for: .normal)
    }
    
    @IBAction func btnTahminClicked(_ sender: UIButton) {
        if(!onGame){
            initGame()
        }
        else{
            controlTheEstimation()
        }
    }
    
    func initGame(){
        estimationHistory.text = ""
        onGame = true
        lblTitle.text = "0-100 arası bir sayı tuttum, ilk tahminini bekliyorum"
        btnEstimate .setTitle("Tahmin Et", for: .normal)
        number = Int.random(in: 0 ... 100)
        estimateCount = 0
    }
    
    func controlTheEstimation(){
        guard let est =  Int(txtEstimate.text!) else{
            return
        }
        
        estimateCount += 1
        if est == number {
            lblTitle.text = "Tebrikler, \(estimateCount) tahminde tutmuş olduğum \(number) sayısını buldun :)"
            
            estimationHistory.text += "\(est) - TEBRİKLER \n"
            askForNewGame()
        }
        else if est < number {
            lblTitle.text = "\(est) sayısından daha BÜYÜK bir sayı tuttum - \(estimateCount). hakkın"
            
            estimationHistory.text += "\(est) - YUKARI \n"
        }
        else {
            lblTitle.text = "\(est) sayısından daha KÜÇÜK bir sayı tuttum - \(estimateCount). hakkın"
            
            estimationHistory.text += "\(est) - AŞAĞI \n"
        }
        
        if estimateCount == maxEstimateCount {
            finishGameWithFail()
        }
    }
    
    func finishGameWithFail(){
        lblTitle.text = "Bilemedin, \(estimateCount) tahminde tutmuş olduğum \(number) sayısını bulamadın!!!"
        askForNewGame()
    }
    
    func askForNewGame(){
        btnEstimate .setTitle("Tekrar Oyna", for: .normal)
        onGame = false
    }

}

