//
//  NewsCell.m
//  myProject
//
//  Created by Exception on 16/5/15.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewGameInfo:(UIButton *)sender {
}

-(void)setDataSource:(FeedFeeds *)feed GameModel:(GameDetailBaseClass*)gameModel;
{
    
    //    设置textContentLabel
    self.textContentLabel.text=feed.content;
    
    //    设置imageview
    NSString *imageUrlString=[[feed.acontent componentsSeparatedByString:@","]firstObject];
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
    
        //    设置标题按钮图片
    if ((int)feed.gamePlatId==0) {
        
        switch (feed.nameId) {
            case -4:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/erbing.png"] forState:UIControlStateNormal];
                break;
            case -3:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/xone.jpg"] forState:UIControlStateNormal];
                break;
            case -2:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/ps4.jpg"] forState:UIControlStateNormal];
                break;
            case -1:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/game.jpg"] forState:UIControlStateNormal];
                break;
                
            default:
                break;
        }
        return;
    }
    [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:[[gameModel.gameHead.images firstObject] valueForKey:@"url"]] forState:UIControlStateNormal];
}
@end
