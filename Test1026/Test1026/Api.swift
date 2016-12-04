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

