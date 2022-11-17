//
//  ViewController.swift
//  URLSessionImageApp_221117
//
//  Created by junho lee on 2022/11/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let sectionCount: Int = 10
    //    let dataImageOne = try! Data(contentsOf: ImageURL.first)
    //    let dataImageTwo = try! Data(contentsOf: ImageURL.second)
    //    let dataImageThree = try! Data(contentsOf: ImageURL.third)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: customCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        if indexPath.section < 4 {
            cell.label.text = "\(indexPath.section), \(indexPath.row)"
        }
        if indexPath.row == 2 {
            cell.backgroundColor = .red
        }
        switch indexPath.row % 3 {
        case 0:
            DispatchQueue.global().async {
                guard let image = try? Data(contentsOf: ImageURL.first) else {
                    return
                }
                DispatchQueue.main.async {
                    cell.myImage.image = UIImage(data: image)
                }
            }
        case 1:
            DispatchQueue.global().async {
                guard let image = try? Data(contentsOf: ImageURL.second) else {
                    return
                }
                DispatchQueue.main.async {
                    cell.myImage.image = UIImage(data: image)
                }
            }
        case 2:
            DispatchQueue.global().async {
                guard let image = try? Data(contentsOf: ImageURL.third) else {
                    return
                }
                DispatchQueue.main.async {
                    cell.myImage.image = UIImage(data: image)
                }
            }
        default:
            cell.myImage.image = nil
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

final class customCell: UITableViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .white
        label.text = ""
        myImage.image = nil
    }
}

enum ImageURL {
    static let first = URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")!
    static let second = URL(string: "https://wallpaperaccess.com/download/europe-4k-1318341")!
    static let third = URL(string: "https://wallpaperaccess.com/download/europe-4k-1379801")!
}
