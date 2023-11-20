//
//  AddGoodViewController.swift
//  KGMart
//
//  Created by Gulzat on 20/11/23.
//

import UIKit

class AddGoodViewController: UIViewController {

    let dataSource = ["KGMart", "Bayra", "Dordoy"]
    var fabricatorName: String = ""
    var indexPath: IndexPath?
    var good: Good?
    var callback: ((_ good: Good, _ index: IndexPath?) -> ())? = nil
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый товар"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Наименование товара"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodNameTF: UITextField = {
        let tf = UITextField()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        tf.placeholder = "Наименование товара"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderColor = UIColor.systemGray3.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    private let goodBrandLabel: UILabel = {
        let label = UILabel()
        label.text = "Бренд товара"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodBrandTF: UITextField = {
        let tf = UITextField()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        tf.placeholder = "Бренд товара"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderColor = UIColor.systemGray3.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    private let goodFabricatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите производителя:"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fabricatorList: UIButton = {
       let listBtn = UIButton(primaryAction: nil)
        var menuChildren: [UIMenuElement] = []
        listBtn.showsMenuAsPrimaryAction = true
        listBtn.changesSelectionAsPrimaryAction = true
        listBtn.translatesAutoresizingMaskIntoConstraints = false
        listBtn.titleLabel?.textAlignment = .left
        listBtn.setTitleColor(.black, for: .normal)
        listBtn.backgroundColor = .lightGray
        listBtn.layer.cornerRadius = 8
        return listBtn
    }()
    
    private let goodImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Загрузите картинку товара"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodImageBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let goodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addGoodButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Добавить товар", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.backgroundColor = UIColor(red: 100/255, green: 8/255, blue: 75/255, alpha: 1)
        return btn
    }()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        imagePicker.delegate = self
        
        configureTitle()
        configureNameLabel()
        configureNameTF()
        configureBrandLabel()
        configureBrandTF()
        configureFabricatorLabel()
        configureFabricatorList()
        configureGoodImageLabel()
        configureGoodImageButton()
        configureGoodImageView()
        configureAddButton()
    }
    
    private func initData() {
        guard let good = good else { return }
        titleLabel.text = "Редактирование товара"
        addGoodButton.setTitle("Редактировать товар", for: .normal)
        goodNameTF.text = good.name
        goodBrandTF.text = good.brand
        goodImageView.image = UIImage(named: good.image)
    }
    
    private func configureTitle() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureNameLabel() {
        view.addSubview(goodNameLabel)
        
        NSLayoutConstraint.activate([
            goodNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            goodNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goodNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureNameTF() {
        view.addSubview(goodNameTF)
        
        NSLayoutConstraint.activate([
            goodNameTF.topAnchor.constraint(equalTo: goodNameLabel.bottomAnchor, constant: 4),
            goodNameTF.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodNameTF.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor),
            goodNameTF.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func configureBrandLabel() {
        view.addSubview(goodBrandLabel)
        
        NSLayoutConstraint.activate([
            goodBrandLabel.topAnchor.constraint(equalTo: goodNameTF.bottomAnchor, constant: 16),
            goodBrandLabel.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodBrandLabel.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor)
        ])
    }
    
    private func configureBrandTF() {
        view.addSubview(goodBrandTF)
        
        NSLayoutConstraint.activate([
            goodBrandTF.topAnchor.constraint(equalTo: goodBrandLabel.bottomAnchor, constant: 4),
            goodBrandTF.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodBrandTF.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor),
            goodBrandTF.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func configureFabricatorLabel() {
        view.addSubview(goodFabricatorLabel)
        
        NSLayoutConstraint.activate([
            goodFabricatorLabel.topAnchor.constraint(equalTo: goodBrandTF.bottomAnchor, constant: 16),
            goodFabricatorLabel.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodFabricatorLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func configureFabricatorList() {
        let actionClosure = { (action: UIAction) in
            self.fabricatorName = action.title
        }
        var menuChildren: [UIMenuElement] = []
        for fruit in dataSource {
            menuChildren.append(UIAction(title: fruit, handler: actionClosure))
        }
       
        fabricatorList.menu = UIMenu(options: .displayInline, children: menuChildren)
        view.addSubview(fabricatorList)
        
        NSLayoutConstraint.activate([
            fabricatorList.topAnchor.constraint(equalTo: goodFabricatorLabel.topAnchor),
            fabricatorList.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor, constant: -12),
            fabricatorList.heightAnchor.constraint(equalToConstant: 32),
            fabricatorList.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureGoodImageLabel() {
        view.addSubview(goodImageLabel)
        
        NSLayoutConstraint.activate([
            goodImageLabel.topAnchor.constraint(equalTo: goodFabricatorLabel.bottomAnchor, constant: 16),
            goodImageLabel.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodImageLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func configureGoodImageButton() {
        view.addSubview(goodImageBtn)
        
        NSLayoutConstraint.activate([
            goodImageBtn.topAnchor.constraint(equalTo: goodImageLabel.topAnchor),
            goodImageBtn.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor, constant: -12),
            goodImageBtn.heightAnchor.constraint(equalToConstant: 32),
            goodImageBtn.widthAnchor.constraint(equalToConstant: 32)
        ])
        goodImageBtn.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
    }
    
    private func configureGoodImageView() {
        view.addSubview(goodImageView)
        
        NSLayoutConstraint.activate([
            goodImageView.topAnchor.constraint(equalTo: goodImageLabel.bottomAnchor, constant: 8),
            goodImageView.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            goodImageView.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor),
            goodImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureAddButton() {
        view.addSubview(addGoodButton)
        
        NSLayoutConstraint.activate([
            addGoodButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            addGoodButton.leadingAnchor.constraint(equalTo: goodNameLabel.leadingAnchor),
            addGoodButton.trailingAnchor.constraint(equalTo: goodNameLabel.trailingAnchor),
            addGoodButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        addGoodButton.addTarget(self, action: #selector(addGood), for: .touchUpInside)
    }
    
    @objc func chooseImage(_ sender: UIButton) {
       imagePicker.allowsEditing = false
       imagePicker.sourceType = .photoLibrary
       present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func addGood(_ sender: UIButton) {
        guard let callback = callback else { return }
        
        validateTextField(goodNameTF)
        validateTextField(goodBrandTF)
        
        if let name = goodNameTF.text, name != "", let brand = goodBrandTF.text, brand != "" {
            let newGood = Good(name: name,
                               brand: brand,
                               image: "ic_dordoy2",
                               count: 400,
                               fabricator: fabricatorName)
            
            callback(newGood, indexPath)
            dismiss(animated: true)
        }
    }
    
    private func validateTextField(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.placeholder = "Заполните поле!"
        } else {
            textField.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }
}

extension AddGoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            goodImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
