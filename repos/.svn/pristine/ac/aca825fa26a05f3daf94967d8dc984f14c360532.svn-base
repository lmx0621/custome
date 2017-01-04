*** Settings ***
Suite Setup       API登录
Library           RequestsLibrary
Resource          Lib/通用操作.robot
Library           json
Library           Collections
Library           String
Resource          Lib/配置参数.robot
Resource          ../Resource/常用操作.robot

*** Test Cases ***
获取会员列表
    [Tags]    ready
    ${resp}    Post Request    wsh    /members/list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${会员列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${会员列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${会员列表数量}    Get Length    ${列表数据}
    ${随机选择一个会员}    Evaluate    random.randint(1,${会员列表数量})    random
    ${获取会员内容}    Get From List    ${列表数据}    ${随机选择一个会员}
    ${获取微信内容信息}    Get From Dictionary    ${获取会员内容}    wxUserInfos
    ${获取用户ID}    Get From Dictionary    ${获取微信内容信息}    id
    log    ${获取用户ID}

创建普通订单
    [Tags]
    创建普通订单

获取商品列表
    [Tags]    ready
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
    ${商品列表数量}    Get Length    ${列表数据}
    ${随机选择一个商品}    Evaluate    random.randint(1,${商品列表数量})    random
    ${获取商品内容}    Get From List    ${列表数据}    ${随机选择一个商品}
    ${获取产品SKU数组}    Get From Dictionary    ${获取商品内容}    productSkus
    ${获取产品SKU}    Get From List    ${获取产品SKU数组}    0
    ${获取商品ID}    Get From Dictionary    ${获取产品SKU}    product_id
    log    ${获取商品ID}
    ${获取商品sku_id}    Get From Dictionary    ${获取产品SKU}    id
    log    ${获取商品sku_id}

商品详情
    [Tags]    ready
    ${获取产品SKU}    获取商品信息
    ${获取商品ID}    Get From Dictionary    ${获取产品SKU}    product_id
    &{data}=    Create Dictionary    id=${获取商品ID}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /product/product-detail-ajax    data=${data}    headers=${headers}
    ${str}    Get Substring    ${resp.content}    3
    ${商品列表响应}    loads    ${str}
    ${预期返回码}    Set Variable    0
    ${返回码}    Get From Dictionary    ${商品列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品列表响应}    errmsg
    ${商品数据}    Get From Dictionary    ${返回码信息}    product
    ${获取产品SKU数组}    Get From Dictionary    ${商品数据}    productSkus
    ${获取产品SKU}    Get From List    ${获取产品SKU数组}    0
    log    ${获取产品SKU}

商品规格列表
    [Tags]    ready
    ${resp}    Post Request    wsh    /product/kind-list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品规格列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品规格列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品规格列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${规格列表数量}    Get Length    ${列表数据}
    ${随机选择一个规格}    Evaluate    random.randint(1,${规格列表数量})    random
    ${获取规格内容}    Get From List    ${列表数据}    ${随机选择一个规格}
    ${获取商品规格ID}    Get From Dictionary    ${获取规格内容}    id
    ${获取商品规格名称}    Get From Dictionary    ${获取规格内容}    name
    log    ${获取规格内容}

添加商品规格
    [Tags]    ready
    ${规格名称}    随机字符    【规格】
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    &{data}=    Create Dictionary    name=${规格名称}
    ${resp}    Post Request    wsh    /product/kind-add-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品规格响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品规格响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品规格响应}    errmsg
    log    ${返回码信息}
    ${商品规格ID}    Get From Dictionary    ${返回码信息}    id

添加商品规格值
    [Tags]    ready
    #####添加商品规格
    ${规格名称}    随机字符    【规格】
    ${测试规格值}    随机字符    【测试规格值】
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    &{data}=    Create Dictionary    name=${规格名称}
    ${resp}    Post Request    wsh    /product/kind-add-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品规格响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品规格响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品规格响应}    errmsg
    log    ${返回码信息}
    ${商品规格ID}    Get From Dictionary    ${返回码信息}    id
    #####添加商品规格值
    &{data}=    Create Dictionary    name=${测试规格值}    product_kind_id=${商品规格ID}
    ${resp}    Post Request    wsh    /product/kind-value-add-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品规格值响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品规格值响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${规格值返回码信息}    Get From Dictionary    ${商品规格值响应}    errmsg
    log    ${规格值返回码信息}

获取商品分类列表
    [Tags]    ready
    &{data}=    Create Dictionary    shop_id=${shop_id}
    ${resp}    Post Request    wsh    /product/category-list-ajax    data=${data}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品分类列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品分类列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品分类列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${分类列表数量}    Get Length    ${列表数据}
    ${随机选择一个分类}    Evaluate    random.randint(1,${分类列表数量})    random
    ${获取分类内容}    Get From List    ${列表数据}    ${随机选择一个分类}
    ${获取商品分类ID}    Get From Dictionary    ${获取分类内容}    id
    ${获取商品分类名称}    Get From Dictionary    ${获取分类内容}    name
    ${获取商品分类等级}    Get From Dictionary    ${获取分类内容}    level
    ${获取商品分类排序}    Get From Dictionary    ${获取分类内容}    sort
    ${获取商品分类描述}    Get From Dictionary    ${获取分类内容}    desc
    ${获取商品分类是否显示}    Get From Dictionary    ${获取分类内容}    deleted    #1显示 2不显示
    log    ${获取分类内容}

添加商品一级分类
    [Tags]    ready
    ${分类名称}    随机字符    【商品分类】
    ${分类描述}    随机字符    【描述商品分类】
    ${排序}    Evaluate    0
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    &{data}=    Create Dictionary    name=${分类名称}    desc=${分类描述}    sort=${排序}
    ${resp}    Post Request    wsh    /product/category-add-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品分类列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品分类列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品分类列表响应}    errmsg
    log    ${返回码信息}

添加商品二级分类
    [Tags]    ready
    &{data}=    Create Dictionary    shop_id=${shop_id}
    ${resp}    Post Request    wsh    /product/category-list-ajax    data=${data}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品分类列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品分类列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品分类列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${分类列表数量}    Get Length    ${列表数据}
    ${数组下标}    Evaluate    int(${分类列表数量}-1)
    ${随机选择一个分类}    Evaluate    random.randint(0,${数组下标})    random
    ${获取分类内容}    Get From List    ${列表数据}    ${随机选择一个分类}
    ${获取商品一级分类ID}    Get From Dictionary    ${获取分类内容}    id
    ${获取商品一级分类名称}    Get From Dictionary    ${获取分类内容}    name
    #####添加二级分类
    ${分类名称}    随机字符    【商品分类】
    ${分类描述}    随机字符    【描述商品分类】
    ${排序}    Evaluate    0
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    &{data}=    Create Dictionary    name=${分类名称}    desc=${分类描述}    sort=${排序}    pid=${获取商品一级分类ID}
    ${resp}    Post Request    wsh    /product/category-add-ajax    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品分类列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品分类列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品分类列表响应}    errmsg
    log    ${返回码信息}

商品评论列表
    [Tags]    ready
    ${resp}    Post Request    wsh    /product/comment-list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${商品评论列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${商品评论列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${商品评论列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${商品评论列表数量}    Get Length    ${列表数据}
    ##随机选择一个评论获取信息
    ${数组下标}    Evaluate    int(${商品评论列表数量}-1)
    ${随机选择一个评论}    Evaluate    random.randint(1,${数组下标})    random
    ${获取评论内容}    Get From List    ${列表数据}    ${随机选择一个评论}
    log    ${获取评论内容}
    ##获取评论相关信息
    ${获取商品评论内容}    Get From Dictionary    ${获取评论内容}    content
    ${获取商品评论星数}    Get From Dictionary    ${获取评论内容}    star
    ${时间戳}    Get From Dictionary    ${获取评论内容}    created
    ${发表时间}    Get Time    \    ${时间戳}
    ##获取商品相关信息
    ${获取商品信息}    Get From Dictionary    ${获取评论内容}    product
    ${获取商品id}    Get From Dictionary    ${获取商品信息}    id
    ${获取商品名称}    Get From Dictionary    ${获取商品信息}    name
    ##获取用户相关信息
    ${获取用户信息}    Get From Dictionary    ${获取评论内容}    wxUserInfos
    ${获取用户ID}    Get From Dictionary    ${获取用户信息}    id
    ${获取用户号码}    Get From Dictionary    ${获取用户信息}    mobile
    ${获取用户昵称}    Get From Dictionary    ${获取用户信息}    nickname

商品订单列表
    [Tags]    ready
    #####_status=0全部订单    _status=1待付款订单    _status=2待发货订单    _status=3待收货订单    _status=4已完成订单    _status=5售后订单    _status=6已关闭订单
    # 默认全部订单
    &{headers}=    Create Dictionary    Content-Type=application/json;charset=UTF-8
    &{data}=    Create Dictionary    _status=0    after_sales_status=2
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
    ${订单号}    Get From Dictionary    ${获取订单内容}    order_no
    ${微信昵称}    Get From Dictionary    ${获取订单内容}    user_name
    ${商品总金额}    Get From Dictionary    ${获取订单内容}    total_price
    ${应付金额}    Get From Dictionary    ${获取订单内容}    should_pay
    ${实付金额}    Get From Dictionary    ${获取订单内容}    payed
    ${订单状态}    Get From Dictionary    ${获取订单内容}    order_status
    ${订单类型}    Get From Dictionary    ${获取订单内容}    order_type
    ${支付时间}    Get From Dictionary    ${获取订单内容}    pay_time
    ${时间戳}    Get From Dictionary    ${获取订单内容}    created
    ${创建订单时间}    Get Time    \    ${时间戳}
    ${配送方式}    Get From Dictionary    ${获取订单内容}    pickup_type    ####pickup_type=1 \ 快递配送    pickup_type=2 到店自提
    ########
    ${订单详情数据0}    Get From Dictionary    ${获取订单内容}    orderDetails
    ${订单详情数据}    Get From List    ${订单详情数据0}    0
    log    ${订单详情数据}
    ${订单详情id}    Get From Dictionary    ${订单详情数据}    id
    ${订单id号}    Get From Dictionary    ${订单详情数据}    order_id
    ${商品id号}    Get From Dictionary    ${订单详情数据}    product_id
    ${商品名称}    Get From Dictionary    ${订单详情数据}    product_name
    ${商品sku_id号}    Get From Dictionary    ${订单详情数据}    product_sku_id
    ${商品sku名称}    Get From Dictionary    ${订单详情数据}    product_sku_name
    ${商品金额}    Get From Dictionary    ${订单详情数据}    price
    ${商品数量}    Get From Dictionary    ${订单详情数据}    num
    #${时间戳}    Get From Dictionary    ${订单详情数据}    created
    #${创建订单时间}    Get Time    ${时间戳}

已完成订单收货
    [Tags]    ready
    ####    pickup_type=1 快递配送    pickup_type=2 到店自提
    ${用户id}    ${提货码}    ${订单id号}    ${配送方式}    订单详情    3
    Run Keyword If    ${配送方式}==1    收货（快递配送）    ${用户id}    ${订单id号}
    ...    ELSE    收货（到店自提）    ${订单id号}    ${提货码}

*** Keywords ***
获取微信用户ID
    微信登录
    ${resp}    Post Request    wsh    /members/list-ajax
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${会员列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    ${返回码信息}    Get From Dictionary    ${会员列表响应}    errmsg
    ${列表数据}    Get From Dictionary    ${返回码信息}    data
    ${会员列表数量}    Get Length    ${列表数据}
    ${随机选择一个会员}    Evaluate    random.randint(1,${会员列表数量})    random
    ${获取会员内容}    Get From List    ${列表数据}    ${随机选择一个会员}
    ${获取微信内容信息}    Get From Dictionary    ${获取会员内容}    wxUserInfos
    ${获取用户ID}    Get From Dictionary    ${获取微信内容信息}    id
    log    ${获取用户ID}
    [Return]    ${获取用户ID}

微信登录
    [Arguments]    ${微信用户ID}=13723226
    #${用户ID}    获取微信用户ID
    Create Session    wsh1    ${URL_TEST_WX}
    #&{data}=    Create Dictionary    ${微信用户ID}
    &{headers}=    Create Dictionary    Content-Type=text/html    charset=UTF-8
    ${resp}    Post Request    wsh1    /weishanghuzhushou/oauth/testing?id=${微信用户ID}    headers=${headers}

创建普通订单
    微信登录
    #############
    &{data}=    Create Dictionary    products[0][id]=265190    products[0][sku_id]=1098428    products[0][num]=1    pickup_type=1    #shop_id=97320
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /weishanghuzhushou/order/order-add-ajax    data=${data}    headers=${headers}
    Log    Response:${resp.content}

获取商品信息
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
    ${商品列表数量}    Get Length    ${列表数据}
    ${随机选择一个商品}    Evaluate    random.randint(1,${商品列表数量})    random
    ${获取商品内容}    Get From List    ${列表数据}    ${随机选择一个商品}
    ${获取产品SKU数组}    Get From Dictionary    ${获取商品内容}    productSkus
    ${获取产品SKU}    Get From List    ${获取产品SKU数组}    0
    LOG    ${获取产品SKU}
    [Return]    ${获取产品SKU}

订单详情
    [Arguments]    ${订单状态}=0    #####${订单状态}=0全部订单    ${订单状态}=1待付款订单    ${订单状态}=2待发货订单    ${订单状态}=3待收货订单    ${订单状态}=4已完成订单
    ...    # ${订单状态}=5售后订单    ${订单状态}=6已关闭订单    # 默认全部订单
    #####获取待收货订单信息
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
    ${订单号}    Get From Dictionary    ${获取订单内容}    order_no
    ${微信昵称}    Get From Dictionary    ${获取订单内容}    user_name
    ${商品总金额}    Get From Dictionary    ${获取订单内容}    total_price
    ${应付金额}    Get From Dictionary    ${获取订单内容}    should_pay
    ${实付金额}    Get From Dictionary    ${获取订单内容}    payed
    ${订单状态}    Get From Dictionary    ${获取订单内容}    order_status
    ${订单类型}    Get From Dictionary    ${获取订单内容}    order_type
    ${支付时间}    Get From Dictionary    ${获取订单内容}    pay_time
    ${时间戳}    Get From Dictionary    ${获取订单内容}    created
    ${创建订单时间}    Get Time    \    ${时间戳}
    ${配送方式}    Get From Dictionary    ${获取订单内容}    pickup_type    ####pickup_type=1 \ 快递配送    pickup_type=2 到店自提
    ${提货码}    Get From Dictionary    ${获取订单内容}    pickup_code
    ########
    ${订单详情数据0}    Get From Dictionary    ${获取订单内容}    orderDetails
    ${订单详情数据}    Get From List    ${订单详情数据0}    0
    log    ${订单详情数据}
    ${订单详情id}    Get From Dictionary    ${订单详情数据}    id
    ${订单id号}    Get From Dictionary    ${订单详情数据}    order_id
    ${商品id号}    Get From Dictionary    ${订单详情数据}    product_id
    ${商品名称}    Get From Dictionary    ${订单详情数据}    product_name
    ${商品sku_id号}    Get From Dictionary    ${订单详情数据}    product_sku_id
    ${商品sku名称}    Get From Dictionary    ${订单详情数据}    product_sku_name
    ${商品金额}    Get From Dictionary    ${订单详情数据}    price
    ${商品数量}    Get From Dictionary    ${订单详情数据}    num
    ####用户信息
    ${用户详情}    Get From Dictionary    ${获取订单内容}    wxUserInfos
    ${用户id}    Get From Dictionary    ${用户详情}    id
    [Return]    ${用户id}    ${提货码}    ${订单id号}    ${配送方式}

收货（快递配送）
    [Arguments]    ${用户id}    ${订单id号}
    微信登录    ${用户id}
    &{data1}=    Create Dictionary    order_id=${订单id号}
    &{headers1}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh1    /weishanghuzhushou/order/take-over-ajax    data=${data1}    headers=${headers1}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${会员列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    LOG    收货成功

收货（到店自提）
    [Arguments]    ${订单ID}    ${提货码}
    &{data}=    Create Dictionary    id=${订单ID}    pickup_code=${提货码}
    &{headers}=    Create Dictionary    Content-Type=application/json    charset=UTF-8
    ${resp}    Post Request    wsh    /order/staff-confirm-receipt    data=${data}    headers=${headers}
    ${预期返回码}    Set Variable    0
    Log    Response:${resp.content}
    ${str}    Get Substring    ${resp.content}    3
    ${会员列表响应}    loads    ${str}
    ${返回码}    Get From Dictionary    ${会员列表响应}    errcode
    Log    errcode is:${返回码}
    Should Be Equal As Strings    ${返回码}    ${预期返回码}
    LOG    收货成功
