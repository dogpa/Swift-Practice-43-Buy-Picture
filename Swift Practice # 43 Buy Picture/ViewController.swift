//
//  ViewController.swift
//  Swift Practice # 43 Buy Picture
//
//  Created by CHEN PEIHAO on 2021/7/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //海狗石的stepper與Label Outlet
    @IBOutlet weak var seadogStepper: UIStepper!
    @IBOutlet weak var seadogLabel: UILabel!
    
    //雞籠山的stepper與Label Outlet
    @IBOutlet weak var mountainStepper: UIStepper!
    @IBOutlet weak var mountainLabel: UILabel!
    
    //星空倒影的stepper與Label Outlet
    @IBOutlet weak var starStepper: UIStepper!
    @IBOutlet weak var starLabel: UILabel!
    
    //海邊日落的stepper與Label Outlet
    @IBOutlet weak var sunsetStepper: UIStepper!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    //淡水琉璃光的stepper與Label Outlet
    @IBOutlet weak var cloudStepper: UIStepper!
    @IBOutlet weak var cloudLabel: UILabel!
    
    //汀九橋的stepper與Label Outlet
    @IBOutlet weak var bridgeStepper: UIStepper!
    @IBOutlet weak var bridgeLabel: UILabel!
    
    //總價的Label
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    //定義stepper以及function使用的變數
    var seadog:Int = 0
    var mountain:Int = 0
    var star:Int = 0
    var sunset:Int = 0
    var cloud:Int = 0
    var bridge:Int = 0
    
    func calculateAllPrice () {
        //allprice為六張照片各自*總價後的全部值
        let allPrice = (seadog*1000) + (mountain*1100) + (star*1200) + (sunset*1300) + (cloud*1400) + (bridge*1500)
        //引入NumberFormatter()指派給formatter
        let formatter = NumberFormatter()
        //設定formatter的數字格式為貨幣格式
        formatter.locale = Locale(identifier: "zh-TW")
        formatter.numberStyle = .currencyISOCode
        //數字顯示小數點為0
        formatter.maximumFractionDigits = 0
        //總價的label的總價顯示為透過formatter所決定好顯示格式的allPrice
        totalPriceLabel.text = formatter.string(from: NSNumber(value: allPrice))
    }
    
    func textContent () {
        seadogLabel.text = "數量：  \(seadog)"
        mountainLabel.text = "數量：  \(mountain)"
        starLabel.text = "數量：  \(star)"
        sunsetLabel.text = "數量：  \(sunset)"
        cloudLabel.text = "數量：  \(cloud)"
        bridgeLabel.text = "數量：  \(bridge)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperToCalcilate(_ sender: UIStepper) {
        //剛剛設定的變數內容被成各個stepper的value
        seadog = Int(seadogStepper.value)
        mountain = Int(mountainStepper.value)
        star = Int(starStepper.value)
        sunset = Int(sunsetStepper.value)
        cloud = Int(cloudStepper.value)
        bridge = Int(bridgeStepper.value)
        //執行剛剛指派好內容的calculate的function
        calculateAllPrice()
        //指派各個照片的購入數量的label的數量
        textContent()
    }
    
    
    @IBAction func cleanCurt(_ sender: UIButton) {
        //所有變數重新來過變成0
        seadogStepper.value = 0
        seadog = 0
        mountainStepper.value = 0
        mountain = 0
        starStepper.value = 0
        star = 0
        sunsetStepper.value = 0
        sunset = 0
        cloudStepper.value = 0
        cloud = 0
        bridgeStepper.value = 0
        bridge = 0
        //指派各個照片的數量的數字變化
        totalPriceLabel.text = "0"
        textContent()
    }

}

