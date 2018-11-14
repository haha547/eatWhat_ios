//
//  mainMenuVC.swift
//  eatWhat_ios
//
//  Created by 徐浩哲 on 2018/11/14.
//  Copyright © 2018 徐浩哲. All rights reserved.
//

import UIKit

class mainMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func showMessage( enter : String, mess : String){
        let alertController = UIAlertController(title: enter, message: mess, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "我瞭解了", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    @IBAction func rolling(_ sender: UIButton) {
        self.showMessage(enter: "你已經被神奇喵喵拜訪", mess: "你應該吃麻辣魚大份香腸蛋炒飯加上一杯蜂蜜檸檬 總共熱量為 987 大卡")
    }
}
