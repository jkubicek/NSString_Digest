@interface NSString (NSString_Digest)

typedef enum {
    JKStringDigestTypeMD5,
    JKStringDigestTypeSHA1,
    JKStringDigestTypeSHA512
} JKStringDigestType;

- (NSString *)MD5;
- (NSString *)SHA1;

- (NSString *)hashWithDigestType:(JKStringDigestType)type;
@end
