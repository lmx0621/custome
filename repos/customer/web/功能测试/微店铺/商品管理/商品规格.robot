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
    ${exit}    Set Variable    ng-paginate ng-isolate-scope
    ${attribute}    Get Element Attribute    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]@class    #获取分页栏的属性
    log    ${attribute}
    ${page1_num}    Get Matching Xpath Count    xpath=//tr[contains(class,"width100 ng-scope")]    #获取首页的数量
    ${pagenum_add}    Evaluate    int(${page1_num}+1)
    ${num}=    Run Keyword If    '${attribute}'=='${exit}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${page1_num}
    ${num1}    Evaluate    int(${num}+1)
    sleep    1
    #新增规格
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/ul/li[2]/a
    sleep    0.5
    ${x}    Evaluate    random.randint(1,9999)    random
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    规格${x}    #输入规格名称
    Click Element    xpath=//span/a[@class="pointer" and @title="保存"]
    弹出窗信息校验    提交成功
    sleep    1
    #下面步骤是判断添加规格后，分页栏是否存在
    ${attribute}    Get Element Attribute    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]@class    #获取分页栏的属性
    ${num2}=    Run Keyword If    '${attribute}'=='${exit}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${pagenum_add}
    sleep    1
    Should Be Equal As Strings    ${num2}    ${num1}    添加规格后，规格数量统计错误
    #下面步骤是判断添加规格后，查看列表中数据是否存在
    Run Keyword If    ${num2}>20    规格校验    规格${x}
    ...    ELSE    Page Should Contain    规格${x}
    sleep    1
    #校验新建商品时，是否有这个规格
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    #{status}    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select/option[text()="qqq分类${x}"]
    ${status}    Run Keyword And Return Status    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="规格${x}"]
    log    ${status}
    Run Keyword If    '${status}'=='True'    LOG    规格添加后，可以在添加商品时规格列表中正确显示
    ...    ELSE    log    规格添加后，未在添加商品时规格列表中正确显示，添加后显示有问题
    sleep    1
    #数据还原，删除新增的规格    暂未连数据库，后期补上

添加规格值
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品规格
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]    40    元素加载失败
    ${text}    Get Text    xpath=//*[@id="tree"]/li[2]/div[2]/div[1]/span
    #Click Element    xpath=//span[text()="${text}"]/ancestor::/div[2]/span[2]/a[1]/i
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[2]/span[2]/a[1]/i
    ${str}    随机字符    1
    Input Text    xpath=//div/input[@placeholder="二级规格名称"]    测试规格值${str}
    Click Element    xpath=//*[@id="tree"]/li[2]/ul/li[1]/div[1]/div[2]/span/a[1]/i
    弹出窗信息校验    提交成功
    #校验新建商品时，是否有这个规格
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="${text}"]    #点击选择规格
    sleep    1
    Page Should Contain    测试规格值${str}
    sleep    1
    #数据还原，删除新增的规格值    暂未连数据库，后期补上

编辑规格值
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品规格
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]    40    元素加载失败
    ${text}    Get Text    xpath=//*[@id="tree"]/li[2]/div[2]/div[1]/span
    #Click Element    xpath=//span[text()="${text}"]/ancestor::/div[2]/span[2]/a[1]/i
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[2]/span[2]/a[2]/i
    ${str}    随机字符    1
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    规格测试${str}
    Click Element    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/span/a[1]/i
    弹出窗信息校验    修改成功
    #校验新建商品时，是否有这个规格
    sleep    0.5
    Page Should Contain    规格测试${str}
    Page Should Not Contain    ${text}
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    ${status}    Run Keyword And Return Status    Click Element    //tbody/tr[9]/td[2]/div/select/option[text()="规格测试${str}"]
    log    ${status}
    Run Keyword If    '${status}'=='True'    LOG    规格修改后，可以在添加商品时规格列表中正确显示
    ...    ELSE    log    规格修改后，未在添加商品时规格列表中正确显示，修改后显示有问题
    sleep    1
    #数据还原，删除新增的规格值    暂未连数据库，后期补上

*** Keywords ***
规格校验
    [Arguments]    ${name}
    sleep    0.5
    点击链接菜单    末页
    sleep    1
    Page Should Contain    ${name}    页面不存在新增的规格，功能有误
