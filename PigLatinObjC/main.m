//
//  main.m
//  PigLatinObjC
//
//  Created by Natasha Machado on 2023-09-10.
//

#import <Foundation/Foundation.h>
#import "PigLatin.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *inputString = @"Natasha Machado";
    NSString *pigLatinString = [inputString stringByPigLatinization];
    NSLog(@"Pig Latin: %@", pigLatinString);
  }
  return 0;
}

