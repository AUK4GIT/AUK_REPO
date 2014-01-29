//
//  S_ImageView.m
//  Seasons
//  Created by AUK on 27/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_ImageView.h"
#import "S_Helper.h"

@implementation S_ImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setImageFromURL:(NSString *)url
{
    //if image is in cache load from cache...else

    if (urlConnection != nil) {
        [urlConnection cancel];
        urlConnection = nil;
    }
    if (mData != nil) {
        mData = nil;
    }
    
    pImageView = [[UIImageView alloc] init];
    pImageView.contentMode = UIViewContentModeScaleAspectFit;

    pImageView.frame = self.bounds;
    pImageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:pImageView];
    
    if ((url == nil) || [url length] == 0) {
        pImageView.image = [UIImage imageNamed:@"noimage.png"];
        NSLog(@"Url Is Nil");
        return;
    }

    
    if ([S_Helper imageInCache:url]) {
        pImageView.image = [S_Helper getCachedImageForKey:url];
        
        return;
    }
    
    self.bounds = CGRectMake(0, 0, 42, 50);
    
    loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loadingIndicator.center = CGPointMake(21, 25);
    [self addSubview:loadingIndicator];
    [loadingIndicator startAnimating];
    
     // is this necessary if superview gets setNeedsLayout?
    [self setNeedsLayout];
    [pImageView setNeedsLayout];

    urlString = [[NSString alloc] initWithString:url];
    urlConnection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@",error);
    pImageView.image = [UIImage imageNamed:@"noimage.png"];

    [loadingIndicator stopAnimating];
    urlString = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if ([response isKindOfClass:[NSHTTPURLResponse class]])
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
        //If you need the response, you can use it here
        NSDictionary *dicFields = [httpResponse allHeaderFields];
        
        NSLog(@"didReceiveResponse: %@ %d",dicFields,httpResponse.statusCode);
        
//        if (([[dicFields valueForKey:@"Content-Type"] isEqualToString:@"image/jpeg"] || [[dicFields valueForKey:@"Content-Type"] isEqualToString:@"image/jpg"] || [[dicFields valueForKey:@"Content-Type"] isEqualToString:@"image/png"] || [[dicFields valueForKey:@"Content-Type"] isEqualToString:@"image/bmp"]) && (httpResponse.statusCode == 200))
//        {
//            
//        }
        
        if (httpResponse.statusCode != 200)
        {
            NSLog(@"Error: Image format not supported");
            pImageView.image = [UIImage imageNamed:@"noimage.png"];
            [urlConnection cancel];
            [loadingIndicator stopAnimating];
            urlString = nil;
        }
        
    }

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"didReceiveData: %@",data);
    
    if (mData==nil) {
        mData = [[NSMutableData alloc] init];
    }
    [mData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    urlConnection = nil;
    [loadingIndicator stopAnimating];
    NSLog(@"Data length: %d %f",[mData length],[UIImage imageWithData:mData].size.height);
    UIImage *resizedImage = [self resizeImage:[UIImage imageWithData:mData]];
    
    pImageView.image = resizedImage;
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(resizedImage)];
    NSLog(@"resized image length: %d",[imageData length]);
    NSLog(@"resized Image size width: %f height: %f",[UIImage imageWithData:imageData].size.width,[UIImage imageWithData:imageData].size.height);

    [self cacheData:imageData forKey:urlString];
    
    urlString = nil;
    mData = nil;
}

- (void)cacheData:(NSData *)data forKey:(NSString *)url
{
    [S_Helper cacheData:data forKey:url];
}

-(UIImage *)resizeImage:(UIImage *)image {
    
    NSLog(@"Original Image size width: %f height: %f",image.size.width,image.size.height);

    int w = image.size.width;
    
    int h = image.size.height;

    
    CGImageRef imageRef = [image CGImage];
    
    int width, height;
    
    int destWidth = 42;
    
    int destHeight = 50;
    
    if(w > h){
        
        width = destWidth;
        
        height = h*destWidth/w;
        
    } else {
        
        height = destHeight;
        
        width = w*destHeight/h;
        
    }
    NSLog(@"Resized Image size height: %d width: %d",height,width);

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bitmap;
    
    bitmap = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorSpace, kCGImageAlphaPremultipliedFirst);
    
    CGColorSpaceRelease(colorSpace);
    
    if (image.imageOrientation == UIImageOrientationLeft) {
        
        CGContextRotateCTM (bitmap, M_PI/2);
        
        CGContextTranslateCTM (bitmap, 0, -height);
        
    } else if (image.imageOrientation == UIImageOrientationRight) {
        
        CGContextRotateCTM (bitmap, -M_PI/2);
        
        CGContextTranslateCTM (bitmap, -width, 0);
        
    } else if (image.imageOrientation == UIImageOrientationUp) {
        
    } else if (image.imageOrientation == UIImageOrientationDown) {
        
        CGContextTranslateCTM (bitmap, width,height);
        
        CGContextRotateCTM (bitmap, -M_PI);
        
    }
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    
    UIImage *result = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    
    CGImageRelease(ref);
    
    return result;
    
}

@end
