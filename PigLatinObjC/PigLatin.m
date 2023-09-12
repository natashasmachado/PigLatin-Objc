//
//  PigLatin.m
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
  NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
  NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  
  NSMutableArray *pigLatinWords = [NSMutableArray arrayWithCapacity:[words count]];
  
  for (NSString *word in words) {
    if ([word length] == 0) {
      [pigLatinWords addObject:@""];
      continue;
    }
    
    NSRange rangeOfFirstVowel = [word rangeOfCharacterFromSet:vowelSet options:NSCaseInsensitiveSearch];
    
    if (rangeOfFirstVowel.location == NSNotFound) {
      [pigLatinWords addObject:word];
    } else {
      NSString *consonants = [word substringToIndex:rangeOfFirstVowel.location];
      NSString *restOfWord = [word substringFromIndex:rangeOfFirstVowel.location];
      NSString *pigLatinWord = [NSString stringWithFormat:@"%@%@ay", restOfWord, consonants];
      
      [pigLatinWords addObject:pigLatinWord];
    }
  }
  return [pigLatinWords componentsJoinedByString:@" "];
}

@end
