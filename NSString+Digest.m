#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Digest.h"

@implementation NSString (NSString_Digest)

- (NSString *)MD5
{ 
    return [self hashWithDigestType:JKStringDigestTypeMD5];
}

- (NSString *)SHA1
{ 
    return [self hashWithDigestType:JKStringDigestTypeSHA1];
}

- (NSString *)hashWithDigestType:(JKStringDigestType)type {
    const char *s = [self UTF8String];
    int digestLength;
    unsigned char * (*digestFunction)(const void *, CC_LONG, unsigned char *) = NULL;
    
    switch (type) {
        case JKStringDigestTypeMD5:
            digestLength = CC_MD5_DIGEST_LENGTH;
            digestFunction = CC_MD5;
            break;
        case JKStringDigestTypeSHA1:
            digestLength = CC_SHA1_DIGEST_LENGTH;
            digestFunction = CC_SHA1;
            break;
        case JKStringDigestTypeSHA512:
            digestLength = CC_SHA512_DIGEST_LENGTH;
            digestFunction = CC_SHA512;
            break;
    }
    
    unsigned char result[digestLength]; 
    digestFunction(s, strlen(s), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:(digestLength * 2)];
    for (NSUInteger i = 0; i < digestLength; i++)
        [digest appendFormat:@"%02x",result[i]];
    
    return [NSString stringWithString:digest];
}

@end
