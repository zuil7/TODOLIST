//
//  Global.h
//  
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/sysctl.h>
//#import "User.h"


@class User;
//----------------------------------------------------------------------
// Global - Singleton Class consists of Factory Methods
//----------------------------------------------------------------------
@interface Global : NSObject

@property(strong,nonatomic) UINavigationController *navController;
@property(strong,nonatomic) UITabBarController *mainTabController;

@property(strong,nonatomic) NSString *emailStr;
//@property(strong,nonatomic) User *userInstance;
@property(assign,nonatomic) BOOL isFromCamera;
@property(assign,nonatomic) BOOL isComingSearch;

@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *accessToken;
@property(strong,nonatomic) NSString *deviceToken;



+ (Global*)sharedInstance;

- (id) loadStoryBoardId:(NSString *) storyBoardID;
- (void) showAlert:(NSString *)title message:(NSString *)message toView:(id) view;
- (NSString *) showAppVersion;
- (NSString *) getDeviceID;
- (NSString *) encodeToPercentEscapeString:(NSString *)string;
- (NSString *) decodeFromPercentEscapeString:(NSString *)string;
- (NSString *) platformString;
- (NSArray *) loadPlistfile:(NSString *)name forKey:(NSString *)key;
- (NSString *) encrpyt:(NSString *) encrpytStr;
- (NSString *) decrpyt:(NSString *) decrpytStr;


- (BOOL) hasConnection;


+ (BOOL)isStringNumeric:(NSString *)aString;
+ (NSString *)separateString:(NSString *)str withOccuredString:(NSString *)kString;
+ (NSString *)formatString:(double)total withGroupSize:(int)size;
+ (NSString *)convertDateToString:(NSDate *)yourDate wantedFormat:(NSString *)format;
+ (NSDate *)convertStringToDate:(NSString *)yourStringDate wantedFormat:(NSString *)format;

+ (NSDictionary *)loadPlistfile:(NSString *)name;

+ (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (BOOL)isValidEmailString:(NSString *)emailString;


@end
