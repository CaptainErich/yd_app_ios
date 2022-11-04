//
//  YDHomePresenter.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/19.
//

import Foundation

protocol YDHomePresenterProtocol : NSObjectProtocol {
    func reloadBannerView(_ bannerUrlList: [NSString])
}

class YDHomePresenter {
    weak var presenter: YDHomePresenterProtocol!
    var homeList = [HomeJobListModel]()
    init(presenter: YDHomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
        ApiLoadingProvider.request(YDApi.homeList, model: HomeModel.self) { returnData in
            let bannerModelArray: [HomeBannerModel] = returnData?.banner ?? []
            var bannerUrlList: [NSString] = []
            self.homeList = returnData?.joblist2 ?? []
            for bannerModel in bannerModelArray {
                bannerUrlList.append(bannerModel.imgurl! as NSString)
            }
            self.presenter.reloadBannerView(bannerUrlList)
        }
    }

}
