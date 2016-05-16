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
    NSLog(@"%@",self);
}

-(void)setDataSource;
{
    self.btn1.hidden=NO;
    //    设置textContentLabel
    self.textContentLabel.text=self.feed.content;
    
//    设置时间label
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//    formatter.dateStyle=kCFDateFormatterLongStyle;


    
    
    
     NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
     [formatter setDateFormat:@"EE, dd MMM YYY HH:mm:ss z"];
    NSDate* now = [NSDate date];
     NSString* dateString = [formatter stringFromDate:now];
    NSString *createTimeString=[self.feed.createTime stringByAppendingString:@"+8"];
    NSDate *createdate=[formatter dateFromString:createTimeString];
    NSDate *currentDate=[formatter dateFromString:dateString];
    NSTimeInterval interval=[currentDate timeIntervalSinceDate:createdate]-3600*8;

    if ((interval/3600>1)&&(interval/3600<60)) {
        self.gameSubTitleLabel.text=[NSString stringWithFormat:@"%.0f小时前",interval/(60*60)];
    }else if ((interval/60)>1&&(interval/60<60)) {
        self.gameSubTitleLabel.text=[NSString stringWithFormat:@"%.0f分钟前",interval/60];
    }else if ((interval/(60*60*24))>1 && (interval/(60*60*24))<31){
        self.gameSubTitleLabel.text=[NSString stringWithFormat:@"%.0f天前",interval/(60*60*24)];
    }else if (interval>0&&interval<60)
        self.gameSubTitleLabel.text=[NSString stringWithFormat:@"%.0f秒前",interval];
    else  self.gameSubTitleLabel.text=[NSString stringWithFormat:@"%.0f月前",interval/(60*60*24*31)];
        
    //    设置imageview
    NSString *imageUrlString=[[self.feed.acontent componentsSeparatedByString:@","]firstObject];
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
    
        //    设置标题按钮图片
    if (_feed.gamePlatId==0) {
        self.btn1.hidden=YES;
        
        switch (_feed.nameId) {
            case -4:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/erbing.png"] forState:UIControlStateNormal];
                self.gameTitleLabel.text=@"二柄游戏";
                break;
            case -3:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/xone.jpg"] forState:UIControlStateNormal];
                self.gameTitleLabel.text=@"XBOX新闻";
                break;
            case -2:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/ps4.jpg"] forState:UIControlStateNormal];
                self.gameTitleLabel.text=@"PS新闻";
                break;
            case -1:
                [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:@"http://vgimg.oss-cn-hangzhou.aliyuncs.com/gamelogo/game.jpg"] forState:UIControlStateNormal];
                self.gameTitleLabel.text=@"游戏新闻";
                break;
                
            default:
                break;
        }
        return;
    }
    self.gameTitleLabel.text=self.feed.gameName;
    [self.headerImageBtn sd_setImageWithURL:[NSURL URLWithString:[[self.gameModel.gameHead.images firstObject] valueForKey:@"url"]] forState:UIControlStateNormal];
}
@end
