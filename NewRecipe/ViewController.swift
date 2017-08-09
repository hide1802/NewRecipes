//
//  ViewController.swift
//  NewRecipe
//
//  Created by 鈴木英利 on 2017/08/09.
//  Copyright © 2017年 鈴木英利. All rights reserved.
//
import UIKit

private let kTypeUdon = 0
private let kTypeTempura = 1
private let kTypeOmusubi = 2
private let kTypeDonburi = 3

private let kTagImage = 100
private let kTagName = 101

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectIndex: Int = 0
    let pdf = "tempura"
    
    
    // うどん
    let udonNames: [String] = ["釜揚げうどん", "釜玉うどん", "明太釜玉うどん", "とろ玉うどん", "とろろ醤油うどん"]
    let udonImageNames: [String] = ["udon1", "udon2", "udon3", "udon4", "udon5"]
    let udonPDF: [String] = ["", "", "", "", ""]
    
    // 天ぷら
    let tempuraNames: [String] = ["野菜かき揚げ", "かしわ天", "えび天", "さつまいも天", "ちくわ天"]
    let tempuraImageNames: [String] = ["tempura1", "tempura2", "tempura3", "tempura4", "tempura5"]
    let tempuraPDF: [String] = ["", "", "", "", ""]
    
    // おむすび
    let omusubiNames: [String] = ["鮭", "明太子", "昆布", "いなり"]
    let omusubiImageNames: [String] = ["omusubi1", "omusubi2", "omusubi3", "omusubi4"]
    let omusubiPDF: [String] = ["", "", "", "", ""]
    
    // 丼
    let donburiNames: [String] = ["親子丼", "カツ丼", "牛とじ丼"]
    let donburiImageNames: [String] = ["donburi1", "donburi2", "donburi3"]
    let donburiPDF: [String] = ["", "", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeType(_ sender: Any) {
        let segmetedControl = sender as! UISegmentedControl
        selectIndex = segmetedControl.selectedSegmentIndex
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectIndex {
        case kTypeUdon:
            return udonNames.count
        case kTypeTempura:
            return tempuraNames.count
        case kTypeOmusubi:
            return omusubiNames.count
        case kTypeDonburi:
            return donburiNames.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch selectIndex {
        case kTypeUdon:
            let imageView = cell.viewWithTag(kTagImage) as? UIImageView
            imageView?.image = UIImage(named: udonImageNames[indexPath.row])
            
            let namesLabel = cell.viewWithTag(kTagName) as? UILabel
            namesLabel?.text = udonNames[indexPath.row]
            
        case kTypeTempura:
            let imageView = cell.viewWithTag(kTagImage) as? UIImageView
            imageView?.image = UIImage(named: tempuraImageNames[indexPath.row])
            
            let namesLabel = cell.viewWithTag(kTagName) as? UILabel
            namesLabel?.text = tempuraNames[indexPath.row]
            
        case kTypeOmusubi:
            let imageView = cell.viewWithTag(kTagImage) as? UIImageView
            imageView?.image = UIImage(named: omusubiImageNames[indexPath.row])
            
            let namesLabel = cell.viewWithTag(kTagName) as? UILabel
            namesLabel?.text = omusubiNames[indexPath.row]
            
        case kTypeDonburi:
            let imageView = cell.viewWithTag(kTagImage) as? UIImageView
            imageView?.image = UIImage(named: donburiImageNames[indexPath.row])
            
            let namesLabel = cell.viewWithTag(kTagName) as? UILabel
            namesLabel?.text = donburiNames[indexPath.row]
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webViewController = storyboard.instantiateViewController(withIdentifier: "webViewController") as? WebViewController
        
        switch selectIndex {
        case kTypeUdon:
            webViewController?.pdfName = pdf
            
        case kTypeTempura:
            webViewController?.pdfName = tempuraPDF[indexPath.row]
            
        case kTypeOmusubi:
            webViewController?.pdfName = omusubiPDF[indexPath.row]
            
        case kTypeDonburi:
            webViewController?.pdfName = donburiPDF[indexPath.row]
            
        default:
            break
            
        }
        
        navigationController?.pushViewController(webViewController!, animated: true)
        
    }
    
    
}
