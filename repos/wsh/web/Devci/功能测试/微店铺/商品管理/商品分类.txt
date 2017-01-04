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
添加一级分类
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    sleep    1
    点击链接菜单    商品分类
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/a    40    元素加载失败
    ${分类名称}    随机字符    【分类】    10
    ${分类描述}    随机字符    【商品分类描述】    10
    ${排序}    Set Variable    0
    ${获取分类总数}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    ${分类总数加1}    Evaluate    int(${获取分类总数}+1)
    sleep    1
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[2]/a
    sleep    1
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/input    ${分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[4]/input    ${排序}    #排序
    Click Element    xpath=//span[@class="action-buttons"]/a[@title="保存"]/i
    弹出窗信息校验    提交成功
    ${获取分类总数1}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    #校验列表数据
    Run Keyword If    '${获取分类总数1}'=='${分类总数加1}'    LOG    一级分类添加到列表成功
    ...    ELSE    fail    一级分类添加到列表失败
    sleep    1
    字段校验    //ul[@id="tree"]/li[2]/div[2]/div[1]/span    ${分类名称}
    字段校验    //ul[@id="tree"]/li[2]/div[2]/div[2]/span    ${分类描述}
    字段校验    //ul[@id="tree"]/li[2]/div[2]/div[4]/span    ${排序}
    sleep    1
    #校验新建商品时，是否有这个分类
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    ${关键字执行结果}    Run Keyword And Return Status    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select/option[text()="${分类名称}"]
    log    ${关键字执行结果}
    Run Keyword If    '${关键字执行结果}'=='True'    LOG    一级分类添加后，可以在添加商品时一级分类中正确显示
    ...    ELSE    fail    一级分类添加后，未在添加商品时一级分类中显示，添加后显示有问题
    sleep    1
    #数据还原，删除新增的分类    暂未连数据库，后期补上

添加子级分类
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    sleep    1
    点击链接菜单    商品分类
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/a    40    元素加载失败
    ${获取分类总数}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    ${分类总数加1}    Evaluate    int(${获取分类总数}+1)
    ${分类名称}    随机字符    【分类】    10
    ${分类描述}    随机字符    【商品分类描述】    10
    ${排序}    Set Variable    0
    ${二级分类名称}    随机字符    【二级分类】    10
    ${二级分类描述}    随机字符    【二级分类描述】    10
    ${二级分类排序}    Set Variable    0
    ${三级分类名称}    随机字符    【三级分类】    10
    ${三级分类描述}    随机字符    【三级分类描述】    10
    ${三级分类排序}    Set Variable    0
    sleep    1
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[2]/a
    sleep    1
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/input    ${分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[4]/input    ${排序}    #排序
    Click Element    xpath=//span[@class="action-buttons"]/a[@title="保存"]/i
    弹出窗信息校验    提交成功
    #新建二级分类
    Wait Until Page Contains Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[5]/span[2]/a[1]/i    60s    页面元素未加载
    sleep    1
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[5]/span[2]/a[@title="添加"]    #点击一级分类后的+按钮
    sleep    1
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li[1]/div[1]/div[1]/input    ${二级分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li[1]/div[1]/div[2]/input    ${二级分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li[1]/div[1]/div[4]/input    ${二级分类排序}    #排序
    sleep    0.5
    Click Element    xpath=//*[@id="tree"]/li[2]/ul/li/div[1]/div[5]/span/a[1]/i
    弹出窗信息校验    提交成功
    #新建三级分类
    sleep    1
    Click Element    xpath=//*[@id="tree"]/li[2]/span[3]    #点击一级分类最前面的+展开按钮
    sleep    1
    Click Element    xpath=//*[@id="tree"]/li[2]/ul/li/div[2]/div[5]/span[2]/a[@title="添加"]    #点击二级分类后的+按钮    //*[@id="tree"]/li[2]/ul/li/div[2]/div[5]/span[2]/a[1]
    sleep    1
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li/ul/li/div[1]/div[1]/input    ${三级分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li/ul/li/div[1]/div[2]/input    ${三级分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/ul/li/ul/li/div[1]/div[4]/input    ${三级分类排序}    #排序
    sleep    0.5
    Click Element    xpath=//*[@id="tree"]/li[2]/ul/li/ul/li/div[1]/div[5]/span/a[1]/i
    弹出窗信息校验    提交成功
    ${获取分类总数1}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    #校验列表数据
    Run Keyword If    '${获取分类总数1}'=='${分类总数加1}'    LOG    一级分类添加到列表成功
    ...    ELSE    fail    一级分类添加到列表失败
    sleep    1
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[1]/span    ${分类名称}
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[2]/span    ${分类描述}
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[4]/span    ${排序}
    sleep    1
    #校验新建商品时，是否有这个分类
    点击链接菜单    商品列表
    Wait Until Element Contains    xpath=//form/div[1]/div[1]/div[2]/div    商品数
    sleep    0.5
    点击链接菜单    添加商品
    sleep    1
    #{status}    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select/option[text()="qqq分类${x}"]
    ${关键字执行结果}    Run Keyword And Return Status    Click Element    xpath=//tbody/tr[1]/td[2]/div[1]/select/option[text()="${分类名称}"]
    sleep    0.5
    log    ${关键字执行结果}
    Run Keyword If    '${关键字执行结果}'=='True'    LOG    一级分类添加后，可以在添加商品时一级分类中正确显示
    ...    ELSE    fail    一级分类添加后，未在添加商品时一级分类中显示，添加后显示有问题    #一级分类校验
    字段校验    //tbody/tr[1]/td[2]/div[2]/select/option    ${二级分类名称}    #二级分类校验
    字段校验    //tbody/tr[1]/td[2]/div[3]/select/option    ${三级分类名称}    #三级分类校验
    sleep    1
    #数据还原，删除新增的分类    暂未连数据库，后期补上

编辑分类
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品分类
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/a    40    元素加载失败
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[2]/a
    sleep    1
    ${分类名称}    随机字符    【分类】    10
    ${分类描述}    随机字符    【商品分类描述】    10
    ${排序}    Set Variable    0
    ${修改分类名称}    随机字符    【分类11】    10
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/input    ${分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[4]/input    ${排序}    #排序
    Click Element    xpath=//span[@class="action-buttons"]/a[@title="保存"]/i
    弹出窗信息校验    提交成功
    #校验
    sleep    1
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[1]/span    ${分类名称}
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[2]/span    ${分类描述}
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[4]/span    ${排序}
    sleep    1
    #修改分类
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[5]/span[2]/a[2]/i    #点击编辑按钮
    sleep    0.5
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${修改分类名称}
    Click Element    xpath=//span[@class="action-buttons"]/a[@title="保存"]/i
    弹出窗信息校验    提交成功
    sleep    1
    字段校验    //*[@id="tree"]/li[2]/div[2]/div[1]/span    ${修改分类名称}
    sleep    1
    #数据还原，删除新增的分类    暂未连数据库，后期补上

不显示分类
    [Tags]    pass
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    商品分类
    sleep    1
    Wait Until Page Contains Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[1]/a    40    元素加载失败
    #${获取分类总数}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    #${分类总数加1}    Evaluate    int(${获取分类总数}+1)
    ${分类名称}    随机字符    【分类】    10
    ${分类描述}    随机字符    【商品分类描述】    10
    ${排序}    Set Variable    0
    sleep    1
    Click Element    xpath=//*[@id="main-container"]/div/div[2]/div[2]/div/div/div[2]/a
    sleep    1
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[1]/input    ${分类名称}    #一级分类名称
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[2]/input    ${分类描述}    #分类描述
    Input Text    xpath=//*[@id="tree"]/li[2]/div[1]/div[4]/input    ${排序}    #排序
    Click Element    xpath=//span[@class="action-buttons"]/a[@title="保存"]/i
    弹出窗信息校验    提交成功
    #${获取分类总数1}    Get Matching Xpath Count    xpath=//*[@id="tree"]/li[@class="ng-scope"]
    #校验列表数据
    #Run Keyword If    '${获取分类总数1}'=='${分类总数加1}'    LOG    一级分类添加到列表成功
    ...    # ELSE    fail    一级分类添加到列表失败
    #sleep    1
    #字段校验    //*[@id="tree"]/li[2]/div[2]/div[1]/span    ${分类名称}
    #字段校验    //*[@id="tree"]/li[2]/div[2]/div[2]/span    ${分类描述}
    #字段校验    //*[@id="tree"]/li[2]/div[2]/div[4]/span    ${排序}
    sleep    0.5
    Click Element    xpath=//*[@id="tree"]/li[2]/div[2]/div[3]/label/input    #点击不显示按钮
    弹出窗信息校验    禁用成功
    #前端校验
