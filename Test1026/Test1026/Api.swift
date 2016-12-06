//
//  Api.swift
//  Test1026
//
//  Created by kokuma on 2016/11/6.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import Foundation

let API_BASE_URL = "http://mbpcos.com/"

let PERSONAL_PLAN = "/personalPlan"  //获取计划列表get、创建计划post、修改计划put

let PERSONAL_PLAN_ONE = "/personalPlan/"  //查看一个计划  "\(PERSONAL_PLAN)124"

let EVENTS = "/events"  //活动事件列表

let EVENTS_REC = "/events/rec"  //漫展推荐

let HOT = "/hot"   //获取热搜词

let HOT_VENUES = "/hot/venues"   //获取热门地点

let ACGS = "/acgs"  //获取ACG作品列表、添加标签

let ACGS_ONE = "/acgs/"  //获取详情   "\(ACGS_ONE)124"

let RECOMS = "follow/recom" //获取推荐列表

let ACCOUNTS_SEARCH = "/accounts/search" //获取关键词下的用户列表

let ACCOUNTS_ONE = "/accounts/v2/"  //获取一个user的信息(不需要token,可以要openAccountId)

let VENUES = "/venues"  //获取关键词下的地点

let VENUES_ONE = "/venues/"  //获取一个地点的信息(不需要token,可以要openAccountId)

let DYNAMICS = "/dynamic" //获取动态，专题"positive", "4"

let DYNAMICS_ONE = "/dynamic/"  //获取一个动态的信息(不需要token,可以要openAccountId)


