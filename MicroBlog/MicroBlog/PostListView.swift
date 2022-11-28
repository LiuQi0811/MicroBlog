//
//  PostListView.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/26.
//  微博视图列表

import SwiftUI

struct PostListView: View {
    
//    init(){ // 去除List自带的分割线
//        UITableView.appearance().separatorStyle = .none
//    }
    
    var body: some View {
        
        ScrollView{ //滚动视图
            
            ForEach(blogs.list){ blog in
                NavigationLink(destination: Text("目标视图页面")){ //导航栏跳转
                    PostCell(post: blog)
                        .listRowInsets(EdgeInsets())
                }
                .foregroundColor(.black) //黑色前景色
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ // 导航栏视图
            PostListView()
        }
    }
}
