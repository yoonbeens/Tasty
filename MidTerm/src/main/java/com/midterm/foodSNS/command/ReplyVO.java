package com.midterm.foodSNS.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE reply (
    rno INT PRIMARY KEY AUTO_INCREMENT,
    cooknum INT,
    FOREIGN KEY (cooknum)
        REFERENCES cookdb (cooknum)
        ON DELETE CASCADE,
	faNum int,
    foreign key (faNum)
		references freeboardarticle (freeboard_article_number)
        on delete cascade,
	bno int,
    foreign key (bno)
		references Mfreeboard (bno)
        on delete cascade,
    reply VARCHAR(1000),
    user_id VARCHAR(50),
    foreign key (user_id)
		references Musers (user_id)
        on delete cascade,
	user_nick varchar(50),
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);
 */

@Setter @Getter @ToString
public class ReplyVO {
	
	private int rno;
	private int cooknum;
	private int faNum;
	private int bno;
	
	private String reply;
	private String userId;
	private String userNick;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private LocalDateTime replyDate;
	private LocalDateTime updateDate;

}
