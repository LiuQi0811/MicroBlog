//
//  PostCellToolBarButton.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/26.
//

import SwiftUI

struct PostCellToolBarButton: View {
    let image: String // 按钮图片名称
    let text: String // 按钮文本名称
    let color: Color // 按钮颜色
    let action: () ->Void // 闭包  closure   按钮执行的方法
    var body: some View {
        Button(action: action){
            HStack(spacing: 5){ // 水平堆栈视图 间距 5
                Image(systemName: image)
                    .COMMON_PICTURE(w: 18, h:18) // 自定义拓展的图片样式
                Text(text)
                    .font(.system(size: 15)) //系统字体 15号
            }
        }
        .foregroundColor(color) //红色
        .buttonStyle(BorderlessButtonStyle()) // 按钮样式
    }
}

struct PostCellToolBarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolBarButton(image: "heart", text: "喜欢", color: .red){
            print("喜欢。。")
        }
    }
}
