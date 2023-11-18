//
//  CatalogViewController.swift
//  KGMart
//
//  Created by Gulzat on 17/11/23.
//

import UIKit

class CatalogViewController: UIViewController {

    private var fabricators: [Fabricator] = []
    private let catalogTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        title = "Каталог товаров"
       
        configureTableView()
    }
    
    private func initData() {
        fabricators = [
            Fabricator(name: "KGMart", brand: ["Nike", "Puma"],
                       goods: [Good(name: "Крассовка", brand: "Nike", image: "ic_good1", count: 100),
                               Good(name: "Крассовка", brand: "Puma", image: "ic_good2", count: 100),
                               Good(name: "Крассовка", brand: "Adidas", image: "ic_good3", count: 100),
                               Good(name: "Крассовка", brand: "Puma", image: "ic_good4", count: 100),
                               Good(name: "Крассовка", brand: "Round Lab", image: "ic_good5", count: 100),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_good6", count: 100)
                              ],
                       logo: "ic_kgmart_logo"),
            Fabricator(name: "Bayra", brand: ["Etno"],
                       goods: [Good(name: "Платье", brand: "Etno", image: "ic_bayra1", count: 100),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra2", count: 100),
                               Good(name: "Чапан", brand: "Etno", image: "ic_bayra3", count: 100),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra1", count: 100),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra2", count: 100),
                              ],
                      logo: "ic_bayra_logo"),
            Fabricator(name: "Dordoy", brand: ["Nike", "Puma"],
                       goods: [Good(name: "Крассовка", brand: "Guggi", image: "ic_dordoy6", count: 100),
                               Good(name: "Крассовка", brand: "Amazon", image: "ic_dordoy2", count: 100),
                               Good(name: "Крассовка", brand: "Xerox", image: "ic_dordoy3", count: 100),
                               Good(name: "Крассовка", brand: "Crazy Glue", image: "ic_dordoy4", count: 100),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_dordoy5", count: 100),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_dordoy6", count: 100)
                              ],
                       logo: "ic_dordoy_logo")
        ]
    }
    
    private func configureTableView() {
        let margins = view.layoutMarginsGuide
        
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        
        catalogTableView.separatorStyle = .none
        
        catalogTableView.register(FabricatorCell.self, forCellReuseIdentifier: "cellSection")
        catalogTableView.register(GoodCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(catalogTableView)
        catalogTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catalogTableView.topAnchor.constraint(equalTo: margins.topAnchor),
            catalogTableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            catalogTableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            catalogTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
        ])
    }
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fabricators[section].isOpen
        ? fabricators[section].goods.count + 1
        : 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSection", for: indexPath) as! FabricatorCell
            cell.setCellData(fabricators[indexPath.section].name, fabricators[indexPath.section].logo)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoodCell
            cell.setCellData(fabricators[indexPath.section].goods[indexPath.row-1])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        fabricators.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            fabricators[indexPath.section].isOpen = !fabricators[indexPath.section].isOpen
        }
        
        tableView.reloadData()
    }
}
