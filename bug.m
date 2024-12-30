In Objective-C, a common yet subtle error arises from the interaction between ARC (Automatic Reference Counting) and blocks.  Consider this scenario:

```objectivec
@property (nonatomic, strong) NSMutableArray *myArray;

- (void)someMethod {
    [self.myArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // ... some code that modifies self.myArray ...
        [self.myArray removeObject:obj];
    }];
}
```

Modifying `self.myArray` within the block while iterating over it can lead to unexpected behavior, crashes, or data corruption. Removing an object shifts the indices, causing the enumeration to skip elements or access invalid memory locations.