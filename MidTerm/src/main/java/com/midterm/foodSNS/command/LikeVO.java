package com.midterm.foodSNS.command;
/*
CREATE TABLE likeDB (
	likenum INT PRIMARY KEY AUTO_INCREMENT,
    cooknum INT, 
    FOREIGN KEY (cooknum) REFERENCES cookDB (cooknum) ON DELETE CASCADE,
    faNum INT, 
    FOREIGN KEY (faNum) REFERENCES FreeboardArticle (freeboard_article_number) ON DELETE CASCADE,
    bno int,
    FOREIGN KEY (bno) REFERENCES mfreeboard (bno) ON DELETE CASCADE,
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Musers (user_id) ON DELETE CASCADE
);
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class LikeVO {
	private int cooknum;
	private int faNum;
	private int bno;
	private int likenum;
	private String userId;
}
