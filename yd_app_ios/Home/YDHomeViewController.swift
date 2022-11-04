//
//  YDHomeViewController.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/5.
//

import Foundation
import SDCycleScrollView
import MJRefresh
import UIKit

class YDHomeViewController: YDBaseViewController, SDCycleScrollViewDelegate, UIScrollViewDelegate, YDHomePresenterProtocol, UITableViewDelegate, UITableViewDataSource {
    private var pageIndex: Int = 0
    private var bannerUrlList = [String]()
    private var homeList = [HomeJobListModel]()
    private lazy var presenter: YDHomePresenter = {
        return YDHomePresenter(presenter: self)
    }()
    
    lazy var scrollowView:UIScrollView = {
        let scrollowView = UIScrollView()
        scrollowView.delegate = self
        scrollowView.mj_header = MJRefreshStateHeader(refreshingBlock: { [self] in
            pageIndex = 0
            presenter.loadData()
        })
        scrollowView.mj_footer = MJRefreshFooter(refreshingBlock: {
            scrollowView.mj_footer?.endRefreshingWithNoMoreData()
        })
        return scrollowView
    }()
    
    lazy var bannerView:SDCycleScrollView = {
        let bannerView:SDCycleScrollView = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: UScreenWidth - 20, height: 100), shouldInfiniteLoop: true, imageNamesGroup: ["home_banner_default"])
        bannerView.autoScrollTimeInterval = 3.0
        bannerView.showPageControl = true
        bannerView.hidesForSinglePage = false
        bannerView.pageControlStyle =  SDCycleScrollViewPageContolStyleClassic
        bannerView.pageDotColor = UIColor.lightGray
        if #available(iOS 11.0, *) {
            bannerView.currentPageDotColor = UIColor.init(named: "GreenColor")
        } else {
            // Fallback on earlier versions
            bannerView.currentPageDotColor = UIColor.green
        }
        bannerView.delegate = self
        return bannerView
    }()
    
    lazy var tableView: UITableView = {
        let tableview: UITableView = UITableView(frame: .zero, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(YDHomeTableViewCell.self, forCellReuseIdentifier: "YDHomeTableViewCell")
       return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
        view.addSubview(scrollowView)
        scrollowView.snp.makeConstraints{
            $0.top.equalTo(view.yd_snap.top)
            $0.left.equalTo(10)
            $0.right.equalTo(-10)
            $0.bottom.equalTo(view.yd_snap.bottom)
        }

        scrollowView.addSubview(bannerView)
        scrollowView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(bannerView.snp_bottom)
            make.left.right.equalTo(view)
            make.height.equalTo(600)
        }
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
    func reloadBannerView(_ bannerUrlList: [NSString]) {
        self.bannerView.imageURLStringsGroup = bannerUrlList
        self.homeList = self.presenter.homeList
        tableView.reloadData()
        scrollowView.mj_header?.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.homeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YDHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "YDHomeTableViewCell", for: indexPath) as! YDHomeTableViewCell
        cell.model = self.homeList[indexPath.row]
        return cell
    }

    
}
