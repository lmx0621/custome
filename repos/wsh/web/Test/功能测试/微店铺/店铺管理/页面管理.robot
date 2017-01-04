*** Settings ***
Suite Setup       登录
Suite Teardown    关闭浏览器
Test Setup
Test Teardown
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot
Library           Selenium2Library

*** Test Cases ***
首页
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    页面管理
    page should contain link    新建页面
    page should contain link    设为店铺主页
    page should contain link    设为官网主页
    #主页
    对比校验    xpath=//div[@class="row"]/div[1]/div/div/strong    店铺主页：
    对比校验    xpath=//div[@class="row"]/div[2]/div/div/strong    官网主页：
    #页面数据列表
    对比校验    xpath=//table/thead/tr/th[2]    页面标题
    对比校验    xpath=//table/thead/tr/th[3]    分类
    对比校验    xpath=//table/thead/tr/th[4]    商品数量
    对比校验    xpath=//table/thead/tr/th[5]    排序
    对比校验    xpath=//table/thead/tr/th[6]    创建时间
    对比校验    xpath=//table/thead/tr/th[7]    发布
    对比校验    xpath=//table/thead/tr/th[8]    操作
    等待时间    0.5
    #搜索
    Page Should Contain Element    xpath=//div[@class="inline align-top"]/select
    Page Should Contain Element    xpath=//*[@id="title"]
    Page Should Contain Element    xpath=//span[@class="float-left"]/a/i
    等待时间    1.5

新建页面_空模板(富文本)
    [Setup]    点击链接菜单    微店铺
    #点击链接菜单    页面管理
    点击链接菜单    新建页面
    #${count}    Get Matching Xpath Count    xpath=//li[@class='mode-item']    #获取页面模板数
    #log    ${count}
    #${i}    Evaluate    random.randint(1,${count})    random
    sleep    0.3
    #Click Element    xpath=//ul[@class="template-list clearfix"]/li[${i}]/a    #随机选取一个模板
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（富文本）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加富文本）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}
    sleep    0.5
    #添加富文本
    Click Element    xpath=//a[text()="富文本"]
    sleep    0.5
    随机获取背景颜色
    sleep    0.5
    Select Frame    id=ueditor_0
    sleep    0.5
    Input Text    xpath=//body    Hello World    #输入内容
    sleep    0.5
    Unselect Frame
    Click Element    xpath=//button[text()="保存"]    #点击保存
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（富文本）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（富文本）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1

新建页面_空模板(商品)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.3
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（商品）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加商品）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加商品
    Click Element    xpath=//a[text()="商品"]
    sleep    0.5
    Click Element    xpath=//div/span[@class="icon-plus-circle add-btn success"]
    sleep    0.5
    ${count2}    Get Matching Xpath Count    xpath=//tbody/tr[@class="ng-scope"]    #获取当前页面的商品数
    log    ${count2}
    sleep    0.5
    ${x}    Evaluate    random.randint(1,${count2})    random
    Click Element    xpath=//tr[${x}]/td[4]/button/span
    sleep    0.5
    Click Element    xpath=//button[text()="保存"]    #保存选择的商品
    sleep    1
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（商品）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（商品）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1

新建页面_空模板(商品搜索)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（商品搜索）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加商品搜索）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加商品搜索
    Click Element    xpath=//a[text()="商品搜索"]
    sleep    0.5
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（商品搜索）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（商品搜索）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

新建页面_空模板(进入店铺)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（进入店铺）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    1
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加进入店铺）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加进入店铺
    Click Element    xpath=//a[text()="进入店铺"]
    sleep    0.5
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（进入店铺）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（进入店铺）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

新建页面_空模板(公告)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（公告）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加公告）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加公告
    Click Element    xpath=//a[text()="公告"]
    sleep    0.5
    Input Text    //div/input[@ng-model="contentText"]    对施工区域进行地面砸刨、填补、磨平的工程，期间有噪音及粉尘的影响，二次刷漆的工程，期间会有刺鼻气味。    #页面标题
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（公告）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（公告）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

新建页面_空模板(图片广告)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（图片广告）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加图片广告）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加图片广告
    Click Element    xpath=//a[text()="图片广告"]
    sleep    0.5
    Click Element    xpath=//div[@ng-click="addAds()"]    #点击"添加一个广告"
    sleep    0.5
    ${count2}    Get Matching Xpath Count    xpath=//ul[@class="ul_pic clearfix"]/li    #获取当前页面图片数
    log    ${count2}
    sleep    0.5
    ${x}    Evaluate    random.randint(1,${count2})    random
    Click Element    xpath=//ul[@class="ul_pic clearfix"]/li[${x}]/a/img    #随机选取一张图片
    sleep    0.5
    Click Element    id=submitImage
    sleep    0.5
    Input Text    xpath=//div/input[@name="text0"]    这是一个图片广告    #输入广告内容
    sleep    0.5
    Click Element    xpath=//span[text()="设置页面链接地址"]
    sleep    0.5
    ${count3}    Get Matching Xpath Count    xpath=//ul[@class="dropdown-menu dropdown-light"]/li    #获取连接地址数
    log    ${count3}
    sleep    0.5
    ${y}    Evaluate    random.randint(1,${count3})    random
    Click Element    xpath=//ul[@class="dropdown-menu dropdown-light"]/li[${y}]/a    #随机选取一个链接地址
    sleep    0.5
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.5
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（图片广告）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（图片广告）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

新建页面_空模板(文本导航)
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（文本导航）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加文本导航）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加文本导航
    Click Element    xpath=//a[text()="文本导航"]
    sleep    0.5
    Click Element    xpath=//div[@ng-click="addNav(undefined,$event)"]    #点击"添加一个文本导航"
    sleep    0.5
    Input Text    xpath=//div/input[@name="text0"]    这是一个文本导航    #输入文本导航内容
    sleep    0.5
    Click Element    xpath=//span[text()="设置页面链接地址"]
    sleep    0.5
    ${count3}    Get Matching Xpath Count    xpath=//ul[@class="dropdown-menu dropdown-light"]/li    #获取连接地址数
    log    ${count3}
    sleep    0.5
    ${y}    Evaluate    random.randint(1,${count3})    random
    Click Element    xpath=//ul[@class="dropdown-menu dropdown-light"]/li[${y}]/a    #随机选取一个链接地址
    sleep    0.5
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.8
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（文本导航）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（文本导航）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

新建页面_空模板(图片导航)
    [Tags]    fail
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    新建页面
    sleep    0.5
    Click Element    xpath=//ul[@class="template-list clearfix"]/li[1]/a    #选取空模板
    sleep    0.3
    Input Text    xpath=//ng-form/div[2]/div/input    店铺首页（图片导航）    #页面标题
    sleep    0.5
    ${count1}    Get Matching Xpath Count    xpath=//select/option[@ng-bind="category.name"]    #获取分类数
    log    ${count1}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count1})    random
    Click Element    xpath=//select/option[${j}]    #随机选取一个分类
    #sleep    0.3
    ${sort}    Get Text    xpath=//select/option[${j}]    #获取分类的名称
    log    ${sort}
    sleep    0.3
    随机获取背景颜色
    sleep    0.5
    Input Text    xpath=//ng-form/div[5]/div/input    测试店铺首页（仅添加图片导航）
    sleep    0.5
    ${l}    Evaluate    random.randint(1,999)    random
    Input Text    xpath=//ng-form/div[6]/div/input    ${l}    #随机输入一个排序
    sleep    0.5
    #添加图片导航
    Click Element    xpath=//a[text()="图片导航"]
    sleep    0.5
    ${count2}    Get Matching Xpath Count    xpath=//ng-form[@name="myform"]/div    #获取图片导航个数
    : FOR    ${i}    IN RANGE    1    ${count2}
    \    图片导航    ${i}
    \    sleep    1
    sleep    0.5
    Click Element    xpath=//*[@id="modal-footer"]/button[2]    #点击保存，保存页面
    sleep    0.8
    Confirm Action
    sleep    0.5
    点击链接菜单    页面管理
    sleep    0.5
    #校验数据
    Input Text    xpath=//*[@id="title"]    店铺首页（图片导航）    #搜索新建的数据，全匹配搜索
    Click Element    xpath=//a[@class='btn btn-xs btn-primary']/i
    sleep    0.5
    对比校验    xpath=//tr[@class="ng-scope"]/td[2]    店铺首页（图片导航）    #获取标题
    对比校验    xpath=//tr[@class="ng-scope"]/td[3]    ${sort}    #获取分类
    对比校验    xpath=//tr[@class="ng-scope"]/td[5]    ${l}    #获取排序
    sleep    1
    #还原数据    删除新建的页面
    Click Element    xpath=//a[@title="删除"]
    sleep    0.5
    Click Element    xpath=//button[text()="确定"]    #确认删除
    sleep    0.5
    Confirm Action
    sleep    0.5

*** Keywords ***
图片导航
    [Arguments]    ${m}=1
    Click Element    xpath=//ng-form/div[${m}]/div/div[1]/i
    sleep    1
    ${count2}    Get Matching Xpath Count    xpath=//ul[@class="ul_pic clearfix"]/li    #获取当前页面图片数
    log    ${count2}
    sleep    1
    ${x}    Evaluate    random.randint(1,${count2})    random
    Click Element    xpath=//ul[@class="ul_pic clearfix"]/li[${x}]/a/img    #随机选取一张图片
    sleep    1
    Click Element    id=submitImage
    sleep    1
    Input Text    xpath=//ng-form/div[${m}]//input[@ng-change="checkText(image)"]    这是一个图片广告    #输入广告内容
    sleep    1
    Click Element    xpath=//ng-form/div[${m}]/div//span[text()="设置页面链接地址"]
    sleep    1
    ${count3}    Get Matching Xpath Count    xpath=//ng-form/div[${m}]//ul[@class="dropdown-menu dropdown-light"]/li    #获取连接地址数
    log    ${count3}
    sleep    1
    ${y}    Evaluate    random.randint(1,${count3})    random
    Click Element    xpath=//ng-form/div[${m}]//ul[@class="dropdown-menu dropdown-light"]/li[${y}]/a    #随机选取一个链接地址
    sleep    1
