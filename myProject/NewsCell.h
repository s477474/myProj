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




- (IBAction)viewGameInfo:(UIButton *)sender;





-(void)setDataSource:(FeedFeeds *)feed GameModel:(GameDetailBaseClass*)gameModel;
@end
