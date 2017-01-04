*** Settings ***
Library           Selenium2Library
Resource          ../常用操作.robot
Resource          ../功能菜单.robot
Resource          ../配置参数.robot

*** Keywords ***
点击底部菜单
    [Arguments]    ${菜单名}    #${底部菜单}    Create List    none    icon-home    icon-goods
    ...    # icon-cart    icon-surprise    # icon-user
    ${底部菜单}    Create Dictionary    首页=icon-home    列表=icon-goods    购物车=icon-cart    惊喜=icon-surprise    我=icon-user
    ${菜单}    Get From Dictionary    ${底部菜单}    ${菜单名}
    Click Element    //div[@class="footer_menu"]/ul/li/a/i[contains(@class,"${菜单}")]
    Sleep    3

随机选择一件商品
    [Documentation]    注：在首页商品列表中随机选择一件商品
    ${els}    Get Matching Xpath Count    //*[@id="app-body"]/show-build//module-build/goods-module//div[@ng-repeat="goods in module.goodsList"]
    ${rand}    Evaluate    random.randint(1,${els})    random
    Sleep    1
    [Return]    ${rand}
