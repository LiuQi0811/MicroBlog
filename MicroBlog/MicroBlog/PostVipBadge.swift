//
//  PostVipBadge.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/23.
//

import SwiftUI

struct PostVipBadge: View {
    let isVip: Bool
    var body: some View {
       // 判断是否是VIP
        if(isVip){
            // vip 表示制作
            Text("V")
                // 字体加粗
                .bold()
                // 系统字体 11
                .font(.system(size: 11))
                // 宽，高 15
                .frame(width: 15,height: 15)
                // 黄色字体
                .foregroundColor(.yellow)
                // 红色背景
                .background(Color.red)
                // 图片裁剪 圆形
                .clipShape(Circle())
                // 创建视图叠加
                .overlay(
                    // 创建圆角矩形视图 圆角7.5 白色的边框
                    RoundedRectangle(cornerRadius: 7.5)
                        .stroke(Color.white,lineWidth: 1)
                )
        }
    }
}

struct PostVipBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVipBadge(isVip: false)
    }
}
