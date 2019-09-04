---
title: iOS 数据转换（持续更新）
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
NSString --> NSArray
```
NSArray *arr = [str componentsSeparatedByString:@","];
```
NSArray --> NSString
```
NSString *str = [arr componentsJoinedByString:@","];
```
NSString --> NSData
```
NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding]; 
```
NSData --> NSString
```
NSString *str = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding]; 
```
NSDate --> NSString
```
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
NSString *str = [dateFormatter stringFromDate:date];
```
NSString --> NSDate
```
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
NSDate *date = [dateFormatter dateFromString:str];
```
NSString --> NSDictionary
```
NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
```
NSDictionary --> NSString
```
NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
NSString*str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
```
NSArray --> NSData
 ```
NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
```
NSData --> NSArray
```
NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
```
NSDictionary --> NSData
```
NSMutableData *data = [[NSMutableData alloc] init];
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data]; 
[archiver encodeObject:dic forKey:@"Some Key Value"]; 
[archiver finishEncoding];
```
NSData --> NSDictionary
```
NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data]; 
NSDictionary *dic = [unarchiver decodeObjectForKey:@"Some Key Value"]; 
[unarchiver finishDecoding];
```
UIImage --> NSData
```
+ (NSData *)imageToData:(UIImage *)image CompressionNum:(int)num
{
    return UIImageJPEGRepresentation(image, num)?:UIImagePNGRepresentation(image);
}
```