//
//  ViewController.swift
//  SwiftUIViewTableView
//
//  Created by Manav Prakash on 09/06/23.
//

import UIKit
import SwiftUI
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView = UITableView(frame: view.frame, style: .grouped)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    
    view.addSubview(tableView)
  }
  
  // MARK: - UITableViewDataSource
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "cell",
      for: indexPath
    )
    
    cell.contentConfiguration = UIHostingConfiguration {
      MyView(number: indexPath.row)
    }
    
    return cell
  }
}


struct MyView: View {
  var number = 0
  var body: some View {
    HStack(alignment: .center) {
      ForEach(0..<3) { value in
        VStack {
          AsyncImage(
            url: URL(string: "https://source.unsplash.com/collection/\((number * 3) + value)/100x100"),
            content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)
            },
            placeholder: {
              ProgressView()
                .frame(width: 100, height: 100)
            }
          )
          Spacer()
          Text("\((number * 3) + value) image")
        }
      }
    }
  }
}

