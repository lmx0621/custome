*** Settings ***
Library           Selenium2Library

*** Variables ***
${BETA_USERNAME}    20151228
${BETA_PASSWORD}    123456
${BETA_SHOP_ID}    97320
${BETA_URL}       http://betanewwsh.snsshop.net
${BETA_URL_API}    http://betanewwsh.snsshop.net/
${BETA_WX_URL}    http://weishanghuzhushou.betanewwx.snsshop.net/weishanghuzhushou
${BETA_URL_BASEAPI}    http://betanewapi.snsshop.net/v1
${BETA_WX_USER}    13723232
@{G订单类型}          普通订单    秒杀    预售    pos收银    pos订单    拍码打折    扫码订单
...               拼团    积分订单
${CI_URL}         http://testnewwsh.snsshop.net/
${CI_WX_URL}      http://scliveapp2015.wx335.newwsh.snsshop.net/scliveapp2015
${CI_USER_ID}     137240011
${BETA_USER_ID}    13723232
${CI_WX_USER}     137240011
${CI_URL_API}     http://shanghutest.cxm/
${DEV_WX_USER}    ${EMPTY}
${CI_USERNAME}    7638800811
${CI_PASSWORD}    518000
${CI_SHOP_ID}     514
${AUTO_USER_ID}    13764541
${AUTO_SHOP_ID}    98185
${AUTO_WX_USER}    13764541
${AUTO_MEMBER_ID}    264
${BETA_MEMBER_ID}    255
${AUTO_USER_ID1}    13764541
${AUTO_USER_ID2}    13764549
${AUTO_MEMBER_ID1}    264
${AUTO_MEMBER_ID2}    265

*** Keywords ***
Get_Env
    [Documentation]    获取运行环境
    ${flag_env}    Run Keyword And Return Status    Log    env:${env}
    ${GLOBAL_ENV}    Set Variable If    ${flag_env}==True    ${env}    auto    #默认auto
    Set Global Variable    ${GLOBAL_ENV}

Get_Headers
    [Arguments]    ${type}=json
    [Documentation]    说明：设置头文件模板，默认参数为json模板，其它任意参数为webform模板
    ####
    ${headers_json}    Create Dictionary    Accept-Language=zh-CN,zh;q=0.8    Accept-Encoding=gzip, deflate, sdch    Accept=application/json, text/plain, */*    Content-Type=application/json;charset=UTF-8    YT=debuging
    ${headers_form}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${headers}    Set Variable If    '${type}'=='json'    ${headers_json}    ${headers_form}
    [Return]    ${headers}

环境配置
    [Arguments]    ${env}
    [Documentation]    YT:13764541
    ...    Dreamwaker:13764552
    ...
    ...    Auto环境：
    ...
    ...    分店1：shop_sub_id=109913
    ...
    ...    分店2：shop_sub_id=109935
    &{AUTO}    Create Dictionary    url=http://betanewwsh.snsshop.net    username=20160912    password=123456    shop_id=98185    shop_sub_id=109935
    ...    user_id=13764552    member_id=266    subshop_url=http://betashopadmin.snsshop.net    wx_url=http://wkdianshang.betanewwx.snsshop.net/wkdianshang    wx_acc=wkdianshang
    &{BETA}    Create Dictionary    url=http://betanewwsh.snsshop.net    username=${BETA_USERNAME}    password=${BETA_PASSWORD}    shop_id=${BETA_SHOP_ID}    shop_sub_id=None
    ...    user_id=${BETA_USER_ID}    member_id=${BETA_MEMBER_ID}    subshop_url=http://betashopadmin.snsshop.net    wx_url=${BETA_WX_URL}    wx_acc=weishanghuzhushou
    &{CI}    Create Dictionary    url=http://shanghutest.cxm    username=${CI_USERNAME}    password=${CI_PASSWORD}    shop_id=${CI_SHOP_ID}    shop_sub_id=116597
    ...    user_id=${CI_USER_ID}    member_id=None    subshop_url=http://shopadmintest.cxm    wx_url=http://scliveapp2015.weixintest.cxm/scliveapp2015    wx_acc=scliveapp2015
    &{DEV}    Create Dictionary    url=http://335.newwsh.snsshop.net    username=${CI_USERNAME}    password=${CI_PASSWORD}    shop_id=${CI_SHOP_ID}    shop_sub_id=116597
    ...    user_id=${CI_USER_ID}    member_id=None    subshop_url=http://shopadmin335.newwsh.snsshop.net    wx_url=http://scliveapp2015.wx335.newwsh.snsshop.net/scliveapp2015    wx_acc=scliveapp2015
    &{TEST}    Create Dictionary    url=http://testnewwsh.snsshop.net    username=20160705    password=123456    shop_id=98160    shop_sub_id=109643
    ...    user_id=13764496    member_id=278    subshop_url=http://testshopadmin.snsshop.net    wx_url=http://nbwshtest.testnewwx.snsshop.net/nbwshtest    wx_acc=nbwshtest
    &{ENV_DICT}    Create Dictionary    beta=&{BETA}    test=&{TEST}    ci=&{CI}    dev=&{DEV}    auto=&{AUTO}
    ###
    [Return]    &{ENV_DICT.${env}}

初始化
    Get Env
    ${GLOBAL_CONFIG}    环境配置    ${GLOBAL_ENV}
    Set Global Variable    ${GLOBAL_CONFIG}
    Log    测试环境：${GLOBAL_ENV}
