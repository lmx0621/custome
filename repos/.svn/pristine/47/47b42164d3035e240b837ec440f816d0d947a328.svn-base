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

添加普通订单

工作台数据
    API登录
    ${resp}    Post Request    wsh    /data-center/workbench-count-data-ajax
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Log    errcode is:${errcode}
    Log    Resp:${resp.content}
    #Log    scan_limit_amount:${scan_limit}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    [Return]    ${errmsg}

工作台公告
    API登录
    ${resp}    Post Request    wsh    /data-center/workbench-notice-ajax
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Log    errcode is:${errcode}
    Log    Resp:${resp.content}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    [Return]    ${errmsg}

API登录
    Create Session    wsh    ${URL_BETA}
    &{data}=    Create Dictionary    username=20151228    password=123456    captcha=1111
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /login/login-ajax    data=${data}    headers=${headers}

商家信息
    API登录
    ${resp}    Post Request    wsh    /shop/get-ajax
    Log    Response:${resp.content}
    ${len}    Get Length    ${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    Log    Res2:${str}
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Log    errcode is:${errcode}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    [Return]    ${errmsg}

工作台广告
    API登录
    ${resp}    Post Request    wsh    /data-center/workbench-ad-ajax
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Log    errcode is:${errcode}
    Log    Resp:${resp.content}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    [Return]    ${errmsg}
