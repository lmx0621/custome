*** Settings ***
Suite Setup       登录    beta
Suite Teardown    关闭浏览器
Test Teardown     失败重启
Library           RequestsLibrary
Library           json
Library           Collections
Library           String
Library           Selenium2Library
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot
Library           AutoItLibrary

*** Test Cases ***
创建一个普通订单
    [Setup]    点击链接菜单    微店铺
    点击链接菜单    所有订单
    Wait Until Element Contains    //*[@id="myTab"]/li[1]/a    全部
    ${总数}    获取列表总数
