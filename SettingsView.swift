//
//  SettingsView.swift
//  SettingExample
//
//  Created by A. Zheng (github.com/aheze) on 2/22/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import DairoUI_IOS

struct SettingsView: View {
    
    private static var testTime = 0
    
    @State var text = "Hello World!"
    @State var pickerSelectedValue: AnyHashable? = 1
    
    var body: some View {
        SettingStack(embedInNavigationStack:true) {
            SettingPage(title: "设置") {
                SettingGroup {
                    SettingButton(iconSize:60, iconRadius: 30, title: "竖向设置按钮12",tip: "这里是提示内容",isVertical: true) {
                        print(":) pressed!")
                    }
                    .icon(icon: .system(icon: "sparkles", backgroundColor: Color.pink))
                    SettingButton(iconSize:60,title: "竖向设置按钮",tip: "这里是提示内容",isVertical: true) {
                        print(":) pressed!")
                    }
                    .icon(icon: .system(icon: "sparkles", backgroundColor: Color.pink))
                }
                SettingGroup(header: "用户登录") {
                    SettingTextField(title: "用户名", text: $text, placeholder: "Enter text here1")
                        .icon(icon: .system(icon: "gearshape.fill", backgroundColor: Color.pink))
                    SettingTextField(title: "密码", text: $text, placeholder: "Enter text here2",type: .password)
                        .icon(icon: .system(icon: "hand.raised.fill", backgroundColor: Color.pink))
                }
                
                
                
                SettingGroup {
                    SettingPicker(
                        icon: .system(icon: "hand.raised.fill", backgroundColor: Color.pink),
                        title: "单选列表",
                        data: [
                            SettingPickerData("自动",1),
                            SettingPickerData("单选1",2),
                            SettingPickerData("单选2",3)
                        ],
                        value: self.$pickerSelectedValue
                    )
                    .pickerDisplayMode(.navigation)
                    
                    SettingPicker(
                        icon: .system(icon: "hand.raised.fill", backgroundColor: Color.pink),
                        title: "单选列表(menu)",
                        data: [
                            SettingPickerData("自动",1),
                            SettingPickerData("单选1",2),
                            SettingPickerData("单选2",3)
                        ],
                        value: self.$pickerSelectedValue
                    )
                    .pickerDisplayMode(.menu)
                }
                SettingGroup(header: "单选列表(inline)"){
                    SettingPicker(
                        icon: .system(icon: "hand.raised.fill", backgroundColor: Color.pink),
                        title: "",
                        data: [
                            SettingPickerData("自动",1),
                            SettingPickerData("单选1",2),
                            SettingPickerData("单选2",3)
                        ],
                        value: self.$pickerSelectedValue
                    )
                    .pickerDisplayMode(.inline)
                }
                
                SettingGroup{
                    SettingNavigationLink(destination: AnyView(ImageListPage()),title: "图片列表")
                        .icon("photo.stack", color: .green)
                    
                    SettingButton(title: "Toast临时弹出框",tip: "点击显示") {
                        SettingsView.testTime += 1
                        Toast.show("测试消息:\(SettingsView.testTime)")
                    }
                    .icon(icon: .system(icon: "sparkles", backgroundColor: Color.pink))
                    
                    SettingButton(title: "加载等待框",tip: "点击显示") {
                        Loading.show()
                        Task{
                            await Task.sleep(2_000_000_000)
                            Loading.hide()
                        }
                    }
                    .icon(icon: .system(icon: "sparkles", backgroundColor: Color.pink))
                }
            }
        }
    }
}

