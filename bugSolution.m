The safest approach is to create a copy of the array before modifying it.  Here's how you can fix this:

```objectivec
- (void)someMethod {
    NSArray *arrayCopy = [self.myArray copy];
    [arrayCopy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@"remove"]) { // Check to ensure you are removing appropriate objects
            [self.myArray removeObject:obj]; 
        }
    }];
}
```

Alternatively, iterate through the array in reverse order to avoid index issues from object removal:

```objectivec
- (void)someMethod {
    for (NSInteger i = self.myArray.count - 1; i >= 0; i--) {
        id obj = self.myArray[i];
        if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@"remove"]) { //Check to ensure you are removing appropriate objects
            [self.myArray removeObjectAtIndex:i];
        }
    }
}
```

Remember to always thoroughly check your conditions within the loop to ensure that you are modifying the array in a correct and predictable manner.  Always avoid modifying collections during iteration unless absolutely necessary, and when it is necessary, take the precautions to avoid unexpected behaviour.