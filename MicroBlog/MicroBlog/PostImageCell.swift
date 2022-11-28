//
//  PostImageCell.swift
//  MicroBlog
//
//  Created by 刘奇 on 2022/11/26.
//

import SwiftUI

private let kImageSpace: CGFloat = 6

struct PostImageCell: View {
    let images: [String] // 图片名称集合
    let width: CGFloat
    var body: some View {
        ScrollView{
            
            if(images.count == 1){
                Image(uiImage: UIImage(named: images[0])!)
                    .COMMON_PICTURE(w: width, h: width * 0.75)
                    .clipped()
            }else if(images.count == 2){
                PostImageCellRow(images: images, width: width)
            }else if(images.count == 3){
                PostImageCellRow(images: images, width: width)
            }else if(images.count == 4){
                VStack(spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            }else if(images.count == 5){
                VStack(spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            }else if(images.count == 6){
                VStack(spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
            
        }
    }
}




struct PostImageCellRow: View{
    let images: [String]
    let width: CGFloat
    var body: some View{
        HStack(spacing: kImageSpace){
            ForEach(images,id: \.self){ image in
                    Image(uiImage: UIImage(named: image)!)
                    .COMMON_PICTURE(w: (self.width - 6 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count), h: (self.width - 6 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    // 裁剪 多余部分
                    .clipped()

            }
        }
        
    }
}



struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = blogs.list[0].images
        let width = UIScreen.main.bounds.width // 获取屏幕宽度
        return Group{
            PostImageCell(images:Array(images[0...0]),width: width)
            PostImageCell(images:Array(images[0...1]),width: width)
            PostImageCell(images:Array(images[0...2]),width: width)
            PostImageCell(images:Array(images[0...3]),width: width)
        }
        
    }
}
