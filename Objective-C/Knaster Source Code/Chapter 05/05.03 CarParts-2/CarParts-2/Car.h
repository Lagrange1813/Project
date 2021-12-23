//
//  Car.h
//  CarParts-2
//
//  Created by 张维熙 on 2021/12/23.
//

#import <Foundation/Foundation.h>
@class Engine;
@class Tire;

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject
{
    Engine *engine;
    Tire *tires[4];
}

- (Engine *) engine;

- (void) setEngine: (Engine *) newEngine;

- (Tire *) tireAtIndex: (int) index;

- (void) setTire: (Tire *) tire atIndex: (int) index;

- (void) print;

@end

NS_ASSUME_NONNULL_END
