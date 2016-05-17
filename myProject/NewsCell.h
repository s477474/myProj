//
//  NewsCell.h
//  myProject
//
//  Created by Exception on 16/5/15.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *headerImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UILabel *textContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *gameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameSubTitleLabel;
- (IBAction)viewGameInfo:(UIButton *)sender;
/**
 *  数据源
 */
@property (strong, nonatomic) FeedFeeds* feed;
@property (strong, nonatomic) GameDetailBaseClass* gameModel;







-(void)setDataSource;
@end
