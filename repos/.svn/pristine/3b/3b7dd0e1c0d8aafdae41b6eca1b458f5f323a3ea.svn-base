*** Settings ***
Library           RequestsLibrary
Library           String
Library           Collections
Library           json
Resource          配置参数.robot

*** Keywords ***
获取店铺支付方式
    Create Session    baseapi    http://betanewapi.snsshop.net/v1
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Set Variable    {"shop_id":${SHOP_ID}}
    ${resp}    Post Request    baseapi    /payment/find-paytype-list    data=${jsonstr}
    Log    Response:${resp.content}
    ${resp_content}    Set Variable    ${resp.content}
    ${js}    loads    ${resp.content}
    ${errcode}    Get From Dictionary    ${js}    errcode
    Log    errcode:${errcode}
    [Return]    ${resp.content}
