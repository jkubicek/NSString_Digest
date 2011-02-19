#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Digest.h"

@implementation NSString (NSString_Digest)

- (NSString *)MD5
{ 
    return [self hashWithDigestType:NSStringDigestTypeMD5];
}

- (NSString *)SHA1
{ 
    return [self hashWithDigestType:NSStringDigestTypeSHA1];
}

- (NSString *)hashWithDigestType:(NSStringDigestType)type {
    const char *s = [self UTF8String];
    int digestLength;
    
    switch (type) {
        case NSStringDigestTypeMD5:
            digestLength = CC_MD5_DIGEST_LENGTH;
            break;
        case NSStringDigestTypeSHA1:
            digestLength = CC_SHA1_DIGEST_LENGTH;
            break;
        case NSStringDigestTypeSHA512:
            digestLength = CC_SHA512_DIGEST_LENGTH;
            break;
    }
    
    unsigned char result[digestLength]; 
    
    switch (type) {
        case NSStringDigestTypeMD5:
            CC_MD5(s, strlen(s), result);
            break;
        case NSStringDigestTypeSHA1:
            CC_SHA1(s, strlen(s), result);
            break;
        case NSStringDigestTypeSHA512:
            CC_SHA512(s, strlen(s), result);
            break;
    }
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:(digestLength * 2)];
    for (NSUInteger i = 0; i < digestLength; i++)
        [digest appendFormat:@"%02x",result[i]];
    
    return [NSString stringWithString:digest];
}

@end
