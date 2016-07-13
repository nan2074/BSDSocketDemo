//
//  SNServerViewController.m
//  BSDSocket
//
//  Created by 普伴 on 16/7/13.
//  Copyright © 2016年 Puban. All rights reserved.
//

#import "SNServerViewController.h"
#import <arpa/inet.h>
#import <netdb.h>

@interface SNServerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *port;
@property (weak, nonatomic) IBOutlet UITextView *displayContent;
@property (weak, nonatomic) IBOutlet UITextField *sendContent;
- (IBAction)sendBtn:(id)sender;

@end

@implementation SNServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int socketFileDesctiptor = socket(AF_INET, SOCK_STREAM, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendBtn:(id)sender {
}
@end
