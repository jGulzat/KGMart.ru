//
//  CatalogViewController.swift
//  KGMart
//
//  Created by Gulzat on 17/11/23.
//

import UIKit

class CatalogViewController: UIViewController {

    private var fabricators: [Fabricator] = []
    private var filteredData: [Good] = []
    private var goods: [Good] = []
    
    private let catalogTableView = UITableView()
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        title = "Каталог товаров"
       
        configureSearchBar()
        configureTableView()
    }
    
    private func initData() {
        fabricators = [
            Fabricator(name: "KGMart", brand: ["Nike", "Puma"],
                       goods: [Good(name: "Крассовка", brand: "Nike", image: "ic_good1", count: 100, fabricator: "KGMart"),
                               Good(name: "Крассовка", brand: "Puma", image: "ic_good2", count: 100, fabricator: "KGMart"),
                               Good(name: "Крассовка", brand: "Adidas", image: "ic_good3", count: 100, fabricator: "KGMart"),
                               Good(name: "Крассовка", brand: "Puma", image: "ic_good4", count: 100, fabricator: "KGMart"),
                               Good(name: "Крассовка", brand: "Round Lab", image: "ic_good5", count: 100, fabricator: "KGMart"),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_good6", count: 100, fabricator: "KGMart")
                              ],
                       logo: "ic_kgmart_logo"),
            Fabricator(name: "Bayra", brand: ["Etno"],
                       goods: [Good(name: "Платье", brand: "Etno", image: "ic_bayra1", count: 100, fabricator: "Bayra"),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra2", count: 100, fabricator: "Bayra"),
                               Good(name: "Чапан", brand: "Etno", image: "ic_bayra3", count: 100, fabricator: "Bayra"),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra1", count: 100, fabricator: "Bayra"),
                               Good(name: "Платье", brand: "Etno", image: "ic_bayra2", count: 100, fabricator: "Bayra"),
                              ],
                      logo: "ic_bayra_logo"),
            Fabricator(name: "Dordoy", brand: ["Nike", "Puma"],
                       goods: [Good(name: "Крассовка", brand: "Guggi", image: "ic_dordoy6", count: 100, fabricator: "Dordoy"),
                               Good(name: "Крассовка", brand: "Amazon", image: "ic_dordoy2", count: 100, fabricator: "Dordoy"),
                               Good(name: "Крассовка", brand: "Xerox", image: "ic_dordoy3", count: 100, fabricator: "Dordoy"),
                               Good(name: "Крассовка", brand: "Crazy Glue", image: "ic_dordoy4", count: 100, fabricator: "Dordoy"),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_dordoy5", count: 100, fabricator: "Dordoy"),
                               Good(name: "Крассовка", brand: "Nike", image: "ic_dordoy6", count: 100, fabricator: "Dordoy")
                              ],
                       logo: "ic_dordoy_logo")
        ]
        
        for i in fabricators {
            goods.append(contentsOf: i.goods)
        }
    }
    
    private func configureTableView() {
        let margins = view.layoutMarginsGuide
        
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        
        catalogTableView.separatorStyle = .none
        catalogTableView.showsVerticalScrollIndicator = false
        
        catalogTableView.register(FabricatorCell.self, forCellReuseIdentifier: "cellSection")
        catalogTableView.register(GoodCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(catalogTableView)
        catalogTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catalogTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            catalogTableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            catalogTableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            catalogTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
        ])
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        let margins = view.layoutMarginsGuide
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        searchBar.placeholder = "Название товара"
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: margins.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 32)
        ])
        
    }
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("filteredData: \(filteredData)")
        if filteredData.isEmpty {
            return fabricators[section].isOpen ? fabricators[section].goods.count + 1 : 1
        } else {
            return filteredData.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filteredData.isEmpty {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellSection", for: indexPath) as! FabricatorCell
                cell.setCellData(fabricators[indexPath.section].name, fabricators[indexPath.section].logo)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoodCell
                cell.setCellData(fabricators[indexPath.section].goods[indexPath.row-1])
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoodCell
            cell.setCellData(filteredData[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredData.isEmpty ? fabricators.count : 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            fabricators[indexPath.section].isOpen = !fabricators[indexPath.section].isOpen
        }

        tableView.reloadData()
    }
}
extension CatalogViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredData = []
        } else {
            filteredData = goods.filter({
                $0.name.lowercased().contains(searchText.lowercased())
            })
        }
        catalogTableView.reloadData()
    }
}
