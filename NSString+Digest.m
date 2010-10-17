#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Digest.h"

@implementation NSString (NSString_Digest)

- (NSString *)MD5
{ 
    const char *s = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH]; 
    CC_MD5(s, strlen(s), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:(CC_MD5_DIGEST_LENGTH * 2)];
    for (NSUInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [digest appendFormat:@"%02x",result[i]];
    
    return [NSString stringWithString:digest];
}

- (NSString *)SHA1
{ 
    const char *s = [self UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH]; 
    CC_SHA1(s, strlen(s), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:(CC_SHA1_DIGEST_LENGTH * 2)];
    for (NSUInteger i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [digest appendFormat:@"%02x",result[i]];
    
    return [NSString stringWithString:digest];
}

@end
