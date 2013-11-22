//
//  TodayViewController.m
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController ()
{
    TodayPMViewController *todayPMView;
    int count;
    bool isSaved;
}
@end

@implementation TodayViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self viewDidLoad];
    
    isSaved = false;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    if(self.objScale == nil)
        self.objScale = [[RatingScale alloc]init];
    [[self objScale] reloadData];
    [self setCurrentRating];
    count = [[self objScale] getDayCount];
    isSaved = NO;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    //date for today
    NSDate *today = [[NSDate alloc] init];
    
    self.navigationItem.title = [NSString stringWithFormat: @"Today - %@",[dateFormatter stringFromDate:today]];
    
    self.dayLabel.text = [NSString stringWithFormat:@"Day %d", count];
    //end
    
    self.quoteArray = [[NSArray alloc] initWithObjects:@"Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",@"Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs",@"Strive not to be a success, but rather to be of value. –Albert Einstein",@"Two roads diverged in a wood, and I took the one less traveled by, and that has made all the difference.  –Robert Frost",@"The common question that gets asked in business is, ‘why?’ That’s a good question, but an equally valid question is, ‘why not?’ -Jeffrey Bezos",@"You miss 100% of the shots you don’t take. –Wayne Gretzky",@"I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed. –Michael Jordan",@"Every strike brings me closer to the next home run. –Babe Ruth",@"Definiteness of purpose is the starting point of all achievement. –W. Clement Stone",@"Life is what happens to you while you’re busy making other plans. –John Lennon",@"We become what we think about. –Earl Nightingale",@"Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover. –Mark Twain",@"Life is 10% what happens to me and 90% of how I react to it. –John Maxwell",@"If you do what you’ve always done, you’ll get what you’ve always gotten. –Tony Robbins",@"The mind is everything. What you think you become.  –Buddha",@"The best time to plant a tree was 20 years ago. The second best time is now. –Chinese Proverb",@"An unexamined life is not worth living. –Socrates",@"Eighty percent of success is showing up. –Woody Allen",@"Don’t wait. The time will never be just right. –Napoleon Hill",@"Winning isn’t everything, but wanting to win is. –Vince Lombardi",@"I am not a product of my circumstances. I am a product of my decisions. –Stephen Covey",@"Every child is an artist.  The problem is how to remain an artist once he grows up. –Pablo Picasso",@"You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus",@"I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou",@"Either you run the day, or the day runs you. –Jim Rohn",@"Whether you think you can or you think you can’t, you’re right. –Henry Ford",@"The two most important days in your life are the day you are born and the day you find out why. –Mark Twain",@"Whatever you can do, or dream you can, begin it.  Boldness has genius, power and magic in it. –Johann Wolfgang von Goethe",@"The best revenge is massive success. –Frank Sinatra",@"People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily. –Zig Ziglar",@"Inspiration exists, but it must find you working. –Pablo Picasso",@"If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced. –Vincent Van Gogh",@"There is only one way to avoid criticism: do nothing, say nothing, and be nothing. –Aristotle",@"Obstacles are those frightful things you see when you take your eyes off the goal. –Henry Ford",@"The only person you are destined to become is the person you decide to be. –Ralph Waldo Emerson",@"Go confidently in the direction of your dreams.  Live the life you have imagined. –Henry David Thoreau",@"When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me. –Erma Bombeck",@"Successful people are always looking for opportunities to help others.  Unsuccessful people are always asking, “What’s in it for me?” – Brian Tracy",@"Certain things catch your eye, but pursue only those that capture the heart. – Ancient Indian Proverb",@"Believe you can and you’re halfway there. –Theodore Roosevelt",@"Everything you’ve ever wanted is on the other side of fear. –George Addair",@"We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light. –Plato",@"Once you choose hope, anything’s possible. –Christopher Reeve",@"Start where you are. Use what you have.  Do what you can. –Arthur Ashe",@"When I was 5 years old, my mother always told me that happiness was the key to life.  When I went to school, they asked me what I wanted to be when I grew up.  I wrote down ‘happy’.  They told me I didn’t understand the assignment, and I told them they didn’t understand life. –John Lennon",@"Fall seven times and stand up eight. –Japanese Proverb",@"When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. –Helen Keller",@"Everything has beauty, but not everyone can see. –Confucius",@"How wonderful it is that nobody need wait a single moment before starting to improve the world. –Anne Frank",@"When I let go of what I am, I become what I might be. –Lao Tzu",@"The difference between a successful person and others is not lack of strength not a lack of knowledge but rather a lack of will. –Vince Lombardi",@"Happiness is not something readymade.  It comes from your own actions. –Dalai Lama",@"The only way of finding the limits of the possible is by going beyond them into the impossible. –Arthur C. Clarke",@"First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end. –Aristotle",@"If the wind will not serve, take to the oars. –Latin Proverb",@"You can’t fall if you don’t climb.  But there’s no joy in living your whole life on the ground. –Unknown",@"Whoever loves much, performs much, and can accomplish much, and what is done in love is done well. –Vincent Van Gogh",@"Too many of us are not living our dreams because we are living our fears. –Les Brown",@"Challenges are what make life interesting and overcoming them is what makes life meaningful. –Joshua J. Marine",@"The way to get started is to quit talking and begin doing. –Walt Disney",@"I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do. –Leonardo da Vinci",@"Limitations live only in our minds.  But if we use our imaginations, our possibilities become limitless. –Jamie Paolinetti",@"Expose yourself to your deepest fear; after that, fear has no power, and the fear of freedom shrinks and vanishes.  You are free. –Jim Morrison",@"What’s money? A man is a success if he gets up in the morning and goes to bed at night and in between does what he wants to do. –Bob Dylan",@"I didn’t fail the test. I just found 100 ways to do it wrong. –Benjamin Franklin",@"In order to succeed, your desire for success should be greater than your fear of failure. –Bill Cosby",@"A person who never made a mistake never tried anything new. – Albert Einstein",@"The person who says it cannot be done should not interrupt the person who is doing it. –Chinese Proverb",@"There are no traffic jams along the extra mile. –Roger Staubach",@"It is never too late to be what you might have been. –George Eliot",@"You become what you believe. –Oprah Winfrey",@"I would rather die of passion than of boredom. –Vincent van Gogh",@"A truly rich man is one whose children run into his arms when his hands are empty. –Unknown",@"It is not what you do for your children, but what you have taught them to do for themselves, that will make them successful human beings.  –Ann Landers",@"If you want your children to turn out well, spend twice as much time with them, and half as much money. –Abigail Van Buren",@"Build your own dreams, or someone else will hire you to build theirs. –Farrah Gray",@"Without deviation from the norm, progress is not possible. –Frank Zappa",@"Education costs money.  But then so does ignorance. –Sir Claus Moser",@"Remember that the happiest people are not those getting more, but those giving more. –H. Jackson Brown, Jr.",@"It does not matter how slowly you go as long as you do not stop. –Confucius",@"Let the refining and improving of your own life keep you so busy that you have little time to criticize others. –H. Jackson Brown, Jr.",@"Remember that not getting what you want is sometimes a wonderful stroke of luck. –Dalai Lama",@"You can’t use up creativity.  The more you use, the more you have. –Maya Angelou",@"Dream big and dare to fail. –Norman Vaughan",@"Our lives begin to end the day we become silent about things that matter. –Martin Luther King Jr.",@"Do what you can, where you are, with what you have. –Teddy Roosevelt",@"The most common way people give up their power is by thinking they don’t have any. –Alice Walker",@"Dreaming, after all, is a form of planning. –Gloria Steinem",@"It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live. –Mae Jemison",@"You may be disappointed if you fail, but you are doomed if you don’t try. –Beverly Sills",@"Remember no one can make you feel inferior without your consent. –Eleanor Roosevelt",@"Life is what we make it, always has been, always will be. –Grandma Moses",@"The question isn’t who is going to let me; it’s who is going to stop me. –Ayn Rand",@"When everything seems to be going against you, remember that the airplane takes off against the wind, not with it. –Henry Ford",@"It’s not the years in your life that count. It’s the life in your years. –Abraham Lincoln",@"Change your thoughts and you change your world. –Norman Vincent Peale",@"Either write something worth reading or do something worth writing. –Benjamin Franklin",@"Nothing is impossible, the word itself says, “I’m possible!” –Audrey Hepburn",@"The only way to do great work is to love what you do. –Steve Jobs",@"If you can dream it, you can achieve it. –Zig Ziglar",nil];
    //random generate quote and display quote
    int index = arc4random() %100;
    self.quoteLabel.text = self.quoteArray[index];
    //Wrap Text
    self.quoteLabel.numberOfLines = 0;
    self.quoteLabel.adjustsFontSizeToFitWidth = YES;
    
    
    //hides the back button
    self.navigationItem.hidesBackButton = YES;
    
    //count++;
    //count = 0;
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    if(!isSaved)
    {
        [self getCurrentRating];
        [self.objScale setRating];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
//Action when button tapped
- (IBAction)btnTapped:(id)sender {
    
    //Store the rating info
    [self getCurrentRating];
    [self.objScale setRating];
    isSaved = YES;
    
    //navigate to TodayPMViewController
    
    if(todayPMView == nil)
    {
        todayPMView = [self.storyboard instantiateViewControllerWithIdentifier:@"tonightVC"];
    }
    
    todayPMView.objScale = self.objScale;
    
    [self.navigationController pushViewController:todayPMView animated:YES];
    
    //[self.navigationController popViewControllerAnimated:YES];
    
    //code to save the selections...
    
    //-----------
    
    GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
    NSMutableArray * array;
    
    int dayCount = 0;
    double score = 0.0;
    for(int i = 1; i<=5 ; i++)
    {
        //Get number of day of the period
        dayCount = [objGoalDetail getDayCount:i];
        NSLog(@"Goal %d - Number of days : %d", i, dayCount);
        
        //if(dayCount == 0)
         //   continue;
        
        
        //Get the Scores of Goal i th;  ( i from 1 to 5)
        array = [objGoalDetail getScoreData:i];
        
        // get scores <scores are store in array from element 1 to (array.count -1) >
        for( int j = 1 ; j < array.count; j++)
        {
            
             score =   [[array objectAtIndex:j] doubleValue];
            NSLog(@"Goal %d : Score of day %d : %f",i,j,score);
        }
    }
    
    //-------------
    
}

-(void)resetArrayRating{
    [self.objScale.arrRating removeAllObjects];
    
    for(int i =0; i<5; i++){
        [self.objScale.arrRating addObject:[NSNumber numberWithInt:1]];
    }
}

-(void)getCurrentRating{
    [self resetArrayRating];
    
    NSInteger value;
    
    value = [[self ratingSegment01]selectedSegmentIndex] + 1;
    [self.objScale.arrRating replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment02]selectedSegmentIndex] + 1;
    [self.objScale.arrRating replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment03]selectedSegmentIndex] + 1;
    [self.objScale.arrRating replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment04]selectedSegmentIndex] + 1;
    [self.objScale.arrRating replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment05]selectedSegmentIndex] + 1;
    [self.objScale.arrRating replaceObjectAtIndex:4 withObject:[NSNumber numberWithInt:value]];

}

-(void)setCurrentRating{
    self.ratingSegment01.selectedSegmentIndex = [[self.objScale.arrRating objectAtIndex:0] intValue] - 1;
    self.ratingSegment02.selectedSegmentIndex = [[self.objScale.arrRating objectAtIndex:1] intValue] - 1;
    self.ratingSegment03.selectedSegmentIndex = [[self.objScale.arrRating objectAtIndex:2] intValue] -1 ;
    self.ratingSegment04.selectedSegmentIndex = [[self.objScale.arrRating objectAtIndex:3] intValue] -1 ;
    self.ratingSegment05.selectedSegmentIndex = [[self.objScale.arrRating objectAtIndex:4] intValue] -1;
}


- (IBAction)segRate01:(id)sender {}

- (IBAction)segRate02:(id)sender {}

- (IBAction)segRate03:(id)sender {}

- (IBAction)segRate04:(id)sender {}

- (IBAction)segRate05:(id)sender {}
@end
