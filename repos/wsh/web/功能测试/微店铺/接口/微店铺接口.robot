*** Settings ***
Library           RequestsLibrary
Library           json
Library           Collections
Library           String

*** Test Cases ***
创建普通订单
    [Setup]
    Create Session    wsh    http://weishanghuzhushou.betanewwx.snsshop.net
    &{data}=    Create Dictionary    id=13723226
    &{headers}=    Create Dictionary    Content-Type=text/html    charset=UTF-8
    ${resp}    Post Request    wsh    /weishanghuzhushou/oauth/testing?id=13723226    headers=${headers}
    Log    Response:${resp.content}
    #############################
    &{data1}=    Create Dictionary    products[0][id]=265190    products[0][sku_id]=1098428    products[0][num]=1    pickup_type=1    shop_id=97320
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /weishanghuzhushou/order/order-add-ajax    data=${data1}    headers=${headers}
    Log    Response:${resp.content}

*** Keywords ***
