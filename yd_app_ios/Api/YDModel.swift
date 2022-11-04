//
//  YDModel.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/12.
//

import HandyJSON
struct HomeJobListModel: HandyJSON {
    var jobdescription: String?
    var title: String?
    var worktimes: String?
}


struct HomeBannerModel: HandyJSON {
    var logourl: String?
    var title: String?
    var imgurl: String?
}

struct HomeModel: HandyJSON {
    var name: String?
    var banner: [HomeBannerModel]?
    var joblist2: [HomeJobListModel]?

}

extension Array: HandyJSON{}

struct ReturnData<T: HandyJSON>: HandyJSON {
    var name:String?
    var banner: T?
    var stateCode: Int = 0
}

struct ResponseData<T: HandyJSON>: HandyJSON {
    var status: Int = 0
    var name: String?
    var data: T?
}
