@interface NSString (NSString_Digest)

typedef enum {
    NSStringDigestTypeMD5,
    NSStringDigestTypeSHA1,
    NSStringDigestTypeSHA512
} NSStringDigestType;

- (NSString *)MD5;
- (NSString *)SHA1;

- (NSString *)hashWithDigestType:(NSStringDigestType)type;
@end
