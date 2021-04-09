//
//  CheckerViewController.swift
//  LINECheckerApp
//
//  Created by 佐々木　謙 on 2021/04/09.
//

import UIKit

class CheckerViewController: UIViewController {
    
    // MARK: - プロパティ
    // textViewのインスタンス
    @IBOutlet weak var textView: UITextView!
    
    // チェック開始ボタンのインスタンス
    @IBOutlet weak var checkerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textViewの化粧
        textView.backgroundColor   = .systemBackground
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        // checkerButtonの化粧
        checkerButton.layer.cornerRadius = 6
        
        // NavigationBarの色
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "cd853f")
        
        // 一部NavigationBarがすりガラス？のような感じになるのでfalseで統一
        self.navigationController?.navigationBar.isTranslucent = false
        
        // NavigationBarの下線を削除
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}

// 16進数color機能拡張
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}

