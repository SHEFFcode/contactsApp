//
//  JSON.m
//  contactsApp
//
//  Created by Yuriy Shefer on 4/21/15.
//  Copyright (c) 2015 SHEFFcode. All rights reserved.
//

#import "JSON2.h"
#import "ContactDetailViewController.h"

@implementation JSON

- (void) parse {
    
    //Initialize the values passed in from ContactSummaryViewController.
    NSUserDefaults *userDefaults2 = [NSUserDefaults standardUserDefaults];
    self.indexPath = [userDefaults2 integerForKey:@"indexPath"];
    self.jsonArray = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"jsonArray"]];
    
    //JSON Detail URL Request
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    NSURL *url2 = [NSURL URLWithString:[[self.jsonArray objectAtIndex:self.indexPath] valueForKeyPath:@"detailsURL"]];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    [[NSURLConnection alloc]initWithRequest:request2 delegate:self];
    
}

#pragma mark - JSON
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    self.detailData = [[NSMutableData alloc]init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)JSONdata {
    
    [self.detailData appendData:JSONdata];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
    
    self.jsonDetailArray = [NSJSONSerialization JSONObjectWithData:self.detailData options:nil error:nil];
    
    NSUserDefaults *userDefaults3 = [NSUserDefaults standardUserDefaults];
    [userDefaults3 setObject:self.jsonDetailArray forKey:@"jsonDetailArray"];
    [userDefaults3 synchronize];

    //Update labels in the view controller.
    [self.delegate setlabels];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"The download could not complete. Make sure you are connected to the internet" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alertView show];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
}



@end
