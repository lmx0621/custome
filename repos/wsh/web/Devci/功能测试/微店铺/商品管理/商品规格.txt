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
添加规格
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品规格
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]    40    元素加载失败
    #下面步骤是判断添加规格前，分页栏是否存在
    ${规格}    随机字符    【规格】    10
    ${单页规格数上限}    Set Variable    20
    ${显示属性值}    Set Variable    ng-paginate ng-isolate-scope
    ${获取属性值}    Get Element Attribute    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]@class    #获取分页栏的属性
    log    ${获取属性值}
    ${单页数据统计}    Get Matching Xpath Count    xpath=//tr[contains(class,"width100 ng-scope")]    #获取首页的数量
    ${单页数据统计加1}    Evaluate    int(${单页数据统计}+1)
    ${当前规格总数}=    Run Keyword If    '${获取属性值}'=='${显示属性值}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${单页数据统计}
    ${当前规格总数加1}    Evaluate    int(${当前规格总数}+1)
    sleep    1
    #新增规格
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/ul/li[2]/a
    sleep    0.5
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${规格}    #输入规格名称
    Click Element    xpath=//span/a[@class="pointer" and @title="保存"]
    弹出窗信息校验    提交成功
    sleep    1
    #下面步骤是判断添加规格后，分页栏是否存在
    ${获取属性值1}    Get Element Attribute    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]@class    #获取分页栏的属性
    ${获取当前规格总数加1}=    Run Keyword If    '${获取属性值1}'=='${显示属性值}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${单页数据统计加1}
    sleep    1
    Should Be Equal As Strings    ${获取当前规格总数加1}    ${当前规格总数加1}    添加规格后，规格数量统计错误
    #下面步骤是判断添加规格后，查看列表中数据是否存在
    Run Keyword If    ${获取当前规格总数加1}>${单页规格数上限}    规格校验    ${规格}
    ...    ELSE    Page Should Contain    ${规格}
    sleep    1
    #校验新建商品时，是否有这个规格
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    ${关键字执行结果}    Run Keyword And Return Status    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="${规格}"]
    log    ${关键字执行结果}
    Run Keyword If    '${关键字执行结果}'=='True'    LOG    规格添加后，可以在添加商品时规格列表中正确显示
    ...    ELSE    fail    规格添加后，未在添加商品时规格列表中正确显示，添加后显示有问题
    sleep    1
    #数据还原，删除新增的规格    暂未连数据库，后期补上

添加规格值
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品规格
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]    40    元素加载失败
    ${获取首条规格名称}    Get Text    xpath=//*[@id="tree"]/li[2]/div[2]/div[1]/span
    ${子规格名称}    随机字符    【测试规格值】    12
    #点击添加按钮“+”
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[2]/span[2]/a[1]/i
    #输入子规格名称
    Input Text    xpath=//div/input[@placeholder="二级规格名称"]    ${子规格名称}
    #点击保存按钮
    Click Element    xpath=//*[@id="tree"]/li[2]/ul/li[1]/div[1]/div[2]/span/a[1]/i
    弹出窗信息校验    提交成功
    #校验新建商品时，是否有这个规格
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    #选择一级规格
    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="${获取首条规格名称}"]    #点击选择规格
    sleep    1
    #检查页面是否包含二级规格
    Page Should Contain    ${子规格名称}
    sleep    1
    #数据还原，删除新增的规格值    暂未连数据库，后期补上

编辑规格值
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品规格
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]    40    元素加载失败
    ${获取首条规格名称}    Get Text    xpath=//*[@id="tree"]/li[2]/div[2]/div[1]/span
    ${修改规格名称}    随机字符    【测试规格值】    12
    #点击编辑按钮
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[2]/span[2]/a[2]/i
    #输入修改的规格名称
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${修改规格名称}
    #点击保存按钮
    Click Element    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/span/a[1]/i
    #弹框校验
    弹出窗信息校验    修改成功
    #校验新建商品时，是否有这个规格
    sleep    0.5
    Page Should Contain    ${修改规格名称}
    Page Should Not Contain    ${获取首条规格名称}
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    ${关键字执行结果}    Run Keyword And Return Status    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="${修改规格名称}"]
    log    ${关键字执行结果}
    Run Keyword If    '${关键字执行结果}'=='True'    LOG    规格修改后，可以在添加商品时规格列表中正确显示
    ...    ELSE    fail    规格修改后，未在添加商品时规格列表中正确显示，修改后显示有问题
    sleep    1
    #数据还原，删除新增的规格值    暂未连数据库，后期补上

*** Keywords ***
规格校验
    [Arguments]    ${name}
    sleep    0.5
    点击链接菜单    末页
    sleep    1
    Page Should Contain    ${name}    页面不存在新增的规格，功能有误
