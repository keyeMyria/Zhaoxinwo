//
//  ZXWInfoCell.m
//  找新窝
//
//  Created by 卜千 郑 on 16/2/2.
//  Copyright © 2016年 卜千 郑. All rights reserved.
//

#import "ZXWInfoCell.h"
#import "UITitleLabel.h"

@interface ZXWInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorPubTimeLabel;
@property (weak, nonatomic) IBOutlet UITitleLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *similarMessageLabel;
//@property (weak, nonatomic) IBOutlet UIButton *mainContentButton;
@property (weak, nonatomic) IBOutlet UILabel *mainContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *metroLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *jushiLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UICellLabel *cellLabel;
//@property (weak) IBOutlet UIImage *userHeadPortrait;
@property (strong, nonatomic) IBOutlet UIImageView *userHeadPortraitImageView;
@property (weak, nonatomic) IBOutlet UIButton *cellButton;

@end

@implementation ZXWInfoCell

/*
- (instancetype)init {
    self = [super init];
    if (self) {
        UITapGestureRecognizer *cellLabelTapGestureRecognizer =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(cellLabelTapped:)];
        cellLabelTapGestureRecognizer.numberOfTapsRequired = 1;
        [self.cellLabel addGestureRecognizer:cellLabelTapGestureRecognizer];
    }
    return self;
}
 */
- (void)awakeFromNib {
    /*self.mainContentButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.mainContentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.mainContentButton.titleLabel.numberOfLines = 4;*/
    //self.mainContentButton.lin
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setAuthorNameString:(NSString *)authorNameString {
    _authorNameString = [authorNameString copy];
    self.authorNameLabel.text = _authorNameString;
}
- (void)setAuthorPubTimeString:(NSString *)authorPubTimeString {
    _authorPubTimeString = [authorPubTimeString copy];
    self.authorPubTimeLabel.text = _authorPubTimeString;
}
- (void)setPostLinkString:(NSString *)postLinkString {
    _postLinkString = [postLinkString copy];
    self.titleLabel.postLink = _postLinkString;
}
- (void)setTitleString:(NSString *)titleString {
    _titleString = [titleString copy];
    self.titleLabel.text = _titleString;
}
- (void)setSimilarMessageString:(NSString *)similarMessageString {
    _similarMessageString = [similarMessageString copy];
    self.similarMessageLabel.text = _similarMessageString;
}
- (void)setMainContentString:(NSString *)mainContentString {
    _mainContentString = [mainContentString copy];
    /*[self.mainContentButton setTitle:_mainContentString
                            forState:UIControlStateNormal];
    [self.mainContentButton layoutIfNeeded];*/
    self.mainContentLabel.text = _mainContentString;
}
- (void)setMetroString:(NSString *)metroString {
    _metroString = [metroString copy];
    self.metroLabel.text = _metroString;
}
- (void)setAdressString:(NSString *)adressString {
    _adressString = [adressString copy];
    self.adressLabel.text = _adressString;
}
- (void)setJushiString:(NSString *)jushiString {
    _jushiString = [jushiString copy];
    self.jushiLabel.text = _jushiString;
}
- (void)setPriceString:(NSString *)priceString {
    _priceString = [priceString copy];
    self.priceLabel.text = _priceString;
}
- (void)setCellString:(NSString *)cellString {
    _cellString = [cellString copy];
    self.cellLabel.text = _cellString;
}
- (void)setUserHeadPortrait:(UIImage *)userHeadPortrait {
    _userHeadPortrait = [userHeadPortrait copy];
    self.userHeadPortraitImageView.image = _userHeadPortrait;
}
- (void)setCellData:(NSDictionary *)cellData {
    _cellData = [cellData copy];
    NSDictionary *authorInfoDic = _cellData[@"author"];
    self.authorNameString = authorInfoDic[@"name"];
    self.authorPubTimeString = _cellData[@"pub_time"];
    self.titleString = _cellData[@"title"];
    self.mainContentString = _cellData[@"text"];
    self.postLinkString = _cellData[@"url"];
    
    // 重复发帖
    NSArray *simMessages = _cellData[@"sim"];
    NSUInteger simMessageCount = [simMessages count];
    if (simMessageCount > 0) {
        self.similarMessageString = [NSString stringWithFormat:@"重复发帖%lu次", (unsigned long)simMessageCount];
    } else {
        self.similarMessageString = @"";
    }
    
    // 地铁
    NSArray *metroArray = _cellData[@"ditie"];
    NSMutableString *metroLabelString = [NSMutableString stringWithCapacity:80];
    for(NSString *metro in metroArray) {
        [metroLabelString appendString:metro];
        [metroLabelString appendString:@" "];
    }
    self.metroString = metroLabelString;
    /*if (metroArray) {
        for(NSString *metro in metroArray) {
            [metroLabelString appendString:metro];
            [metroLabelString appendString:@" "];
        }
        self.metroString = metroLabelString;
    } else {
       self.metroString = @"";
    }*/
    
    // 地址
    NSArray *adressArray = _cellData[@"dizhi"];
    NSMutableString *adressLabelString = [NSMutableString stringWithCapacity:200];
    for (NSString *adress in adressArray) {
        [adressLabelString appendString:adress];
        [adressLabelString appendString:@" "];
    }
    self.adressString = adressLabelString;
    /*if (adressArray) {
        for (NSString *adress in adressArray) {
            [adressLabelString appendString:adress];
            [adressLabelString appendString:@" "];
        }
        self.adressString = adressLabelString;
    } else {
        self.adressString = @"";
    }*/
    
    // 居室
    NSString *jushiLabelString = _cellData[@"jushi"];
    self.jushiString = jushiLabelString;
    /*if (jushiLabelString) {
        self.jushiString = jushiLabelString;
    } else {
        self.jushiString = @"";
    }*/
    
    // 价格
    NSString *priceLabelString = _cellData[@"zujin"];
    self.priceString = priceLabelString;
    /*if (priceLabelString) {
        //priceLabelString = [priceLabelString stringByAppendingString:@"/月"];
        self.priceString = priceLabelString;
    } else {
        self.priceString = @"";
    }*/
    
    // 手机
    NSString *cellLabelString = _cellData[@"shouji"];
    self.cellString = cellLabelString;
    if ([cellLabelString length] < 5) {
        self.cellLabel.hidden = YES;
        self.cellButton.hidden = YES;
    }
    /*if (cellLabelString) {
        self.cellString = cellLabelString;
    } else {
        self.cellString = @"";
    }*/
    
    
    
    
}
/*
- (IBAction)buttonPressed:(UIButton *)sender {
    (sender.titleLabel.numberOfLines == 4)        ?
            (sender.titleLabel.numberOfLines = 0) :
            (sender.titleLabel.numberOfLines = 4) ;
    CGSize mainContentButtonTitileLableSize = self.mainContentButton.titleLabel.frame.size;
    [self.mainContentButton setFrame:CGRectMake(15, 84, mainContentButtonTitileLableSize.width, mainContentButtonTitileLableSize.height)];
    [self.mainContentButton layoutIfNeeded];
}
*/

/*
- (void)cellLabelTapped:(UIGestureRecognizer *)gr {
    NSLog(@"Recognized tap on cellLabel");
    NSString *telString = @"tel://";
    NSString *urlString = [telString stringByAppendingString:self.cellString];
    NSLog(@"%@", urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
 */
/*
- (IBAction)cellNumberTapped:(id)sender {
    NSString *telString = @"tel://";
    NSString *urlString = [telString stringByAppendingString:self.cellString];
    NSLog(@"%@", urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
 */

@end
