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
    ${num}    获取评论数    #新增评论前获取评论数
    ${num1}    Evaluate    int(${num}+1)
    Click Button    xpath=//div/div/button[@type="button" and @ng-click="addcom()"]    #点击“添加一条评论”按钮
    Wait Until Page Contains Element    //h4[text()="添加评论"]
    选择图片
    click element    xpath=//div[@class="col-sm-10"]/a[text()=" 选择商品 "]    #选择商品
    Wait Until Page Contains Element    //h4[text()="选择商品"]
    ${name}    选择商品
    ${i}    Evaluate    random.randint(1,5)    random
    ${star}    Run Keyword If    ${i}==1    Set Variable    ★
    ...    ELSE IF    ${i}==2    Set Variable    ★★
    ...    ELSE IF    ${i}==3    Set Variable    ★★★
    ...    ELSE IF    ${i}==4    Set Variable    ★★★★
    ...    ELSE    ★★★★★
    Click Element    xpath=//form/div[4]/div/select
    sleep    0.5
    Click Element    xpath=//form/div[4]/div/select/option[${i}]
    Click Element    id=end_time
    Select Frame    xpath=/html/body/div[9]/iframe
    Click Element    id=dpOkInput
    Unselect Frame
    sleep    0.5
    ${time}    Get Value    id=end_time
    #${time}    Execute Javascript    document.getElementById('end_time').value
    ${content}    随机字符    测试
    Input Text    xpath=//div/textarea[@name="text"]    ${content}
    sleep    0.5
    Click Element    xpath=//*[@id="addcomments"]/div/div/div[3]/button[2]    #点击确定按钮
    sleep    1
    ###校验
    对比校验    xpath=//tbody/tr[1]/td[1]    ${name}    ###商品名
    对比校验    xpath=//tbody/tr[1]/td[2]/pre    ${content}    ###内容
    对比校验    xpath=//tbody/tr[1]/td[3]    ${star}    ###评分
    对比校验    xpath=//tbody/tr[1]/td[4]    灌水评论    ###评论类型
    对比校验    xpath=//tbody/tr[1]/td[5]    ${EMPTY}    ###评论用户
    对比校验    xpath=//tbody/tr[1]/td[6]    ${time}    ###发表时间
    ${num2}    获取评论数    #新增评论后获取评论数
    Should Be Equal As Strings    ${num1}    ${num2}
    ###还原数据
    Click Element    xpath=//tbody/tr[1]/td[8]/div/a[@title="删除"]    #点击删除
    sleep    0.5
    Click Element    xpath=//tbody/tr[3]/td/div[2]/button[1]    #点击确定按钮
    弹出窗信息校验    删除成功
    ${num3}    获取评论数    #新增评论后获取评论数
    Should Be Equal As Strings    ${num3}    ${num}

商品名称搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${searchname}    Set Variable    测试
    ${type}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    Input Text    xpath=//div[@class="float-right"]/div[2]/input    ${searchname}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${num}    获取评论数
    Run Keyword If    ${num}<20    单页校验    ${searchname}    ${type}
    ...    ELSE    多页校验    ${num}    ${searchname}    ${type}

商品评论搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${searchname}    Set Variable    东西
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[2]
    sleep    0.5
    ${type}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    Input Text    xpath=//div[@class="float-right"]/div[2]/input    ${searchname}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${num}    获取评论数
    Run Keyword If    ${num}<20    单页校验    ${searchname}    ${type}
    ...    ELSE    多页校验    ${num}    ${searchname}    ${type}

用户评论类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${searchname}    Set Variable    用户评论
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select/option[2]    #用户评论
    sleep    0.5
    ${type}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    #nput Text    xpath=//div[@class="float-right"]/div[2]/input    ${searchname}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${num}    获取评论数
    Run Keyword If    ${num}<20    单页校验    ${searchname}    ${type}
    ...    ELSE    多页校验    ${num}    ${searchname}    ${type}

灌水评论类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${searchname}    Set Variable    灌水评论
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select/option[3]    #选择灌水评论
    sleep    0.5
    ${type}    Get Value    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select
    #nput Text    xpath=//div[@class="float-right"]/div[2]/input    ${searchname}
    Click Element    xpath=//div[@class="float-right"]/div[2]/span
    sleep    0.5
    ${num}    获取评论数
    Run Keyword If    ${num}<20    单页校验    ${searchname}    ${type}
    ...    ELSE    多页校验    ${num}    ${searchname}    ${type}

全部类型搜索
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品评论
    ${num}    获取评论数
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select    #点击下拉框
    sleep    0.5
    Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[1]/select/option[3]    #选择评论类型
    #sleep    0.5
    #Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select    #点击下拉框
    #sleep    0.5
    #Click Element    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[1]/div[2]/div/select/option[1]    #选择灌水评论
    sleep    1
    ${num1}    获取评论数
    Should Be Equal As Strings    ${num1}    ${num}    搜索数量错误

*** Keywords ***
获取评论数
    #下面步骤是判断添加规格前，分页栏是否存在
    sleep    0.5
    ${exit}    Set Variable    ng-paginate ng-isolate-scope
    ${attribute}    Get Element Attribute    xpath=//div[@page="page"]@class    #获取分页栏的属性
    log    ${attribute}
    ${page1_num}    Get Matching Xpath Count    xpath=//table/tbody/tr[contains(@ng-repeat,"lists")]    #获取首页的数量
    ${pagenum_add}    Evaluate    int(${page1_num}+1)
    ${num}=    Run Keyword If    '${attribute}'=='${exit}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    LOG    ${page1_num}
    sleep    0.5
    [Return]    ${num}

选择商品
    [Arguments]    ${product_name}=测试
    sleep    0.5
    Input Text    xpath=//div[contains(@class,"input-group")]/input[@ng-model="GoosdNmae"]    ${product_name}
    Click Element    xpath=//div[contains(@class,"input-group")]/a[@ng-click="search()"]
    sleep    0.5
    Click Element    xpath=//tbody/tr[1]/td[1]/label
    ${name}    Get Text    xpath=//tbody/tr[1]/td[@ng-bind="list.name"]
    Click Element    xpath=//div[@class="modal-footer"]/a[text()="确定"]
    sleep    0.5
    [Return]    ${name}

多页校验
    [Arguments]    ${sum}    ${name}    ${type}    ${pange_number}=20
    #${sum}    获取评论数
    ${page_num}    Evaluate    ${sum}/float(${pange_number})
    ${yyy}    Evaluate    int(math.ceil(${page_num}))    math
    sleep    0.5
    单页校验    ${name}    ${type}
    : FOR    ${i}    IN RANGE    1    ${yyy}
    \    点击链接菜单    »
    \    单页校验    ${name}    ${type}

单页校验
    [Arguments]    ${name}    ${type}=0
    sleep    2
    #获取总的行数
    ${count}    Get Matching Xpath Count    xpath=//table/tbody/tr[contains(@ng-repeat,"lists")]
    ${i}    Run Keyword If    ${type}==0    Set Variable    1
    ...    ELSE IF    ${type}==1    Set Variable    2
    ...    ELSE    Set Variable    4
    #获取含关键字的行数
    ${els1}    Run Keyword If    ${i}==2    Get Webelements    xpath=//table/tbody/tr/td[${i}]/pre[contains(text(),"${name}")]
    ...    ELSE    Get Webelements    xpath=//table/tbody/tr/td[${i}][contains(text(),"${name}")]
    #${els1}    Get Webelements    xpath=//table/tbody/tr/td[${i}][contains(text(),"${name}")]
    ${len1}    Get Length    ${els1}
    Should Be Equal As Strings    ${count}    ${len1}
    Log    success
