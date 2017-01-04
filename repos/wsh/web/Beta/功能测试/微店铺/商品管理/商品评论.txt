*** Settings ***
Documentation     商品分类无分页
Suite Setup       登录
Suite Teardown    关闭浏览器
Test Teardown     失败重启
Library           Selenium2Library
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot
Library           AutoItLibrary

*** Test Cases ***
添加一条评论
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${评论总数}    获取评论数    #新增评论前获取评论数
    ${评论总数加1}    Evaluate    int(${评论总数}+1)
    ${评论用户}    Set Variable    ${EMPTY}
    ${评论类型}    Set Variable    灌水评论
    Click Button    xpath=//div/div/button[@type="button" and @ng-click="addcom()"]    #点击“添加一条评论”按钮
    Wait Until Page Contains Element    //h4[text()="添加评论"]
    sleep    1
    选择图片    //*[@id="addcomments"]/div/div/div[2]/div/div/form/div[2]/div/div[2]/label
    click element    xpath=//div[@class="col-sm-10"]/a[text()=" 选择商品 "]    #选择商品
    Wait Until Page Contains Element    //h4[text()="选择商品"]
    ${获取商品名称}    选择商品
    ${随机评星}    Evaluate    random.randint(1,5)    random
    ${评论星数}=    Run Keyword If    ${随机评星}==1    Set Variable    ★
    ...    ELSE IF    ${随机评星}==2    Set Variable    ★★
    ...    ELSE IF    ${随机评星}==3    Set Variable    ★★★
    ...    ELSE IF    ${随机评星}==4    Set Variable    ★★★★
    ...    ELSE    Set Variable    ★★★★★
    Click Element    xpath=//form/div[4]/div/select
    sleep    0.5
    Click Element    xpath=//form/div[4]/div/select/option[${随机评星}]
    Click Element    id=end_time
    Select Frame    xpath=/html/body/div[9]/iframe
    Click Element    id=dpOkInput
    Unselect Frame
    sleep    0.5
    ${发表时间}    Get Value    id=end_time
    ${评论内容}    随机字符    测试
    Input Text    xpath=//div/textarea[@name="text"]    ${评论内容}
    sleep    0.5
    Click Element    xpath=//*[@id="addcomments"]/div/div/div[3]/button[2]    #点击确定按钮
    sleep    1
    ###校验
    字段校验    //tbody/tr[1]/td[1]    ${获取商品名称}    ###商品名
    字段校验    //tbody/tr[1]/td[2]/pre    ${评论内容}    ###内容
    字段校验    //tbody/tr[1]/td[3]    ${评论星数}    ###评分
    字段校验    //tbody/tr[1]/td[4]    ${评论类型}    ###评论类型
    字段校验    //tbody/tr[1]/td[5]    ${评论用户}    ###评论用户
    #字段校验    //tbody/tr[1]/td[6]    ${发表时间}    ###发表时间
    ${评论总数1}    获取评论数    #新增评论后获取评论数
    Should Be Equal As Strings    ${评论总数加1}    ${评论总数1}
    ###还原数据
    Click Element    xpath=//tbody/tr[1]/td[8]/div/a[@title="删除"]    #点击删除
    sleep    0.5
    Click Element    xpath=//tbody/tr[3]/td/div[2]/button[1]    #点击确定按钮
    弹出窗信息校验    删除成功
    ${评论总数2}    获取评论数    #新增评论后获取评论数
    Should Be Equal As Strings    ${评论总数2}    ${评论总数}

商品名称搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${搜索内容}    Set Variable    测试
    ${单页评论数上限}    Set Variable    20
    ${搜索类型}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    Input Text    xpath=//div[@class="float-right"]/div[2]/input    ${搜索内容}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${评论总数}    获取评论数
    Run Keyword If    ${评论总数}<${单页评论数上限}    单页校验    ${搜索内容}    ${搜索类型}
    ...    ELSE    多页校验    ${评论总数}    ${搜索内容}    ${搜索类型}

商品评论搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${搜索内容}    Set Variable    东西
    ${单页评论数上限}    Set Variable    20
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[2]
    sleep    0.5
    ${搜索类型}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    Input Text    xpath=//div[@class="float-right"]/div[2]/input    ${搜索内容}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${评论总数}    获取评论数
    Run Keyword If    ${评论总数}<${单页评论数上限}    单页校验    ${搜索内容}    ${搜索类型}
    ...    ELSE    多页校验    ${评论总数}    ${搜索内容}    ${搜索类型}

用户评论类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${搜索内容}    Set Variable    用户评论
    ${单页评论数上限}    Set Variable    20
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select/option[2]    #用户评论
    sleep    0.5
    ${搜索类型}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    #nput Text    xpath=//div[@class="float-right"]/div[2]/input    ${searchname}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${评论总数}    获取评论数
    Run Keyword If    ${评论总数}<${单页评论数上限}    单页校验    ${搜索内容}    ${搜索类型}
    ...    ELSE    多页校验    ${评论总数}    ${搜索内容}    ${搜索类型}

灌水评论类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${搜索内容}    Set Variable    灌水评论
    ${单页评论数上限}    Set Variable    20
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select/option[3]    #选择灌水评论
    sleep    0.5
    ${搜索类型}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${评论总数}    获取评论数
    Run Keyword If    ${评论总数}<${单页评论数上限}    单页校验    ${搜索内容}    ${搜索类型}
    ...    ELSE    多页校验    ${评论总数}    ${搜索内容}    ${搜索类型}

全部类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${评论总数}    获取评论数
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    sleep    1
    ${评论总数1}    获取评论数
    Should Be Equal As Strings    ${评论总数1}    ${评论总数}    搜索数量错误

*** Keywords ***
获取评论数
    #下面步骤是判断添加规格前，分页栏是否存在
    sleep    0.5
    ${显示属性值}    Set Variable    ng-paginate ng-isolate-scope
    ${获取属性值}    Get Element Attribute    xpath=//div[@page="page"]@class    #获取分页栏的属性
    log    ${获取属性值}
    ${单页数据统计}    Get Matching Xpath Count    xpath=//table/tbody/tr[contains(@ng-repeat,"lists")]    #获取首页的数量
    ${单页数据统计加1}    Evaluate    int(${单页数据统计}+1)
    ${评论总数}=    Run Keyword If    '${获取属性值}'=='${显示属性值}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${单页数据统计}
    sleep    0.5
    [Return]    ${评论总数}

选择商品
    [Arguments]    ${商品名称}=测试
    sleep    0.5
    Input Text    xpath=//div[contains(@class,"input-group")]/input[@ng-model="GoosdNmae"]    ${商品名称}
    Click Element    xpath=//div[contains(@class,"input-group")]/a[@ng-click="search()"]
    sleep    0.5
    Click Element    xpath=//tbody/tr[1]/td[1]/label
    ${选择商品名称}    Get Text    xpath=//tbody/tr[1]/td[@ng-bind="list.name"]
    Click Element    xpath=//div[@class="modal-footer"]/a[text()="确定"]
    sleep    0.5
    [Return]    ${选择商品名称}

多页校验
    [Arguments]    ${总数}    ${搜索内容}    ${搜索类型}    ${单页数上限}=20
    #${sum}    获取评论数
    ${页数}    Evaluate    ${总数}/float(${单页数上限})
    ${获取页数}    Evaluate    int(math.ceil(${页数}))    math
    sleep    0.5
    单页校验    ${搜索内容}    ${搜索类型}
    : FOR    ${次数}    IN RANGE    1    ${获取页数}
    \    点击链接菜单    »
    \    单页校验    ${搜索内容}    ${搜索类型}

单页校验
    [Arguments]    ${搜索内容}    ${搜索类型}=0
    sleep    2
    #获取总的行数
    ${总条数}    Get Matching Xpath Count    xpath=//table/tbody/tr[contains(@ng-repeat,"lists")]
    ${获取搜索类型}    Run Keyword If    ${搜索类型}==0    Set Variable    1
    ...    ELSE IF    ${搜索类型}==1    Set Variable    2
    ...    ELSE    Set Variable    4
    #获取含关键字的行数
    ${获取所有元素}    Run Keyword If    ${获取搜索类型}==2    Get Webelements    xpath=//table/tbody/tr/td[${获取搜索类型}]/pre[contains(text(),"${搜索内容}")]
    ...    ELSE    Get Webelements    xpath=//table/tbody/tr/td[${获取搜索类型}][contains(text(),"${搜索内容}")]
    #${els1}    Get Webelements    xpath=//table/tbody/tr/td[${i}][contains(text(),"${name}")]
    ${条数}    Get Length    ${获取所有元素}
    Should Be Equal As Strings    ${总条数}    ${条数}
    Log    success
