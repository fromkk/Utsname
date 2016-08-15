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
    case Sysname
    case Nodename
    case Release
    case Version
    case Machine
    case count

    var name: String {
        switch self {
        case .Sysname:
            return "sysname"
        case .Nodename:
            return "nodename"
        case .Release:
            return "release"
        case .Version:
            return "version"
        case .Machine:
            return "machine"
        default:
            return ""
        }
    }
    func value(utsname: Utsname) -> String {
        switch self {
        case .Sysname:
            return utsname.sysname
        case .Nodename:
            return utsname.nodename
        case .Release:
            return utsname.release
        case .Version:
            return utsname.version
        case .Machine:
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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.count.rawValue
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell: ViewControllerCell = tableView.dequeueReusableCellWithIdentifier(ViewControllerCell.cellIdentifier, forIndexPath: indexPath) as? ViewControllerCell else {
            fatalError("cell get failed")
        }
        if let row: Rows = Rows(rawValue: indexPath.row) {
            cell.nameLabel.text = row.name
            cell.valueLabel.text = row.value(self.utsname)
        }

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
}
