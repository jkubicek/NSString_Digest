#import <Foundation/Foundation.h>
#import "NSString+Digest.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSString *input = @"password";
    
    NSString *md5 = [input MD5];
    assert([md5 isEqualToString:@"5f4dcc3b5aa765d61d8327deb882cf99"]);
    
    NSString *sha1 = [input SHA1];
    assert([sha1 isEqualToString:@"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"]);
    
    NSString *sha512 = [input hashWithDigestType:JKStringDigestTypeSHA512];
    assert([sha512 isEqualToString:@"b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86"]);
    
    
    [pool drain];
    return 0;
}
