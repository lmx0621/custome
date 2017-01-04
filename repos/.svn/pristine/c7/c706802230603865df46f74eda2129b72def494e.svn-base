*** Settings ***
Library           Selenium2Library
Resource          配置参数.robot
Resource          功能菜单.robot
Library           String
Library           Screenshot
Library           OperatingSystem

*** Keywords ***
登录
    #Set Selenium Implicit Wait    10
    #Log    Env:${env}
    ${env}    Set Variable    beta
    Set Global Variable    ${env}
    ####运行环境
    ${URL}    Run Keyword If    '${env}'=='test'    Set Variable    ${URL_TEST}
    ...    ELSE IF    '${env}'=='beta'    Set Variable    ${URL_BETA}
    ...    ELSE    Log    无效的运行参数
    Set Selenium Timeout    20
    ####启动浏览器
    Open Browser    ${URL}    chrome    #打开浏览器
    界面最大化
    Input Text    id=staff_id    ${USERNAME}    #输入用户名
    Input Text    id=password    ${PASSWORD}    #输入密码
    Input Text    id=captcha    111111    #输入验证码
    Click Button    id=login    #点击登陆

界面最大化
    Maximize Browser Window

关闭浏览器
    Sleep    3
    Close All Browsers

获取分组名
    登录
    点击链接菜单    微会员
    点击链接菜单    分组管理    #获取组名    #@{number}    create list    2    3
    ...    # 4    5    6    # 7    8    9
    ...    # 10
    : FOR    ${i}    IN    @{number}
    \    ${title}=    Get Webelements    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div/div/table/tbody
    #${title}    Get Text    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div/div/table/tbody/tr{j}/td[2]
    sleep    0.1
    LOG    ${title}

等待时间
    [Arguments]    ${time}=1s
    sleep    ${time}

对比校验
    [Arguments]    ${xxx}    ${expect}
    ${text}    Get Text    ${xxx}    #${xxx}是xpath路径
    #Should Contain    ${text}    ${expect}
    Run Keyword If    '${text}'=='${expect}'    log    校验通过
    ...    ELSE    log    校验失败

浏览器返回/后退
    Go Back

点击元素
    [Arguments]    ${element_xpath}    ${time}=5s    ${message}=Element Error
    [Tags]
    #Wait Until Page Contains Element    ${element_xpath}    ${time}    ${message}
    Click Element    ${element_xpath}

智能等待
    [Arguments]    ${seconds}=10s
    Set Browser Implicit Wait    ${seconds}

添加商品
    click element    xpath=//*[@id="product"]/div[1]/table/tbody[1]/tr[2]/td/table/tbody/tr[3]/td[3]
    Sleep    0.5
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div[3]/div/div/div[3]/a[2]    5
    click element    xpath=//*[@id="main-container"]/div[3]/div/div/div[3]/a[2]    #点击确定按钮
    等待时间    1
    Wait Until Page Contains Element    id=post    5
    Click Element    id=post
    等待时间    0.5
    confirm action
    等待时间    1    #删除数据，还原初始状态    #${number}    Get Text    //*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[4]/ul[2]/li[3]/span/span    #Click Element
    ...    # xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[3]/table/tbody/tr[1]/td[7]/div/a[2]/i    #点击删除按钮    #等待时间    1    #Click Element    xpath=//tbody/tr[3]/td/div[2]/button[1]
    ...    #确认删除    #等待时间    1    #confirm action    #等待时间    2
    ...    #${i}    Set Variable    1    #${sum}    Set Variable    0
    ...    #${number1}    Get Text    //*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[4]/ul[2]/li[3]/span/span    #${sum}    Evaluate    ${number}-${i}
    ...    #Run Keyword If    '${sum}'=='${number1}'    log    删除后校验通过    # ELSE    log
    ...    # 删除后校验失败

返回活动列表
    点击元素    xpath=//*[@id="main-container"]/div[3]/div/div/div[3]/a[1]
    等待时间    1
    点击元素    xpath=//*[@id="modal-footer"]/a[1]
    log    由于有全场商品满减活动，无法创建活动，返回活动列表

随机字符
    [Arguments]    ${pre}=None    ${len}=10
    ${prelen}    Get Length    ${pre}
    ${randlen}    Evaluate    ${len}-${prelen}
    ${rand}    Generate Random String    ${randlen}
    ${randstr}    Set Variable    ${pre}${rand}
    [Return]    ${randstr}

随机数字
    [Arguments]    ${len}=4
    ${num}    Generate Random String    ${len}    123456789
    [Return]    ${num}

选择时间
    #选择结束时间
    Click Element    id=end_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    ${class}    Get Element Attribute    //body/div/div[3]/table/tbody/tr[5]/td[6]@class
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[6]
    Sleep    1
    Run Keyword If    '${class}'!='Wselday'    Click Element    id=dpOkInput
    Unselect Frame
    #选择开始时间
    Click Element    id=start_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    ${class}    Get Element Attribute    //body/div/div[3]/table/tbody/tr[3]/td[2]@class
    Click Element    //body/div/div[3]/table/tbody/tr[3]/td[2]
    Sleep    1
    Run Keyword If    '${class}'!='Wselday'    Click Element    id=dpOkInput
    Sleep    1
    Unselect Frame

选择日期
    #选择开始日期
    Click Element    id=start_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[3]/td[2]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame
    #选择结束日期
    Click Element    id=start_end
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[6]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

选择图片
    [Arguments]    ${locator}=//div[contains(@class,"ace-file-input")]/a[@data-target="#myModalImage"]
    Click Element    ${locator}
    Wait Until Page Contains Element    //h4[text()="图片管理器"]    15
    ####选择图片
    ${图片}    Evaluate    random.randint(1,15)    random
    Sleep    2
    Wait Until Page Contains Element    //*[@id="select_ajax_form"]/div[3]/div/ul/li[${图片}]/a/img    15
    Sleep    1
    Click Element    //*[@id="select_ajax_form"]/div[3]/div/ul/li[${图片}]/a/img
    Sleep    1
    Click Element    id=submitImage
    Sleep    2

修改时间
    #选择结束时间
    Click Element    id=end_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[5]
    Sleep    1
    Click Element    id=dpOkInput
    Unselect Frame
    #选择开始时间
    Click Element    id=start_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[4]/td[5]
    Sleep    1
    Click Element    id=dpOkInput
    Sleep    1
    Unselect Frame

修改日期
    #选择结束日期
    Click Element    id=start_end
    Sleep    1
    Select Frame    //iframe[@hidefocus='true']
    Click Element    //*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[5]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame
    #选择开始日期
    Click Element    id=start_time
    Sleep    1
    Select Frame    //iframe[@hidefocus='true']
    Click Element    //*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[2]/td[4]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

失败重启
    Run Keyword If Test Failed    Take Screenshot
    Sleep    1
    Run Keyword If Test Failed    登录
    Sleep    1

查看二维码
    [Arguments]    ${xpath}
    ###查看二维码
    Click Element    xpath=${xpath}
    Sleep    1
    Select Window    二维码
    Sleep    1
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/table/tbody/tr[1]/td[3]/a/i
    Sleep    2
    Wait Until Page Contains Element    xpath=//*[@id="query"]/div/div/div[2]/div/div/img    15
    Wait Until Element Is Visible    xpath=//*[@id="query"]/div/div/div[2]/div/div/img
    Sleep    1
    Click Element    xpath=//*[@id="query"]/div/div/div[1]/a
    Sleep    2
    Close Window
    Sleep    1

查看二维码_弹出窗
    [Arguments]    ${locator}
    ####查看二维码
    Click Element    ${locator}
    Wait Until Page Contains Element    //h4[contains(text(),"二维码")]
    Sleep    1
    Wait Until Element Is Visible    //*[@id="query"]/div/div/div[2]/div/div/img[starts-with(@src,"https://mp.weixin.qq.com/cgi-bin/showqrcode")]
    Sleep    1
    Click Element    //*[@id="query"]/div/div/div[1]/a
    Sleep    2

查看参与人员
    [Arguments]    ${xpath}    ${title}
    ####查看参与人员
    Click Element    xpath=${xpath}
    Sleep    1
    Select Window    ${title}
    Sleep    2
    ##数据检查
    ${第一行数据}    Get Text    //*[@id="main-container"]/div/div[2]/div[2]/div/div/div[3]/table/tbody/tr/td
    Run Keyword If    '${第一行数据}'=='暂无数据'    Log    暂无参与数据。
    ##数据导出
    Click Link    导出参与人员
    Sleep    2
    Close Window
    Sleep    1

查看中奖名单
    [Arguments]    ${xpath}
    Click Element    xpath=${xpath}
    Wait Until Page Contains    中奖记录    20
    Title Should Be    中奖记录
    Sleep    1
    #导出中奖记录
    Click Link    导出中奖记录
    Sleep    2

查看日志
    [Arguments]    ${xpath}
    Click Element    xpath=${xpath}
    Wait Until Page Contains    操作日志
    Title Should Be    操作日志
    Sleep    1

随机金额
    ${long}    Generate Random String    1    34567
    ${pre}    Generate Random String    1    12345
    ${zero}    Generate Random String    ${long}    0
    ${金额}    Set Variable    ${pre}${zero}
    [Return]    ${金额}

弹出信息校验
    [Arguments]    ${msg}=成功    ${retry}=10    ${time}=1
    ${alert}    Wait Until Keyword Succeeds    ${retry}x    ${time}s    Get Alert Message
    Should Contain    ${alert}    ${msg}
    Sleep    1.5
    [Return]    ${alert}

随机选择下拉框
    [Arguments]    ${path}
    [Tags]
    Click Element    xpath=${path}
    等待时间    1
    ${count}    Get Matching Xpath Count    xpath=${path}/option    #获取总数
    log    ${count}
    sleep    0.5
    #${j}    Evaluate    random.randint(1,${count})    random
    : FOR    ${i}    IN RANGE    10
    \    ${j}    Evaluate    random.randint(1,${count})    random
    \    Run Keyword If    ${j}!=1    Exit For Loop
    Run Keyword If    ${count}>1    Click Element    xpath=${path}/option[${j}]
    ...    ELSE    Click Element    xpath=${path}/option[1]
    ${title}    Get Text    xpath=${path}/option[${j}]
    log    ${title}
    [Return]    ${title}

分页操作
    [Arguments]    ${totle_path}    ${pange_number}=10    # ${totle_path}为总数所在的xpath的路径值，${pange_number}为每页展示的数据，默认是10条数据
    sleep    0.5
    #下面步骤根据总数计算出页数
    ${totle}    get text    ${totle_path}    #获取列表总条数
    ${page_num}    Evaluate    ${totle}/float(${pange_number})
    ${yyy}    Evaluate    int(math.ceil(${page_num}))    math
    #log    总页数为：${yyy}
    #点击每页，且统计总数
    ${sum}    Get Matching Xpath Count    //tr[@class='ng-scope']
    : FOR    ${i}    IN RANGE    1    ${yyy}
    \    点击链接菜单    »
    \    sleep    1
    \    ${count}    Get Matching Xpath Count    //tr[@class='ng-scope']
    \    #sleep    2
    \    log    ${count}
    \    ${sum}    Evaluate    ${sum}+${count}
    sleep    0.5
    Run Keyword If    '${sum}'=='${totle}'    log    列表总数正确，总数为：${sum}，总页数为：${yyy}
    ...    ELSE    log    列表总数错误
    [Return]    ${totle}

随机手机号
    ${pre}    Generate Random String    1    456789
    ${num}    Generate Random String    8    0123456789
    ${phone}    Set Variable    13${pre}${num}
    [Return]    ${phone}

保存并闭关
    Click Element    //*[@id="modal-footer"]/a[2]

字段校验
    [Arguments]    ${xpath}    ${校验字段}
    ###结果校验
    Log    ----结果校验----
    ${校验字段2}    Get Text    ${xpath}
    Should Be Equal As Strings    ${校验字段}    ${校验字段2}
    Log    Sucess!

字段校验Not
    [Arguments]    ${xpath}
    ###结果校验
    Log    ----结果校验----
    Page Should Not Contain Element    ${xpath}
    Log    Sucess!

选择开始日期
    #选择开始日期
    Click Element    id=start_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[3]/td[2]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

选择结束日期
    #选择结束日期
    Click Element    id=start_end
    Sleep    1
    Select Frame    //iframe[@hidefocus='true']
    Click Element    //*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[5]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

修改开始日期
    #选择开始日期
    Click Element    id=start_time
    Sleep    1
    Select Frame    //iframe[@hidefocus='true']
    Click Element    //*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[2]/td[4]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

修改结束日期
    #选择结束日期
    Click Element    id=start_end
    Sleep    1
    Select Frame    //iframe[@hidefocus='true']
    Click Element    //*[@id="dpTitle"]/div[6]/a    #下月
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[5]
    Sleep    1
    #Click Element    id=dpOkInput
    Unselect Frame

确认
    [Arguments]    ${action}=确定
    [Tags]
    Click Element    //button[@data-id="ok" and text()="${action}"]
    Sleep    1.5

弹出窗信息校验
    [Arguments]    ${msg}
    sleep    1
    ${alert_msg}    Confirm Action
    Should Contain    ${alert_msg}    ${msg}

Checkbox_获取已选中的数量
    [Arguments]    ${xpath}
    ${els}    Get Webelements    ${xpath}
    ${len}    Get Length    ${els}
    ${num}    Set Variable    ${0}
    : FOR    ${i}    IN RANGE    ${len}
    \    ${flag}    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(${xpath})[${i+1}]
    \    ${num}    Set Variable If    ${flag}==True    ${num+1}    ${num}
    Log    Num:${num}
    [Return]    ${num}

Checkbox_选择一个当前未选中的
    [Arguments]    ${xpath}
    ${els}    Get Webelements    ${xpath}
    ${len}    Get Length    ${els}
    : FOR    ${i}    IN RANGE    ${len}
    \    ${flag}    Run Keyword And Return Status    Checkbox Should Not Be Selected    xpath=(${xpath})[${i+1}]
    \    Run Keyword if    ${flag}==True    Click Element    xpath=(${xpath})[${i+1}]
    \    Exit For Loop If    ${flag}==True
    Sleep    1

Radio_选择未选中的
    [Arguments]    ${xpath}
    #选择未选中的Radio
    ${els}    Get Webelements    ${xpath}
    ${len}    Get Length    ${els}
    ${rand}    Evaluate    random.randint(1,${len})    random
    Click Element    xpath=(${xpath})[${rand}]

获取弹出信息
    [Arguments]    ${retry}=10    ${time}=1
    ${message}    Wait Until Keyword Succeeds    ${retry}x    ${time}s    Get Alert Message
    [Return]    ${message}

随机数字2
    [Arguments]    ${XX}=none    ${len}=4
    ${num}    Generate Random String    ${len}    123456789
    ${randnum}    Set Variable    ${XX}${num}
    [Return]    ${randnum}

门店/员工策略码时间选择
    #门店/员工策略码时间选择
    #开始时间选择
    Click Element    id=start_time
    sleep    1
    select frame    xpath=/html/body/div[6]/iframe[@hidefocus='true']    #定位
    #sleep    1
    #input text    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[3]    59    #输入时间的分为59分
    #sleep    1
    #input text    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[5]    59    #输入时间的秒为59分
    #sleep    1
    click element    id=dpOkInput    #点击确定
    Unselect Frame
    sleep    1
    #结束时间
    click element    id=end_time
    sleep    1
    select frame    xpath=/html/body/div[6]/iframe[@hidefocus='true']
    sleep    1
    click element    //*[@id="dpTitle"]/div[6]/a    #点击下一月
    sleep    1
    click element    id=dpOkInput    #点击确定
    Unselect Frame

修改门店/员工码时间
    ######
    #开始时间选择
    Click Element    id=start_time
    sleep    1
    select frame    xpath=/html/body/div[6]/iframe[@hidefocus='true']    #定位
    sleep    1
    input text    //*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[1]    23
    input text    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[3]    59    #输入时间的分为59分
    sleep    1
    input text    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[5]    59    #输入时间的秒为59分
    sleep    1
    click element    id=dpOkInput    #点击确定
    Unselect Frame
    ${star_time}    Get text    id=start_time
    Set Suite Variable    ${star_time}
    sleep    1
    #结束时间
    click element    id=end_time
    sleep    1
    select frame    xpath=/html/body/div[6]/iframe[@hidefocus='true']
    sleep    1
    click element    //*[@id="dpTitle"]/div[6]/a    #点击下一月
    click element    //*[@id="dpTitle"]/div[6]/a
    sleep    1
    click element    id=dpOkInput    #点击确定
    Unselect Frame
    ${end_time}    Get text    id=end_time
    Set Suite Variable    ${end_time}

随机金额（小数）
    [Arguments]    ${len}
    ${num1}    Generate Random String    ${len}    123456789
    ${num2}    Generate Random String    2    0123456789
    ${num3}    Set Variable    ${num1}.${num2}
    [Return]    ${num3}

微信/商圈分类非一级
    [Arguments]    ${路径}
    sleep    1
    Click Element    ${路径}
    ${总数}    Get Matching Xpath Count    xpath=${路径}/option    #统计微信店铺分类总数
    log    ${总数}
    Run Keyword If    '${总数}'=='1'    Click Element    xpath=//*[@id="wxShopThirdId"]/option[${总数}]
    ...    ELSE    随机选择微信分类/商圈    ${路径}
    Set Suite Variable    ${总数}

随机选择微信分类/商圈
    [Arguments]    ${统计路径}
    sleep    1
    Click Element    xpath=${统计路径}
    ${分类总数}    Get Matching Xpath Count    xpath=${统计路径}/option    #统计微信店铺分类总数
    ${随机分类}    Evaluate    random.randint(2,${分类总数})    random    #随机某个微信分类
    sleep    1
    Click Element    xpath=${统计路径}/option[${随机分类}]
    Set Suite Variable    ${随机分类}

获取列表总数
    sleep    0.5
    ${显示属性值}    Set Variable    ng-paginate ng-isolate-scope
    ${获取属性值}    Get Element Attribute    xpath=//div[@page="page"]@class    #获取分页栏的属性
    log    ${获取属性值}
    ${单页数据统计}    Get Matching Xpath Count    xpath=//table/tbody/tr[contains(@ng-repeat,"list")]    #获取首页的数量
    #${单页数据统计加1}    Evaluate    int(${单页数据统计}+1)
    ${总数}=    Run Keyword If    '${获取属性值}'=='${显示属性值}'    Get Text    xpath=//div[@page="page"]/ul[2]/li[3]/span/span
    ...    ELSE    fail    ${单页数据统计}
    sleep    0.5
    [Return]    ${总数}

随机获取会员微信id
    ####进入页面
    点击链接菜单    微会员
    ${sub}    Set Variable    会员列表
    点击链接菜单    ${sub}
    Wait Until Page Contains Element    //*[@id="breadcrumbs"]/ul/li[contains(text(),"会员列表")]
    Sleep    1
    ####会员列表-查看会员详情
    ${当前页数量}    Get Matching Xpath Count    //*[@id="integralTable"]/tbody/tr[@ng-repeat="i in lists track by $index"]
    ${rand}    Evaluate    random.randint(1,${当前页数量})    random
    ##获取ID
    ${href}    Get Element Attribute    //*[@id="integralTable"]/tbody/tr[${rand}]/td/div[@class="action-buttons"]/a[@title="查看"]@href
    ${match}    Get Regexp Matches    ${href}    (?<=\\bu_id=)\\w+\\b
    ${u_id}    Set Variable    ${match[0]}
    Sleep    0.5
    [Return]    ${u_id}

微信手机端登录(pc版)
    ${u_id}    随机获取会员微信id
    ###pc端模拟手机前端登录
    #Open Browser    ${URL_BETA_WX}/weishanghuzhushou/oauth/testing?id=${u_id}    chrome
    Open Browser    ${URL_BETA_WX}/weishanghuzhushou/oauth/testing?id=13723226    chrome
    Maximize Browser Window
    sleep    1

获取会员分组列表
    [Arguments]    ${amount}=all
    ${errmsg}    API.会员_分组列表
    ${分组列表}    Create List
    ###
    ${page}    Get From Dictionary    ${errmsg}    page
    ${total}    Get From Dictionary    ${page}    total_count
    ###
    ${data}    Get From Dictionary    ${errmsg}    data
    ${len}    Get Length    ${data}
    ${len}    Set Variable If    '${amount}'=='all'    ${len}    '${amount}'!='all' and ${len}>${amount}    ${amount}    ${len}
    : FOR    ${i}    IN RANGE    ${len}
    \    ${data_i}    Get From List    ${data}    ${i}
    \    ${id}    Get From Dictionary    ${data_i}    id
    \    ${name}    Get From Dictionary    ${data_i}    name
    \    Append To List    ${分组列表}    ${id}
    Log    ${分组列表}
    [Return]    ${分组列表}

获取标签列表
    [Arguments]    ${amount}=all
    ${errmsg}    API.会员_标签列表
    ${标签列表}    Create List
    ###
    ${page}    Get From Dictionary    ${errmsg}    page
    ${total}    Get From Dictionary    ${page}    total_count
    ###
    ${data}    Get From Dictionary    ${errmsg}    data
    ${len}    Get Length    ${data}
    ${len}    Set Variable If    '${amount}'=='all'    ${len}    '${amount}'!='all' and ${len}>${amount}    ${amount}    ${len}
    : FOR    ${i}    IN RANGE    ${len}
    \    ${data_i}    Get From List    ${data}    ${i}
    \    ${id}    Get From Dictionary    ${data_i}    id
    \    ${name}    Get From Dictionary    ${data_i}    name
    \    Append To List    ${标签列表}    ${id}
    Log    ${标签列表}
    #
    [Return]    ${标签列表}

分页工具条校验
    [Arguments]    ${总数}
    Element Should Be Visible    //ul[@total-items="page.total_count"]
    ${总数_页面}    Get Text    //span[@ng-bind="page.total_count"]
    Should Be Equal As Strings    ${总数_页面}    ${总数}
    Log    校验成功！

随机URL
    ${后缀}    Create List    com    net    cn    com.cn
    ${后缀Rand}    Generate Random String    1    0123
    ${域名}    Generate Random String    8    [LOWER]
    ${URL}    Set Variable    http://www.${域名}.${后缀[${后缀Rand}]}
    [Return]    ${URL}

微信模拟页面登录
    [Arguments]    ${客户ID}
    ###模拟微信前端页面登录
    Open Browser    ${URL_BETA_WX}/weishanghuzhushou/oauth/testing?id=${客户ID}    chrome
    Maximize Browser Window
    Set Selenium Timeout    20
    sleep    1

随机价格
    [Documentation]    说明：随机生成0.01~100之间的价格
    ${price}    Evaluate    round(random.uniform(0.01,100),2)    random
    [Return]    ${price}

随机编码
    [Arguments]    ${前缀}=${EMPTY}    ${后缀}=${EMPTY}    ${len}=2    # ${len}为动态值长度，不含前后缀
    ###
    ${随机码}    Generate Random String    ${len}    123456789
    ${编码}    Set Variable    ${前缀}${随机码}${后缀}
    [Return]    ${编码}
