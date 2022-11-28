//
//  UserInfoView.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/26.
//  用户信息 视图

import SwiftUI

struct UserInfoView: View {
    let post: Post
    var body: some View {
        
        // 创建水平堆栈视图 横向排列
        HStack(spacing: 5){ // 图片和昵称 间距 5
            
            // 创建图片视图
            Image(uiImage: UIImage(named: post.avatar)!)
                .HEAD_PICTURE(size: 50)
                // 创建视图叠加
                .overlay(
                    // 调取VIP徽章视图
                    PostVipBadge(isVip: post.isVip)
                    // 偏移量 x,y 16
                    .offset(x:16,y: 16)
                    
                )
                
                
            
            
            
            // 创建垂直堆栈视图 纵向排列
            VStack(alignment: .leading,spacing: 5){ // 左对齐 5间距
                
                // 用户昵称模块
                Text(post.nickName)
                    // 设置系统字体 大小16
                    .font(Font.system(size: 16))
                    // 设置橙色字体
                    .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                    // 限制文本长度 多余的....表示
                    .lineLimit(1)
                
                Text(post.date)
                    // 设置系统字体 大小11
                    .font(.system(size: 11))
                    // 设置灰色字体
                    .foregroundColor(.gray)
                
                
                
            }
            .padding(.leading,10) // 左边 10间距
            
            // 添加留白 Spacer 占位
            Spacer()
            
         // 判断是否显示 关注按钮
            if(!post.isFollowed){
              
                // 关注模块
                // 创建关注按钮
                Button(action: {
                    print("谢谢你的关注！")
                }){
                    Text("关注")
                    // 设置系统字体 大小14
                    .font(Font.system(size: 14))
                    // 设置橙色字体
                    .foregroundColor(.orange)
                    // 添加frame视图 长50 高26
                    .frame(width: 50,height: 26)
                    // 创建视图叠加
                    .overlay(
                        // 添加 圆角矩形
                        RoundedRectangle(cornerRadius: 13)
                           // stroke 添加描边 lineWidth 边的宽度 1
                            .stroke(Color.red,lineWidth: 1)
                    )
                }
                .buttonStyle(BorderlessButtonStyle()) // 按钮样式
            }
            
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(post: blogs.list[0])
    }
}
