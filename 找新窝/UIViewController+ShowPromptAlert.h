//
//  UIViewController+ShowPromptAlert.h
//  找新窝
//
//  Created by 卜千 郑 on 16/2/21.
//  Copyright © 2016年 卜千 郑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowPromptAlert)
- (void)timerFireMethod:(NSTimer*)theTimer;
- (void)showAlert:(NSString *) _message;
@end
