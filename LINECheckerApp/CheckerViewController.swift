//
//  CheckerViewController.swift
//  LINECheckerApp
//
//  Created by 佐々木　謙 on 2021/04/09.
//

import UIKit
import EMAlertController

class CheckerViewController: UIViewController {
    
    // MARK: - プロパティ
    // textViewのインスタンス
    @IBOutlet weak var textView: UITextView!
    
    // チェック開始ボタンのインスタンス
    @IBOutlet weak var checkerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ダークモード適用を回避
        self.overrideUserInterfaceStyle = .light
        
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
        
        // キーボードにツールバーを反映
        createKeyboardButton()
    }
    
    
    // MARK: - キーボードにツールバーを追加
    // "閉じる", "翻訳"ボタンをキーボードに追加
    func createKeyboardButton() {
        
        // ツールバーを作成
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        
        // 余白用アイテム
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        // "閉じる"ボタンを作成
        let doneButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closeKeyboard))
        
        // "クリア"ボタンを作成
        let crearButtonItem = UIBarButtonItem(title: "クリア", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clearKeyboard))
        
        // "チェック開始"ボタンを作成
        let translationButtonItem = UIBarButtonItem(title: "チェック開始", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneKeyboard))
        
        // ツールバーにボタンを反映（閉じる, クリア, チェック開始）
        toolbar.setItems([doneButtonItem, flexibleItem, crearButtonItem, flexibleItem, translationButtonItem], animated: true)
        
        // ツールバーを反映
        textView.inputAccessoryView = toolbar
    }
    
    
    // MARK: - キーボードアクション
    // Viewタップ閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // キーボードを閉じる
        self.view.endEditing(true)
    }
    
    // キーボードの閉じるをタップすると呼ばれる
    @objc func closeKeyboard() {
        
        // キーボードを閉じる
        self.view.endEditing(true)
    }
    
    // キーボードのクリアをタップすると呼ばれる
    @objc func clearKeyboard() {
        
        // textViewをクリア
        textView.text = ""
    }
    
    // キーボードの完了をタップすると呼ばれる
    @objc func doneKeyboard() {
        
        // キーボードを閉じる
        self.view.endEditing(true)
        
        // 特定の絵文字が存在すれば...で分岐
        if textView.text.contains("😅") || textView.text.contains("😓") || textView.text.contains("😄") || textView.text.contains("😁") || textView.text.contains("😃") || textView.text.contains("😚") || textView.text.contains("❓") || textView.text.contains("❗️") || textView.text.contains("😊") || textView.text.contains("💦") || textView.text.contains("😥") || textView.text.contains("‼️") || textView.text.contains("⁉️") {
            
            // アラートのインスタンス
            let alert = EMAlertController(icon   : UIImage(named: "おじさん1"),
                                          title  : "おじラインです",
                                          message: "あなたの送信内容はおじラインです。 \n それじゃモテませんよ？")
            
            // アラートのアクションを設定しアラートを追加
            let doneAction = EMAlertAction(title: "閉じる", style: .normal)
            alert.addAction(doneAction)
            
            // アラートの表示
            present(alert, animated: true, completion: nil)
            
        } else if textView.text == "" {
            
            print("何もしない")
        } else {
            // アラートのインスタンス
            let alert = EMAlertController(icon   : UIImage(named: "おじさん2"),
                                          title  : "おじラインではありません",
                                          message: "あなたの送信内容は \n おじラインではありません！")
            
            // アラートのアクションを設定しアラートを追加
            let doneAction = EMAlertAction(title: "閉じる", style: .normal)
            alert.addAction(doneAction)
            
            // アラートの表示
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - ボタンアクション
    // おじチェックボタンをタップすると呼ばれる
    @IBAction func tapCheckerButton(_ sender: Any) {
        
        // 特定の絵文字が存在すれば...で分岐
        if textView.text.contains("😅") || textView.text.contains("😓") || textView.text.contains("😄") || textView.text.contains("😁") || textView.text.contains("😃") || textView.text.contains("😚") || textView.text.contains("❓") || textView.text.contains("❗️") || textView.text.contains("😊") || textView.text.contains("💦") || textView.text.contains("😥") || textView.text.contains("‼️") || textView.text.contains("⁉️") {
            
            // アラートのインスタンス
            let alert = EMAlertController(icon   : UIImage(named: "おじさん1"),
                                          title  : "おじラインです",
                                          message: "あなたの送信内容はおじラインです。 \n それじゃモテませんよ？")
            
            // アラートのアクションを設定しアラートを追加
            let doneAction = EMAlertAction(title: "閉じる", style: .normal)
            alert.addAction(doneAction)
            
            // アラートの表示
            present(alert, animated: true, completion: nil)
        } else if textView.text == "" {
            
            print("何もしない")
        } else {
            // アラートのインスタンス
            let alert = EMAlertController(icon   : UIImage(named: "おじさん2"),
                                          title  : "おじラインではありません",
                                          message: "あなたの送信内容は \n おじラインではありません！")
            
            // アラートのアクションを設定しアラートを追加
            let doneAction = EMAlertAction(title: "閉じる", style: .normal)
            alert.addAction(doneAction)
            
            // アラートの表示
            present(alert, animated: true, completion: nil)
        }
    }
}


// MARK: - Extension
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

