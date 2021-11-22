//
//  CatDataCell.swift
//  New-FoodPin
//
//  Created by 张维熙 on 2021/11/18.
//

import UIKit

class RestaurantDataCell: UITableViewCell {

    var nameLabel = UILabel()
    var typeLabel = UILabel()
    var locationLabel = UILabel()
    var restaurantIamge = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(locationLabel)
        addSubview(restaurantIamge)

        configureNameLabal()
        configureTypeLabel()
        configureLocationLabel()
        configureRestaurantImage()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(restaurant: Restaurant) {
        nameLabel.text = restaurant.name
        typeLabel.text = restaurant.type
        locationLabel.text = restaurant.location
        restaurantIamge.image = UIImage(named: restaurant.image)
    }

    func configureNameLabal() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.systemFont(ofSize: 20)
    }

    func configureTypeLabel() {
        typeLabel.numberOfLines = 0
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.font = UIFont.systemFont(ofSize: 17)
        typeLabel.textColor = .black
    }

    func configureLocationLabel() {
        locationLabel.numberOfLines = 0
        locationLabel.adjustsFontSizeToFitWidth = true
        locationLabel.font = UIFont.systemFont(ofSize: 13)
        locationLabel.textColor = .gray
    }

    func configureRestaurantImage() {
        restaurantIamge.layer.cornerRadius = 15
        restaurantIamge.clipsToBounds = true
    }

    func setConstraints() {

        restaurantIamge.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 120, height: 120))
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(restaurantIamge.snp.trailing).offset(20)
            make.top.equalTo(restaurantIamge.snp.top)
        }

        typeLabel.snp.makeConstraints { make in
            make.leading.equalTo(restaurantIamge.snp.trailing).offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }

        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(restaurantIamge.snp.trailing).offset(20)
            make.top.equalTo(typeLabel.snp.bottom).offset(10)
        }

    }

}
