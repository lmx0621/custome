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

API登录
    Create Session    wsh    ${URL_BETA}
    &{data}=    Create Dictionary    username=20151228    password=123456    captcha=1111
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /login/login-ajax    data=${data}    headers=${headers}

微信登录
    ###获取会员ID
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":0,"_page_size":1,"is_get_card":1}
    ${resp}    Post Request    wsh    /members/list-ajax    data=${jsonstr}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    #${用户ID}    获取微信用户ID
    ${列表数据}    Get From Dictionary    ${errmsg}    data
    ${会员列表数量}    Get Length    ${列表数据}
    ##随机选择一个会员获取信息
    ${数组下标}    Evaluate    int(${会员列表数量}-1)
    ${随机选择一个会员}    Evaluate    random.randint(0,${数组下标})    random
    ${获取会员内容}    Get From List    ${列表数据}    ${随机选择一个会员}
    log    ${获取会员内容}
    ##获取微信用户相关信息
    ${微信信息}    Get From Dictionary    ${获取会员内容}    wxUserInfos
    ${微信用户ID}    Get From Dictionary    ${微信信息}    id
    #登陆微信    暂时使用固定值    随机用户更改只需用参数即可
    Create Session    wx    ${URL_BETA_WX}
    &{headers}=    Create Dictionary    Content-Type=text/html    charset=UTF-8
    ${resp}    Post Request    wx    /weishanghuzhushou/oauth/testing?id=13723226    headers=${headers}
    #${resp}    Post Request    wx    /weishanghuzhushou/oauth/testing?id=${微信用户ID}    headers=${headers}
    Log    Response:${resp.content}

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

标签列表
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"name":""}
    ${resp}    Post Request    wsh    /members/find-tag-ajax    data=${jsonstr}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ###
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

-----1-----

客户_列表
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"nickname":"","group_id":null,"shop_sub_id":"","agent_id":"","is_search":false,"belong_to_staff_id":"","createStart":"","createEnd":"","group_ids":[],"yestoday":false,"user_platform":0,"tags":[]}
    ${resp}    Post Request    wsh    /member/list-ajax    data=${jsonstr}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    接口返回异常！
    [Return]    ${errmsg}

客户_详情
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"id":${id}}
    ${resp}    Post Request    wsh    /member/member-detail-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

客户_统计
    API登录
    ${resp}    Post Request    wsh    /member/count-wx-member
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    Log    errcode is:${errcode}
    Log    Resp:${resp.content}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

客户_积分统计
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"user_id":${id}}
    ${resp}    Post Request    wsh    /data/user-point-count-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

客户_积分列表
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"type_id":1,"id":"${id}"}
    ${resp}    Post Request    wsh    /member/point-list-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

客户_消费记录
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"uid":"${id}"}
    ${resp}    Post Request    wsh    /members/find-member-order-list-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

全部客户_消费记录
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"real_name":"","bind_mobile":"","order_no":"","createStart":"","createEnd":"","total_price_min":"","total_price_max":"","shop_sub_id":[],"order_type":[]}
    ${resp}    Post Request    wsh    /members/find-member-order-list-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

-----2-----

会员_列表
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":0,"_page_size":1,"is_get_card":1}
    ${resp}    Post Request    wsh    /members/list-ajax    data=${jsonstr}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员_统计
    API登录
    ${resp}    Post Request    wsh    /members/last-count-ajax
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    Log    errcode is:${errcode}
    Log    Resp:${resp.content}
    Run Keyword If    ${errcode}==0    Log    Success
    ...    ELSE    Log    Failed
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员_详情
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"id":${id}}
    ${resp}    Post Request    wsh    /members/detail-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员_分组列表
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"name":""}    # 分页参数：{"_page":1,"_page_size":20,"name":""}
    ${resp}    Post Request    wsh    /members/find-group-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员_成长明细
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"member_id":${id}}
    ${resp}    Post Request    wsh    /member/member-growth-detail    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员列表_条件查询
    [Arguments]    ${name}=${EMPTY}    ${start}=${EMPTY}    ${end}=${EMPTY}    ${mobile}=${EMPTY}    ${status}=[]    ${source}=[]
    ...    ${level}=[]    ${group_id}=[]    ${tags}=[]    ${sex}=[]
    [Documentation]    查询参数：
    ...    {"_page":1,"_page_size":20,"keyword":"","real_name":"","create_start":1467611419,"create_end":1472104227,"bind_mobile":"","status":[],"source":[],"level":[],"member_group_id":[],"tags":[],"sex":[],"city_id":[],"city":[],"shop_sub_id":""}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"keyword":"","real_name":"${name}","create_start":"${start}","create_end":"${end}","bind_mobile":"${mobile}","status":${status},"source":${source},"level":${level},"member_group_id":${group_id},"tags":${tags},"sex":${sex},"city_id":[],"city":[],"shop_sub_id":""}
    ${resp}    Post Request    wsh    /members/list-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员列表_条件查询2
    [Arguments]    ${args}
    [Documentation]    查询参数：
    ...    {"_page":1,"_page_size":20,"keyword":"","real_name":"","create_start":1467611419,"create_end":1472104227,"bind_mobile":"","status":[],"source":[],"level":[],"member_group_id":[],"tags":[],"sex":[],"city_id":[],"city":[],"shop_sub_id":""}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    ${args}
    ${resp}    Post Request    wsh    /members/list-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

会员_获取全部分组
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"_page":1,"_page_size":20,"name":""}    # 分页参数：{"_page":1,"_page_size":20,"name":""}
    ${resp}    Post Request    wsh    /members/find-all-group-ajax    \    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

-----3-----

订单_列表
    [Arguments]    ${订单状态}=0
    #####获取待收货订单信息
    #####${订单状态}=0全部订单    ${订单状态}=1待付款订单    ${订单状态}=2待发货订单    ${订单状态}=3待收货订单    ${订单状态}=4已完成订单    # ${订单状态}=5售后订单    ${订单状态}=6已关闭订单
    &{headers}=    Create Dictionary    Content-Type=application/json;charset=UTF-8
    &{data}=    Create Dictionary    _status=${订单状态}    after_sales_status=2
    ${resp}    Post Request    wsh    /order/list-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品订单列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品订单列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品订单列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${商品订单列表数量}    Get Length    ${列表数据}
    ##随机选择一个订单获取信息
    ${数组下标}    Evaluate    int(${商品订单列表数量}-1)
    ${随机选择一个订单}    Evaluate    random.randint(1,${数组下标})    random
    ${获取订单内容}    Get From List    ${列表数据}    ${随机选择一个订单}
    log    ${获取订单内容}
    ##获取订单相关信息
    Comment    ${订单号}    Get From Dictionary    ${获取订单内容}    order_no
    Comment    ${微信昵称}    Get From Dictionary    ${获取订单内容}    user_name
    Comment    ${商品总金额}    Get From Dictionary    ${获取订单内容}    total_price
    Comment    ${应付金额}    Get From Dictionary    ${获取订单内容}    should_pay
    Comment    ${实付金额}    Get From Dictionary    ${获取订单内容}    payed
    Comment    ${订单状态}    Get From Dictionary    ${获取订单内容}    order_status
    Comment    ${订单类型}    Get From Dictionary    ${获取订单内容}    order_type
    Comment    ${支付时间}    Get From Dictionary    ${获取订单内容}    pay_time
    Comment    ${时间戳}    Get From Dictionary    ${获取订单内容}    created
    Comment    ${创建订单时间}    Get Time    \    ${时间戳}
    Comment    ${配送方式}    Get From Dictionary    ${获取订单内容}    pickup_type    ####pickup_type=1 \ 快递配送    pickup_type=2 到店自提
    Comment    ${提货码}    Get From Dictionary    ${获取订单内容}    pickup_code
    Comment    ########
    Comment    ${订单详情数据0}    Get From Dictionary    ${获取订单内容}    orderDetails
    Comment    ${订单详情数据}    Get From List    ${订单详情数据0}    0
    Comment    log    ${订单详情数据}
    Comment    ${订单详情id}    Get From Dictionary    ${订单详情数据}    id
    Comment    ${订单id号}    Get From Dictionary    ${订单详情数据}    order_id
    Comment    ${商品id号}    Get From Dictionary    ${订单详情数据}    product_id
    Comment    ${商品名称}    Get From Dictionary    ${订单详情数据}    product_name
    Comment    ${商品sku_id号}    Get From Dictionary    ${订单详情数据}    product_sku_id
    Comment    ${商品sku名称}    Get From Dictionary    ${订单详情数据}    product_sku_name
    Comment    ${商品金额}    Get From Dictionary    ${订单详情数据}    price
    Comment    ${商品数量}    Get From Dictionary    ${订单详情数据}    num
    ####用户信息
    Comment    ${用户详情}    Get From Dictionary    ${获取订单内容}    wxUserInfos
    Comment    ${用户id}    Get From Dictionary    ${用户详情}    id
    [Return]    ${返回码信息}

订单_详情
    [Arguments]    ${订单id}
    &{data}=    Create Dictionary    id=${订单id}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /order/get-order-detail-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${订单详情响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${订单详情响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${订单详情响应}    errmsg
    [Return]    ${返回码信息}

订单_创建普通订单
    ##获取创建订单请求参数
    ${商品信息}    商品_详情
    ${product}    Get From Dictionary    ${商品信息}    product
    ${productSkus数组}    Get From Dictionary    ${product}    productSkus
    ${productSkus}    Get From List    ${productSkus数组}    0
    ${商品ID}    Get From Dictionary    ${productSkus}    product_id
    ${商品sku_id}    Get From Dictionary    ${productSkus}    id
    ###在微信前端创建订单    pickup_type=1 快递配送    pickup_type=2 到店自提
    微信登录
    &{data}=    Create Dictionary    products[0][id]=286603    products[0][sku_id]=1167425    products[0][num]=1    pickup_type=1
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wx    /weishanghuzhushou/order/order-add-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${预期返回码}    Set Variable    0
    ${会员列表响应}    loads    ${resp.content}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    ${返回响应}    Get From Dictionary    ${会员列表响应}    errmsg
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    [Return]    ${返回响应}

订单_创建扫码订单
    [Arguments]    ${total_price}=10000
    ##获取创建订单请求参数
    ${终端店信息}    获取终端店信息
    ${data0}    Get From Dictionary    ${终端店信息}    data
    ${data}    Get From List    ${data0}    0
    ${id}    Get From Dictionary    ${data}    id
    微信登录
    &{data}=    Create Dictionary    total_price=${total_price}    shop_sub_id=${id}
    &{headers}=    Create Dictionary    Content-Type=application/json    charset=UTF-8
    ${resp}    Post Request    wx    /weishanghuzhushou/order/add-scan-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${预期返回码}    Set Variable    0
    ${会员列表响应}    loads    ${resp.content}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    ${返回响应}    Get From Dictionary    ${会员列表响应}    errmsg
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    [Return]    ${返回响应}

订单_货到付款订单
    [Arguments]    ${pay_type}=3
    #${pay_type}=3货到付款    #${pay_type}=5微信支付
    ${errmsg}    订单_创建普通订单
    ${orderDetail}    Get From Dictionary    ${errmsg}    orderDetail
    ${orderDetai0l}    Get From List    ${orderDetail}    0
    ${order_id}    Get From Dictionary    ${orderDetai0l}    order_id
    ${id}    Get From Dictionary    ${orderDetai0l}    id
    ${product_id}    Get From Dictionary    ${orderDetai0l}    product_id
    ${product_sku_id}    Get From Dictionary    ${orderDetai0l}    product_sku_id
    ${shop_sub_id}    Get From Dictionary    ${orderDetai0l}    shop_sub_id
    &{data}=    Create Dictionary    id=${order_id}    r_points=0    member_discount=1    customer_mark=${EMPTY}    orderPayInfo[0][pay_type]=${pay_type}
    ...    orderPayInfo[0][amount]=100    orderDetails[0][id]=${id}    orderDetails[0][order_id]=${order_id}    orderDetails[0][product_id]=${product_id}    orderDetails[0][product_sku_id]=${product_sku_id}    orderDetails[0][shop_sub_id]=${shop_sub_id}
    ...    orderDetails[0][num]=1
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wx    /weishanghuzhushou/order/pay-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${预期返回码}    Set Variable    0
    ${会员列表响应}    loads    ${resp.content}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    ${返回响应}    Get From Dictionary    ${会员列表响应}    errmsg
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    [Return]    ${返回响应}

订单_更新订单设置
    [Arguments]    ${订单自动关闭}=1    ${订单回收时间}=60    ${秒杀订单自动关闭}=2    ${发货自动确认}=2    ${收货自动评价}=2    # 各类订单自动处理机制，1为开启，2为关闭
    [Documentation]    状态说明：1为开启，2为关闭
    ...
    ...    {"id":2,"simple_order_close_unpay_time":60,"auto_receive_time":60,"sk_order_close_unpay_time":120,"order_comment_time":60,"simple_order_close_unpay_status":2,"auto_receive_status":2,"sk_order_close_unpay_status":1,"order_comment_status":2,"simple_order_close_unpay_time_type":1,"auto_receive_time_type":1,"sk_order_close_unpay_time_type":1,"order_comment_time_type":1}
    API登录
    &{headers}    Get_Headers
    ${jsonstr}    Convert To String    {"id":2,"simple_order_close_unpay_time":${订单回收时间},"auto_receive_time":60,"sk_order_close_unpay_time":120,"order_comment_time":60,"simple_order_close_unpay_status":${订单自动关闭},"auto_receive_status":${发货自动确认},"sk_order_close_unpay_status":${秒杀订单自动关闭},"order_comment_status":${收货自动评价},"simple_order_close_unpay_time_type":1,"auto_receive_time_type":1,"sk_order_close_unpay_time_type":1,"order_comment_time_type":1}
    ${resp}    Post Request    wsh    /shop/update-shop-order-auto-settings-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    ##
    [Return]    ${errmsg}

商品_列表
    API登录
    ${resp}    Post Request    wsh    /product/list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    [Return]    ${返回码信息}

商品_详情
    ##随机获取一个商品ID
    ${errmsg}    商品_列表
    ${列表数据}    Get From Dictionary    ${errmsg}    data
    ${商品列表数量}    Get Length    ${列表数据}
    ##随机选择一个商品
    ${数组下标}    Evaluate    int(${商品列表数量}-1)
    ${随机选择一个商品}    Evaluate    random.randint(1,${数组下标})    random
    ${获取商品内容}    Get From List    ${列表数据}    ${随机选择一个商品}
    log    ${获取商品内容}
    ##获取订单相关信息
    ${商品ID}    Get From Dictionary    ${获取商品内容}    id
    #商品详情
    &{data}=    Create Dictionary    id=${商品ID}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /product/product-detail-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品详情响应}    loads    ${str}
    ${预期返回码}    Set Variable    0
    ${返回码}    Get From Dictionary    ${商品详情响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品详情响应}    errmsg
    [Return]    ${返回码信息}

商品_添加商品
    [Arguments]    ${args}
    [Documentation]    {"productInfo":{"detail_pic":"504875,504865,","detail":"<p>YT的测试商品介绍。。。</p>"},"product":{"product_type":1,"name":"${产品名称}","sales":"${销量}","covers_id":504875,"quota":"3","sort":"0","sale_scope":"1","product_category_id":33694,"product_category_path":"/33691/33694/","status":2,"postage_fee_type":0,"product_kind_ids":"205477;","show_sale_num":2,"prod_weight":"200"},"shareMessage":{"desc":"优惠多多,欢迎选购","title":"YT测试商品0905","file_cdn_path":"http://imgcache.vikduo.com/static/89c357c48d8830326acfa5fb4b4cc3f7.png","pic_id":504875},"kindBody":[{"firstName":"50g","firstRowSpan":1,"firstShow":true,"id":"50g","status":false},{"firstName":"150g","firstRowSpan":1,"firstShow":true,"id":"150g","status":false}],"skus":[{"status":1,"reserves":${库存},"market_price":"80","retail_price":"${价格}","sku_no":"T000101","barcode":"${条件码1}","sales":0,"name":"YT测试商品0905","kind_value_ids":[846106],"kind_ids":[205477]},{"status":1,"reserves":300,"market_price":"120","retail_price":"99","sku_no":"T000102","barcode":"${条件码2}","sales":0,"name":"YT测试商品0905","kind_value_ids":[846108],"kind_ids":[205477]}]}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    ${args}
    ${resp}    Post Request    wsh    /product/add-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

-----4-----

获取终端店列表
    API登录
    ${resp}    Post Request    wsh    /terminal/list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    [Return]    ${返回码信息}

获取终端店信息
    [Arguments]    ${search_name}=星之直营店自动化测试专用
    API登录
    &{data}=    Create Dictionary    name=${search_name}    is_search=true
    &{headers}=    Create Dictionary    Content-Type=application/json    charset=UTF-8
    ${resp}    Post Request    wsh    /terminal/list-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    [Return]    ${返回码信息}

微信_获取二维码详情
    [Arguments]    ${shop_sub_id}=${EMPTY}    #
    API登录
    &{headers}    Get_Headers
    &{data}=    Create Dictionary    model=member_card    model_id=1    shop_sub_id=${shop_sub_id}
    ${resp}    Post Request    wsh    /weixin/qrcode-detail-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    ##
    [Return]    ${errmsg}

微信_获取二维码列表
    API登录
    &{headers}    Get_Headers
    &{data}=    Create Dictionary    _page=1    _page_size=20
    ${resp}    Post Request    wsh    /activity/qrcode-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    ##
    [Return]    ${errmsg}

商品_上架
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"ids":[${id}]}
    ${resp}    Post Request    wsh    /product/on-sale-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

商品_下架
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"ids":[${id}]}
    ${resp}    Post Request    wsh    /product/off-sale-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}

商品_删除商品
    [Arguments]    ${id}
    API登录
    &{headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${jsonstr}    Convert To String    {"ids":[${id}]}
    ${resp}    Post Request    wsh    /product/del-ajax    data=${jsonstr}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${js}    loads    ${str}
    ${errcode}    Get From Dictionary    ${js}    errcode
    ${errmsg}    Get From Dictionary    ${js}    errmsg
    Run Keyword If    ${errcode}!=0    Fail    接口返回异常！
    [Return]    ${errmsg}
