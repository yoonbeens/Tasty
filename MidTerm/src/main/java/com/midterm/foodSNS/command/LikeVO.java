package com.midterm.foodSNS.command;
/*
CREATE TABLE likeDB (
    cooknum INT,
    FOREIGN KEY (cooknum) REFERENCES cookDB(cooknum) ON DELETE CASCADE,
    freeboard_article_number INT,
    FOREIGN KEY (freeboard_article_number) REFERENCES FreeboardArticle(freeboard_article_number) ON DELETE CASCADE,
    likenum INT DEFAULT 0,
    user_ids JSON
);
 */

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class LikeVO {
	private int cooknum;
	private int freeboardArticleNumber;
	private int likenum; //좋아요개수
	private List<String> userIds;
}
