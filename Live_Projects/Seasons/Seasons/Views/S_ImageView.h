//
//  S_ImageView.h
//  LFLLeadAlerts
//
//  Created by IME_MSP_1 on 25/01/13.
//
//

#import <UIKit/UIKit.h>

@interface S_ImageView : UIView
{
     NSURLConnection *urlConnection;
     NSMutableData *mData;
     NSString *urlString;
    
     UIImageView *pImageView;
     UIActivityIndicatorView *loadingIndicator;
}
- (void)setImageFromURL:(NSString *)url;
@end
