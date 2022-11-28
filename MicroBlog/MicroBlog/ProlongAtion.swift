//
//  ProlongAtion.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/26.
// 拓展类

import Foundation
import SwiftUI







/**
 图片拓展
 */
extension Image{
    
    /**
       图文图片
     */
    func IMAGE_TEXT() -> some View{
        self
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width - 30 ,height: (UIScreen.main.bounds.width - 30) * 0.75)
            .clipped()
    }
    
    /**
        头像图片
     */
    func HEAD_PICTURE(size: CGFloat) -> some View
    {
      self
            .resizable() // 设置图片可缩放
            .scaledToFill() // 原图的宽高比缩放 填充整个空间
            .frame(width: size,height: size) // 设置图片宽，高
            .clipShape(Circle()) // 图片裁剪 圆形
    }
    
    /**
        图片通用
     */
    func COMMON_PICTURE(w: CGFloat,h: CGFloat) -> some View
    {
        self
            .resizable() // 设置图片可缩放
            .scaledToFill() // 原图的宽高比缩放 填充整个空间
            .frame(width: w,height: h) // 设置图片宽，高

    }
}
