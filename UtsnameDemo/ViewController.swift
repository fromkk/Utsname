//
//  ViewController.swift
//  UtsnameDemo
//
//  Created by Kazuya Ueoka on 2016/08/15.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import UIKit
import Utsname

enum Rows: Int {
    case sysname
    case nodename
    case release
    case version
    case machine
    case count

    var name: String {
        switch self {
        case .sysname:
            return "sysname"
        case .nodename:
            return "nodename"
        case .release:
            return "release"
        case .version:
            return "version"
        case .machine:
            return "machine"
        default:
            return ""
        }
    }
    func value(_ utsname: Utsname) -> String {
        switch self {
        case .sysname:
            return utsname.sysname
        case .nodename:
            return utsname.nodename
        case .release:
            return utsname.release
        case .version:
            return utsname.version
        case .machine:
            return utsname.machine
        default:
            return ""
        }
    }
}

class ViewControllerCell: UITableViewCell {
    static let cellIdentifier: String = "viewControllerCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
}

class ViewController: UITableViewController {
    var utsname: Utsname = Utsname()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.count.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ViewControllerCell = tableView.dequeueReusableCell(withIdentifier: ViewControllerCell.cellIdentifier, for: indexPath) as? ViewControllerCell else {
            fatalError("cell get failed")
        }
        if let row: Rows = Rows(rawValue: (indexPath as NSIndexPath).row) {
            cell.nameLabel.text = row.name
            cell.valueLabel.text = row.value(self.utsname)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
