*** Settings ***
Suite Setup       登录
Suite Teardown    关闭浏览器
Test Teardown     失败重启
Library           Selenium2Library
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot
Library           AutoItLibrary

*** Test Cases ***
添加商品
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    #获取未添加商品前商品的总数
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    ${good_title}    Get Text    xpath=//form/div[1]/div[1]/div[2]/a
    ${good_title1}    Evaluate    int(${good_title}+1)
    log    ${good_title1}
    点击链接菜单    添加商品
    等待时间    1
    随机选择下拉框    //tbody/tr[1]/td[2]/div[1]/select
    等待时间    1
    随机选择下拉框    //tbody/tr[1]/td[2]/div[2]/select
    等待时间    1
    随机选择下拉框    //tbody/tr[1]/td[2]/div[3]/select
    等待时间    0.5
    Input Text    xpath=//input[@ng-model="product.name"]    自动化测试商品
    ${x}    Set Variable    9999999
    ${j}    Evaluate    random.randint(0,${x})    random
    Input Text    xpath=//input[@ng-model="product.sales"]    ${j}    #随机输入一个销售量（0-9999999）
    等待时间    0.5
    #添加图片广告
    Click Element    xpath=//div/a/label[@data-title="选择"]
    sleep    0.5
    ${count2}    Get Matching Xpath Count    xpath=//ul[@class="ul_pic clearfix"]/li    #获取当前页面图片数
    log    ${count2}
    sleep    1
    ${x}    Evaluate    random.randint(1,${count2})    random
    Wait Until Page Contains Element    xpath=//ul[@class="ul_pic clearfix"]/li[${x}]/a/img    10s
    Click Element    xpath=//ul[@class="ul_pic clearfix"]/li[1]/a/img    #选取第一张图片，随机选择图片，下面语句取消注释即可
    #Click Element    xpath=//ul[@class="ul_pic clearfix"]/li[${x}]/a/img    #随机选取一张图片
    sleep    1
    Click Element    id=submitImage    #确认选择的图片
    sleep    0.5
    随机选择下拉框    //tbody/tr[9]/td[2]/div/select    #随机选择一个库存规格
    sleep    1
    ${count3}    Get Matching Xpath Count    xpath=//tbody/tr[9]/td[2]/div/div[3]/div/ul/*
    log    ${count3}
    ${y}    Run Keyword If    ${count3}>0    Evaluate    random.randint(1,${count3})    random
    ...    ELSE    Evaluate    1
    #以下步骤是库存规则，选择的下拉规格中规格值为空，则新增一个规格值，然后输入规格参数，否则直接输入规格参数
    sleep    0.5
    Run Keyword If    ${count3}>0    商品规格    xpath=//table/tbody/tr[9]/td[2]/div/div[3]/div/ul/li[${y}]/input
    ...    ELSE    添加规格值    xpath=//div/a[@class="btn btn-xs btn-primary margin-left20"]/i
    sleep    0.5
    Click Element    //*[text()="下一步"]
    sleep    1
    Input Text    name=weigh    100    #产品重量
    Input Text    name=buy    0    #每人限购
    Input Text    name=sort    0    #排序
    Select Frame    id=ueditor_0    #商品详情
    sleep    0.5
    Input Text    xpath=//body    1、经典香草肉酱直条面8盒装，常温保存12个月，零添加，备餐精选 2、子初婴儿葫芦头棉签56只    #输入内容
    Unselect Frame
    sleep    0.3
    Click Element    //div/div[@ng-show="taba==2"]/a[2]
    sleep    0.5
    Confirm Action
    sleep    1
    #以下步骤预期结果校验
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    ${good_title2}    Get Text    xpath=//form/div[1]/div[1]/div[2]/a
    log    ${good_title2}
    Run Keyword If    '${good_title2}'=='${good_title1}'    log    列表中已正确添加一件商品，商品数量正确
    ...    ELSE    log    列表中未添加商品，商品数量未发生变化
    sleep    0.5
    搜索    自动化测试商品
    对比校验    xpath=//tbody/tr[1]/td[2]/div/span[@ng-bind="list.name"]    自动化测试商品    #商品名称校验
    对比校验    xpath=//tbody/tr[1]/td[4]/span[@ng-bind="list.reserves"]    100    #商品库存校验
    对比校验    xpath=//tbody/tr[1]/td[@ng-bind="list.sales"]    ${j}    #商品销量校验
    sleep    0.5
    #还原初始数据（删除添加的商品）
    Click Element    xpath=//tbody/tr[1]/td[8]/div/a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//div/button[@data-id="ok"]
    sleep    0.5
    Confirm Action
    sleep    2

修改商品
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    商品添加
    Input Text    xpath=//div/div[2]/input[@ng-model="searchName"]    自动化测试商品
    sleep    0.5
    Click Element    xpath=//td[@class="text-center"]/div/a[@title="修改"]
    sleep    1
    Input Text    name=name    自动化测试商品修改
    Input Text    name=sales    123
    Input Text    name=reserves    456
    sleep    0.5
    Click Element    //*[text()="下一步"]
    sleep    1
    Click Element    //div/div[@ng-show="taba==2"]/a[2]
    sleep    0.5
    Confirm Action
    sleep    1
    搜索    自动化测试商品修改
    对比校验    xpath=//tbody/tr[1]/td[2]/div/span[@ng-bind="list.name"]    自动化测试商品修改    #商品名称校验
    对比校验    xpath=//tbody/tr[1]/td[4]/span[@ng-bind="list.reserves"]    456    #商品库存校验
    对比校验    xpath=//tbody/tr[1]/td[@ng-bind="list.sales"]    123    #商品销量校验
    sleep    0.5
    #还原初始数据（删除添加的商品）
    商品删除    自动化测试商品

商品上架/下架
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    Wait Until Page Contains Element    xpath=//form/div[1]/div[2]/div[2]/a
    sleep    0.5
    ${onSaleCount}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #添加商品前上架中商品数
    ${offSaleCount}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #添加商品前下架中商品数
    商品添加
    ${onSaleCount1}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #添加商品后上架中商品数
    ${offSaleCount1}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #添加商品后下架中商品数
    ${goodoffsale_check}    Evaluate    int(${offSaleCount}+1)
    ${goodonsale_check}    Evaluate    int(${onSaleCount}+1)
    Run Keyword If    '${onSaleCount1}'=='${onSaleCount}'    LOG    商品添加成功，上架商品数量未发生变化
    ...    ELSE    LOG    商品添加成功后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount1}'=='${goodoffsale_check}'    LOG    商品添加成功，下架商品数量增加1.添加正确
    ...    ELSE    LOG    商品添加成功后，下架商品数量统计错误
    搜索    自动化测试商品
    Click Element    xpath=//tbody/tr[1]/td[7]/label/input    #点击一次，商品上架
    #检查数据库中，商品的状态值    暂时未作校验，后期补上
    sleep    0.5
    Confirm Action
    sleep    1
    ${onSaleCount2}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #点击商品上架按钮，统计上架商品数
    ${offSaleCount2}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #点击商品上架按钮，统计下架商品数
    Run Keyword If    '${onSaleCount2}'=='${goodonsale_check}'    LOG    商品上架成功，上架商品数量增加1，添加数量正确
    ...    ELSE    LOG    商品上架后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount2}'=='${offSaleCount}'    LOG    商品上架成功，下架商品数量减1.添加数量正确
    ...    ELSE    LOG    商品下架后，下架商品数量统计错误
    搜索    自动化测试商品
    sleep    0.5
    Click Element    xpath=//tbody/tr[1]/td[7]/label/input    #再次点击，商品下架
    #检查数据库中，商品的状态值    暂时未作校验，后期补上
    sleep    0.5
    Confirm Action
    sleep    1
    ${onSaleCount3}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #点击商品下架按钮，统计上架商品数
    ${offSaleCount3}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #点击商品下架按钮，统计下架商品数
    Run Keyword If    '${onSaleCount3}'=='${onSaleCount1}'    LOG    商品下架成功，上架商品数量减1，上架商品数量统计正确
    ...    ELSE    LOG    商品下架后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount3}'=='${offSaleCount1}'    LOG    商品下架成功，上架商品数量增加1，下架商品数量统计正确
    ...    ELSE    LOG    商品下架后，下架商品数量统计错误
    商品删除    自动化测试商品

商品批量上架/下架
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    sleep    1
    Wait Until Page Contains Element    xpath=//form/div[1]/div[1]/div[2]/div    40s    元素未加载成功
    ${onSaleCount}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #添加商品前上架中商品数
    ${offSaleCount}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #添加商品前下架中商品数    #Repeat Keyword    5 times    商品添加
    ...    # 自动化测试商品00001    自动化测试商品00002    自动化测试商品00003    自动化测试商品00004    # 自动化测试商品00005
    @{abc}    Create List    自动化测试商品00001    自动化测试商品00002    自动化测试商品00003    自动化测试商品00004    自动化测试商品00005
    : FOR    ${name}    IN    @{abc}
    \    商品添加    ${name}
    \    sleep    0.5
    sleep    1
    ${onSaleCount1}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #添加商品后上架中商品数
    ${offSaleCount1}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #添加商品后下架中商品数
    ${goodoffsale_check}    Evaluate    int(${offSaleCount}+5)
    ${goodonsale_check}    Evaluate    int(${onSaleCount}+5)
    Run Keyword If    '${onSaleCount1}'=='${onSaleCount}'    LOG    商品添加成功，上架商品数量未发生变化
    ...    ELSE    LOG    商品添加成功后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount1}'=='${goodoffsale_check}'    LOG    商品添加成功，下架商品数量增加1.添加正确
    ...    ELSE    LOG    商品添加成功后，下架商品数量统计错误
    搜索    自动化测试商品0000
    Click Element    xpath=//table/thead/tr/th[1]/label/input[@ng-click="chooseAll(choose)"]    #点击勾选所有
    sleep    0.5
    Click Element    xpath=//div/ul/li[2]/a[@data-toggle="dropdown"]    #定位批量操作下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="ulLength"]/li[1]/a    #批量上架
    sleep    1
    Confirm Action
    sleep    1
    ${onSaleCount2}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #点击商品上架按钮，统计上架商品数
    ${offSaleCount2}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #点击商品上架按钮，统计下架商品数
    Run Keyword If    '${onSaleCount2}'=='${goodonsale_check}'    LOG    商品上架成功，上架商品数量增加1，添加数量正确
    ...    ELSE    LOG    商品上架后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount2}'=='${offSaleCount}'    LOG    商品上架成功，下架商品数量减1.添加数量正确
    ...    ELSE    LOG    商品下架后，下架商品数量统计错误
    搜索    自动化测试商品0000
    Click Element    xpath=//table/thead/tr/th[1]/label/input[@ng-click="chooseAll(choose)"]    #点击勾选所有
    sleep    0.5
    Click Element    xpath=//div/ul/li[2]/a[@data-toggle="dropdown"]    #定位批量操作下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="ulLength"]/li[2]/a    #批量下架
    sleep    1
    Confirm Action
    sleep    1
    ${onSaleCount3}    Get Text    xpath=//form/div[1]/div[2]/div[2]/a    #点击商品下架按钮，统计上架商品数
    ${offSaleCount3}    Get Text    xpath=//form/div[1]/div[3]/div[2]/a    #点击商品下架按钮，统计下架商品数
    Run Keyword If    '${onSaleCount3}'=='${onSaleCount1}'    LOG    商品下架成功，上架商品数量减1，上架商品数量统计正确
    ...    ELSE    LOG    商品下架后，上架商品数量统计错误
    Run Keyword If    '${offSaleCount3}'=='${offSaleCount1}'    LOG    商品下架成功，上架商品数量增加1，下架商品数量统计正确
    ...    ELSE    LOG    商品下架后，下架商品数量统计错误
    : FOR    ${name1}    IN    @{abc}
    \    商品删除    ${name1}
    \    sleep    0.5
    sleep    1

商品批量修改分类
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    sleep    0.5
    @{abc}    Create List    自动化测试商品00001    自动化测试商品00002    自动化测试商品00003    自动化测试商品00004
    : FOR    ${name}    IN    @{abc}
    \    商品添加    ${name}
    \    sleep    0.5
    sleep    0.5
    搜索    自动化测试商品0000
    Click Element    xpath=//table/thead/tr/th[1]/label/input[@ng-click="chooseAll(choose)"]    #点击勾选所有
    sleep    0.5
    Click Element    xpath=//div/ul/li[2]/a[@data-toggle="dropdown"]    #定位批量操作下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="ulLength"]/li[3]/a    #批量分类
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[1]    #选择一级分类
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[1]/option[text()="系统分类"]
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[2]    #选择二级分类
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[2]/option[text()="运动户外"]
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[3]    #选择三级分类
    sleep    0.5
    Click Element    xpath=//form/div/div/div/div[2]/select[3]/option[text()="运动服"]
    sleep    0.5
    Click Element    xpath=//*[@id="myModal-fl"]/div/div/div[3]/a[2]    #点击确认按钮
    sleep    1
    Confirm Action
    sleep    0.5
    搜索    自动化测试商品0000
    : FOR    ${i}    IN RANGE    1    5
    \    对比校验    //table/tbody/tr[${i}]/td[3]    系统分类-运动户外-运动服
    \    sleep    0.5
    sleep    0.5
    : FOR    ${name1}    IN    @{abc}
    \    商品删除    ${name1}
    \    sleep    0.5
    sleep    1

商品批量删除
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品列表
    sleep    0.5
    @{abc}    Create List    自动化测试商品00001    自动化测试商品00002    自动化测试商品00003    自动化测试商品00004
    : FOR    ${name}    IN    @{abc}
    \    商品添加    ${name}
    \    sleep    0.5
    sleep    0.5
    搜索    自动化测试商品0000
    sleep    0.5
    Click Element    xpath=//table/thead/tr/th[1]/label/input[@ng-click="chooseAll(choose)"]    #点击勾选所有
    sleep    0.5
    Click Element    xpath=//div/ul/li[3]/a[@ng-click="deleteAll()"]    #点击批量删除
    sleep    1
    Click Button    xpath=//tbody/tr/td/div/button[@data-id="ok"]    #点击确认删除按钮
    sleep    1
    Confirm Action
    sleep    0.5

分页
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    #商品数分页测试
    点击链接菜单    商品列表
    sleep    0.5
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    #下面6-9步骤根据总数计算出页数
    #${good_num}    Get Text    xpath=//form/div[1]/div[1]/div[2]/a
    #${page_num}    Evaluate    ${good_num}/float(10)
    #${yyy}    Evaluate    int(math.ceil(${page_num}))    math
    #log    总页数为：${yyy}
    #下面步骤是判断分页栏是否存在
    ${exit}    Set Variable    ng-paginate ng-isolate-scope
    #${noexit}    Set Variable    ng-paginate ng-isolate-scope ng-hide
    ${attribute}    Get Element Attribute    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[5]@class    #获取分页栏的属性
    log    ${attribute}
    ${page1_num}    Get Matching Xpath Count    //tr[@class='ng-scope']
    Run Keyword If    '${attribute}'=='${exit}'    分页操作    xpath=//div[@page="page"]/ul[2]/li[3]/span/span    10
    ...    ELSE    LOG    无分页栏，只有1页数据，数据总数为：${page1_num}
    sleep    1
    #商品上架数分页测试
    Click Element    xpath=//form/div[1]/div[2]/div[2]/a    #点击上架数
    sleep    1
    ${attribute}    Get Element Attribute    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[5]@class    #获取分页栏的属性
    log    ${attribute}
    ${page1_num}    Get Matching Xpath Count    //tr[@class='ng-scope']
    Run Keyword If    '${attribute}'=='${exit}'    分页操作    xpath=//div[@page="page"]/ul[2]/li[3]/span/span    10
    ...    ELSE    LOG    无分页栏，只有1页数据，数据总数为：${page1_num}
    sleep    1
    #商品下架数分页测试
    Click Element    xpath=//form/div[1]/div[3]/div[2]/a    #点击下架数
    sleep    1
    ${attribute}    Get Element Attribute    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[5]@class    #获取分页栏的属性
    log    ${attribute}
    ${page1_num}    Get Matching Xpath Count    //tr[@class='ng-scope']
    Run Keyword If    '${attribute}'=='${exit}'    分页操作    xpath=//div[@page="page"]/ul[2]/li[3]/span/span    10
    ...    ELSE    LOG    无分页栏，只有1页数据，数据总数为：${page1_num}
    sleep    1

*** Keywords ***
商品规格
    [Arguments]    ${arg_path}    ${reserves}=100    ${market_price0}=100    ${retail_price0}=0.01    ${sku_no}=000001
    Sleep    1s
    ${z}    Evaluate    random.randint(10000,99999)    random    #随机选择一个条形码
    Click Element    ${arg_path}
    Sleep    0.5s
    Input Text    name=reserves    ${reserves}    #库存
    Input Text    name=market_price0    ${market_price0}    #原价
    Input Text    name=retail_price0    ${retail_price0}    #零售价
    Input Text    name=sku_no    ${sku_no}    #商家编码
    Sleep    0.5s
    Input Text    name=barcode    ${z}    #条形码
    Sleep    0.5s
    Click Element    name=status    #状态
    Sleep    0.5s

添加规格值
    [Arguments]    ${sta_path}    ${standard}=形状
    Click Element    ${sta_path}
    Sleep    0.5s
    Input Text    id=kindChildName    ${standard}
    Sleep    1s
    Click Element    xpath=//div[@class="modal-footer"]/a[text()="确定"]
    Sleep    0.5
    Confirm Action
    Sleep    1
    商品规格    xpath=//table/tbody/tr[9]/td[2]/div/div[3]/div/ul/li/input
    Sleep    0.5

搜索
    [Arguments]    ${good_name}
    Input Text    xpath=//div/input[@ng-model="searchName"]    ${good_name}
    sleep    0.3
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div/form/div[2]/div/div/div[2]/span/a/i
    sleep    1

商品添加
    [Arguments]    ${product_name}=自动化测试商品
    点击链接菜单    添加商品
    等待时间
    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select
    等待时间    0.5
    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select/option[text()="系统分类"]    #一级菜单为系统分类，二级菜单为汽车配件，三级菜单为汽车内饰
    等待时间    0.5
    Input Text    xpath=//input[@ng-model="product.name"]    ${product_name}    #商品名称
    Input Text    xpath=//input[@ng-model="product.sales"]    0    #随机输入一个销售量0
    等待时间    0.5
    #添加图片广告
    Click Element    xpath=//div/a/label[@data-title="选择"]
    sleep    1
    Wait Until Page Contains Element    xpath=//ul[@class="ul_pic clearfix"]/li[1]/a/img    10s
    Click Element    xpath=//ul[@class="ul_pic clearfix"]/li[1]/a/img    #选取一张图片
    sleep    1
    Click Element    id=submitImage    #确认选择的图片
    sleep    1
    Click Element    xpath=//tbody/tr[9]/td[2]/div/select
    sleep    0.5
    Click Element    xpath=//tbody/tr[9]/td[2]/div/select/option[text()="规格测试"]    #选择一个库存规格(规格测试)
    sleep    1
    商品规格    xpath=//table/tbody/tr[9]/td[2]/div/div[3]/div/ul/li[2]/input    #测试规格选择“测试2”
    sleep    0.5
    Click Element    //*[text()="下一步"]
    sleep    1
    Input Text    name=weigh    100    #产品重量
    Input Text    name=buy    0    #每人限购
    Input Text    name=sort    0    #排序
    Select Frame    id=ueditor_0    #商品详情界面（iframe）
    sleep    0.5
    Input Text    xpath=//body    test    #输入内容
    Unselect Frame
    sleep    0.3
    Click Element    xpath=//div/div[@ng-show="taba==2"]/a[2]
    sleep    1
    Confirm Action
    sleep    1

商品删除
    [Arguments]    ${goodsname}
    搜索    ${goodsname}
    Click Element    xpath=//tbody/tr[1]/td[8]/div/a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//div/button[@data-id="ok"]
    sleep    1
    Confirm Action
    sleep    1
