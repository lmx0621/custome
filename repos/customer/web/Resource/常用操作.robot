*** Settings ***
Library           Selenium2Library
Resource          配置参数.robot
Resource          功能菜单.robot
Library           RequestsLibrary
Library           String
Library           json
Library           Screenshot

*** Keywords ***
登录
    Open Browser    ${url}    Chrome    #打开浏览器
    界面最大化
    Input Text    id=staff_id    ${username}    #输入用户名
    Input Text    id=password    ${password}    #输入密码
    Input Text    id=captcha    111111    #输入验证码
    Click Button    id=login    #点击登陆

界面最大化
    Maximize Browser Window

关闭浏览器
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
    Should Be Equal As Strings    ${text}    ${expect}
    Log    Sucess!    #Run Keyword If    '${text}'=='${expect}'    log    校验通过    # ELSE
    ...    # log    校验失败

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

商品添加
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

登陆接口
    Create Session    wsh    http://betanewwsh.snsshop.net/
    ${date}=    Create Dictionary    username=${username}    password=${password}    captcha=1
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /login/login-ajax    ${date}    headers=${headers}
    log    ${resp.content}
    #${response2}    Evaluate    u'${resp.content}'
    ${response}    Evaluate    u'${resp.text}'
    log    ${response}

随机获取背景颜色
    等待时间    0.5
    ${a}    Evaluate    random.randint(0,16777215)    random    #随机获取颜色
    LOG    ${a}
    ${result} =    Convert To Hex    ${a}    #转换为16进制
    LOG    ${result}
    #Execute Javascript    document.getElementById('bg_color').setAttribute('style', 'background-color: #${result} !important; color: transparent !important;');
    Execute Javascript    document.getElementsByClassName('colorpicker-element ng-pristine')[0].setAttribute('style', 'background-color: #${result} !important; color: transparent !important;');
    等待时间    0.5

随机选择下拉框
    [Arguments]    ${path}
    [Tags]
    Click Element    xpath=${path}
    等待时间    1
    ${count}    Get Matching Xpath Count    xpath=${path}/option    #获取总数
    log    ${count}
    sleep    0.5
    ${j}    Evaluate    random.randint(1,${count})    random
    Run Keyword If    ${count}>1    Click Element    xpath=${path}/option[${j}]
    ...    ELSE    Click Element    xpath=${path}/option[1]    #Run Keyword If    ${count}>1    Click Element
    ...    # xpath=${path}/option[${j}]    # ELSE    Click Element    xpath=${path}/option[1]
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

失败重启
    Run Keyword If Test Failed    Take Screenshot
    Run Keyword If Test Failed    登录
    Sleep    1

随机字符
    [Arguments]    ${pre}=None    ${len}=10
    ${prelen}    Get Length    ${pre}
    ${randlen}    Evaluate    ${len}-${prelen}
    ${rand}    Generate Random String    ${randlen}
    ${randstr}    Set Variable    ${pre}${rand}
    [Return]    ${randstr}

选择时间
    #选择开始时间
    Click Element    id=start_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[3]/td[2]
    Sleep    1
    Click Element    id=dpOkInput
    Sleep    1
    Unselect Frame
    #选择结束时间
    Click Element    id=end_time
    Sleep    1
    Select Frame    xpath=//iframe[@hidefocus='true']
    Click Element    xpath=//*[@id="dpTitle"]/div[6]/a
    Sleep    1
    Click Element    xpath=/html/body/div/div[3]/table/tbody/tr[5]/td[6]
    Sleep    1
    Click Element    id=dpOkInput
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

随机数字
    [Arguments]    ${len}=4
    ${num}    Generate Random String    ${len}    123456789
    [Return]    ${num}

弹出窗信息校验
    [Arguments]    ${msg}
    sleep    1
    ${alert_msg}    Confirm Action
    Should Contain    ${alert_msg}    ${msg}

选择图片
    Sleep    1
    Click Element    xpath=//div[contains(@class,"ace-file-input")]/label[@class="file-label"]
    Wait Until Page Contains Element    //h4[text()="图片管理器"]
    Sleep    1
    Click Element    //*[@id="select_ajax_form"]/div[3]/div/ul/li[1]/a/img
    Sleep    1
    Click Element    id=submitImage
    Sleep    1
