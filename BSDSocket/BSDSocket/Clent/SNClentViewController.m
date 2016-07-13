//
//  SNClentViewController.m
//  BSDSocket
//
//  Created by 普伴 on 16/7/13.
//  Copyright © 2016年 Puban. All rights reserved.
//

#import "SNClentViewController.h"
#import <arpa/inet.h>
#import <netdb.h>

@interface SNClentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *IPAddress;
@property (weak, nonatomic) IBOutlet UITextField *port;
@property (weak, nonatomic) IBOutlet UITextView *displayContent;
@property (weak, nonatomic) IBOutlet UITextField *sendContent;
- (IBAction)sendBtn:(id)sender;
- (IBAction)connectBtn:(id)sender;

@end

@implementation SNClentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
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

- (IBAction)connectBtn:(id)sender {
    
    NSString *urlString = [NSString stringWithFormat:@"https://%@",self.IPAddress.text];
    NSURL *url = [NSURL URLWithString:urlString];
    int socketFileDesctiptor = socket(AF_INET, SOCK_STREAM, 0);
    
    struct hostent *remoteHostEnt = gethostbyname([[url host] UTF8String]);
    
    struct in_addr *remoteInAddr = (struct in_addr *)remoteHostEnt->h_addr_list[0];
    
    struct sockaddr_in socketParameters;
    socketParameters.sin_family = AF_INET;
    socketParameters.sin_addr = *remoteInAddr;
    socketParameters.sin_port = htons([self.port.text intValue]);
    
    long flag = connect(socketFileDesctiptor, (struct sockaddr *)&socketParameters, sizeof(socketParameters));
    
    NSMutableData *data = [[NSMutableData alloc] init];
    BOOL watingForData = YES;
    const char *buffer[1024];
    
    while (watingForData == YES) {
        int length = sizeof(buffer);
        long result = recv(socketFileDesctiptor, &buffer, length, 0);
        if (result > 0) {
            [data appendBytes:buffer length:length];
        }else {
            watingForData = NO;
        }

    }
    
    close(socketFileDesctiptor);
    
    
    NSString *resultString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",resultString);
    

}
@end
