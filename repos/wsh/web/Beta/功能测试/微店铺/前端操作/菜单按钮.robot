*** Settings ***
Library           Selenium2Library
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot
Resource          ../../../Resource/API.robot

*** Keywords ***
加入购物车
    Sleep    1
    Click Element    //ul/li/a[@class="buy_cart" and @ng-click="getCart()"]

立即购买
    Sleep    1
    Click Element    //ul/li/a[@class="buy_own" and @ng-click="showModal()"]
    Sleep    1
