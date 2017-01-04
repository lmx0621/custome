*** Settings ***
Test Setup        登录
Test Teardown     关闭浏览器
Library           Selenium2Library
Resource          ../../../Resource/常用操作.robot
Resource          ../../../Resource/功能菜单.robot
Resource          ../../../Resource/配置参数.robot

*** Test Cases ***
