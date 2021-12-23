//
//  main.m
//  CarParts-2
//
//  Created by Waqar Malik on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
//#import "Tire.h"
//#import "Engine.h"
#import "Slant6.h"
#import "AllWeatherRadial.h"


int main (int argc, const char * argv[]) 
{
	Car *car = [Car new];
	
	for (int i = 0; i < 4; i++) {
		Tire *tire = [AllWeatherRadial new];
		
		[car setTire: tire
			 atIndex: i];
	}
	
	Engine *engine = [Slant6 new];
	[car setEngine: engine];
	
	[car print];
	
	return (0);
	
} // main
