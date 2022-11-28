//
//  Post.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/23.
//

import Foundation


/**
 微博列表结构体
 */
struct PostList: Codable{
    var list: [Post] // 微博列表
}




// Data Model
/**
 微博结构体
 */
struct Post: Codable,Identifiable{ // 遵循Codable协议 使该结构体 可编码解码
    //  Property 属性
    let id: Int // 编号
    let avatar: String // 头像
    let isVip: Bool // 是否是VIP
    let nickName: String // 昵称
    let date: String // 日期
    var isFollowed: Bool // 是否关注
    let text: String // 文本
    let images: [String] // 图片集
    var commentCount: Int // 评论计数
    var likeCount: Int // 喜欢计数
    var isLiked: Bool // 是否喜欢
    
}



extension Post{ // 微博结构体拓展
    
    var commentCountText: String{ // 评论计数格式化 如果超出1000 可以用 k表示
        if(commentCount <= 0 ){
            return "评论"
        }
        if(commentCount < 1000)
        {
        return "\(commentCount)"
        }
     
    return String(String(format: "%.1fk", Double(commentCount)/1000))
    
    }
    
    var likeCountText: String{ // 喜欢计数格式化 如果超出1000 可以用 k表示
        if(likeCount <= 0 ){
            return "喜欢"
        }
        if(likeCount < 1000)
        {
        return "\(likeCount)"
        }
     
    return String(String(format: "%.1fk", Double(likeCount)/1000))
    
    }
    
}

/**
 解析微博数据 函数方法
 */
func loadPostListData(_ fileName: String) -> PostList
{
    // 通过文件名 获取数据文件的地址
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)// guard保证 取到url
    else{
        // 取不到url进行的操作......
        fatalError("在主捆绑包中找不到\(fileName)")
    }
    // 通过url 加载数据
    guard let data = try? Data(contentsOf: url)// 通过url 创建data 可能会错误 找不到路径 需要异常捕捉 try?
    else{
        // 抛出异常
        fatalError("无法加载\(url)")
    }
    // JOSN数据解析 decode 参数一 解析的数据类型 参数二 从哪个数据源解析
    guard let datas = try? JSONDecoder().decode(PostList.self, from: data)// JOSN 解析可能会错误 需要异常捕捉 try?
    else{
        fatalError("无法解析JSON 数据")
    }
    
    return datas
}

// 微博数据 属于全局变量 都可访问
let blogs = loadPostListData("PostListData_recommend_1.json")

