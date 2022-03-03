//
//  NewsArticleView.swift
//  apple_stocks_app
//
//  Created by Erluan Felix Batista on 02/03/22.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticle: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading) {
                    Text("Top News")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(2)
                        .gesture(DragGesture()
                            .onChanged(self.onDragBegin)
                            .onEnded(self.onDragEnd))
                    Text("From News")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding(2)
                }
                Spacer()
            }.contentShape(Rectangle())
                .padding()
                .gesture(DragGesture()
                .onChanged(self.onDragBegin)
                .onEnded(self.onDragEnd))
            
                ScrollView{
                    VStack {
                        ForEach(self.newsArticle, id: \.title) { article in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(article.publication)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color.white)
                                }
                                
                                Spacer()
                                
                                URLImage(URL(string: article.imageURL)!) { image in
                                     image
                                     .resizable()
                                }.frame(width: 100, height: 100)
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
            
        }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", imageURL: "https://prod.static9.net.au/_/media/2019/09/02/10/36/nine_news_melbourne_1600x900_fullstory_nightly6pm.jpg", publication: "The WallStreet Journal")
        
        NewsArticleView(newsArticle: [NewsArticleViewModel(article: article)],
                        onDragBegin: { _ in },
                        onDragEnd: { _ in }
        )
    }
}
