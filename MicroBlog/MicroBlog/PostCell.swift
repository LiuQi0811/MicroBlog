//
//  PostCell.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/19.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    var body: some View {
        
        // 创建垂直堆栈视图
        VStack(alignment: .leading,spacing: 10){
            
            // 用户信息视图
            UserInfoView(post: post)
            
            Text(post.text)
                .font(.system(size: 17)) //系统字体 17号
            
            if(!post.images.isEmpty){ // 图片集不为空
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            Divider() // 分割线
            HStack(spacing: 0){
                Spacer()
                PostCellToolBarButton(image: "message", text: post.commentCountText, color: .black){
                    
                }
                Spacer()
                PostCellToolBarButton(image: "heart", text: post.likeCountText, color: .black){
                    
                }
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 1)
                .padding(.horizontal,-15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
        }
        .padding(.horizontal,15) // 水平间距 15
        .padding(.top,15) // 顶部间距 15
        
        
        
    }
}

struct PostCell_Previews: PreviewProvider {
   
    static var previews: some View {
        PostCell(post: blogs.list[0])
    }
}
