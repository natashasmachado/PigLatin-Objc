//
//  PigLatin.h
//  PigLatinObjC
//
//  Created by Natasha Machado on 2023-09-10.
//

#import <Foundation/Foundation.h>

@interface NSString (PigLatin)

- (NSString *)stringByPigLatinization;

@end

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization {
  NSCharacterSet *vowelCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
  
  NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  
  NSMutableArray *pigLatinWords = [NSMutableArray arrayWithCapacity:[words count]];
  
  for (NSString *word in words) {
    NSMutableString *pigLatinWord = [NSMutableString stringWithString:word];
    
    NSRange rangeOfFirstVowel = [word rangeOfCharacterFromSet:vowelCharacterSet options:NSCaseInsensitiveSearch];
    
    if (rangeOfFirstVowel.location != NSNotFound) {
      
      NSString *consonants = [word substringToIndex:rangeOfFirstVowel.location];
      [pigLatinWord deleteCharactersInRange:NSMakeRange(0, rangeOfFirstVowel.location)];
      [pigLatinWord appendString:consonants];
      [pigLatinWord appendString:@"ay"];
    }
    
    [pigLatinWords addObject:pigLatinWord];
  }
  
  return [pigLatinWords componentsJoinedByString:@" "];
}

@end
