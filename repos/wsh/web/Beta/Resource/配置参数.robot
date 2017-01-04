*** Settings ***
Library           Selenium2Library

*** Variables ***
${USERNAME}       20151228
${PASSWORD}       123456
${SHOP_ID}        97320
${URL_TEST}       http://testnewwsh.snsshop.net/
${URL_BETA}       http://betanewwsh.snsshop.net
${URL_API_TEST}    http://testnewwsh.snsshop.net/
${URL_API_BETA}    http://betanewwsh.snsshop.net/
${URL_BASEAPI}    http://betanewapi.snsshop.net/v1
@{G订单类型}          普通订单    秒杀    预售    pos收银    pos订单    拍码打折    扫码订单
...               拼团    积分订单
${URL_BETA_WX}    http://weishanghuzhushou.betanewwx.snsshop.net

*** Keywords ***
Get_Headers
    [Arguments]    ${type}=json
    ####
    ${headers_json}    Create Dictionary    Accept-Language=zh-CN,zh;q=0.8    Accept-Encoding=gzip, deflate, sdch    Accept=application/json, text/plain, */*    Content-Type=application/json;charset=UTF-8    YT=debuging
    ${headers_form}    Create Dictionary    Accept-Language=zh-CN,zh;q=0.8    Accept-Encoding=gzip, deflate, sdch    Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    ${headers}    Set Variable If    '${type}'=='json'    ${headers_json}    ${headers_form}
    [Return]    ${headers}
