//
//  GraphViewController.m
//  App
//
//  Created by Craig Steinke on 11/21/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()

@property (nonatomic, strong) CPTScatterPlot *plot1;
@property (nonatomic, strong) CPTScatterPlot *plot2;
@property (nonatomic, strong) CPTScatterPlot *plot3;
@property (nonatomic, strong) CPTScatterPlot *plot4;
@property (nonatomic, strong) CPTScatterPlot *plot5;

@end

@implementation GraphViewController

@synthesize plot1 = _plot1;
@synthesize plot2 = _plot2;
@synthesize plot3 = _plot3;
@synthesize plot4 = _plot4;
@synthesize plot5 = _plot5;

- (CPTScatterPlot *)plot1
{
    if (!_plot1)
    {
        _plot1 = [[CPTScatterPlot alloc] init];
    }
    return _plot1;
}

- (CPTScatterPlot *)plot2
{
    if (!_plot2)
    {
        _plot2 = [[CPTScatterPlot alloc] init];
    }
    return _plot2;
}

- (CPTScatterPlot *)plot3
{
    if (!_plot3)
    {
        _plot3 = [[CPTScatterPlot alloc] init];
    }
    return _plot3;
}

- (CPTScatterPlot *)plot4
{
    if (!_plot4)
    {
        _plot4 = [[CPTScatterPlot alloc] init];
    }
    return _plot4;
}

- (CPTScatterPlot *)plot5
{
    if (!_plot5)
    {
        _plot5 = [[CPTScatterPlot alloc] init];
    }
    return _plot5;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureHost];
    [self configureGraph];
    [self configurePlots];
    [self configureAxes];
}

- (void)configureHost
{
    CGRect graphBounds = CGRectMake(self.view.bounds.origin.x,
                                    self.view.bounds.origin.y + 64,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.height/2 + 64);
    _hostView = [[CPTGraphHostingView alloc] initWithFrame:graphBounds];
    _hostView.allowPinchScaling = 0;
    [self.view addSubview:_hostView];
}

- (void)configureGraph
{
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:_hostView.bounds];
    [graph applyTheme:[CPTTheme themeNamed: kCPTPlainWhiteTheme]];
    _hostView.hostedGraph = graph;
    
    /*graph.title = @"Graph Title";
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [CPTColor blackColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 24.0f;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, 0.0f);*/
}

- (void)configurePlots
{
    CPTGraph *graph = _hostView.hostedGraph;
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.allowsUserInteraction = 0;
    
    self.plot1.dataSource = self;
    self.plot2.dataSource = self;
    self.plot3.dataSource = self;
    self.plot4.dataSource = self;
    self.plot5.dataSource = self;
    [graph addPlot:self.plot1 toPlotSpace:plotSpace];
    
    //Zoom and Position of view over plot
    float count = [[NSNumber numberWithUnsignedInteger:
                    [self numberOfRecordsForPlot:self.plot1]] floatValue];
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:[[NSNumber numberWithFloat:count*-.11f]
                                                            decimalValue]
                                                    length:[[NSNumber numberWithFloat:count*1.12f]
                                                            decimalValue]];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:[[NSNumber numberWithFloat:-0.6] decimalValue]
                                                    length:[[NSNumber numberWithInt:6] decimalValue]];
    
    CPTMutableLineStyle *lineStyle = [self.plot1.dataLineStyle mutableCopy];
    lineStyle.lineWidth = 2.5;
    lineStyle.lineColor = [CPTColor blueColor];
    self.plot1.dataLineStyle = lineStyle;
    self.plot2.dataLineStyle = lineStyle;
    self.plot3.dataLineStyle = lineStyle;
    self.plot4.dataLineStyle = lineStyle;
    self.plot5.dataLineStyle = lineStyle;
    
    CPTMutableLineStyle *symbolLineStyle = [CPTMutableLineStyle lineStyle];
    symbolLineStyle.lineColor = [CPTColor blueColor];
    CPTPlotSymbol *symbol = [CPTPlotSymbol ellipsePlotSymbol];
    symbol.fill = [CPTFill fillWithColor:[CPTColor blueColor]];
    symbol.lineStyle = symbolLineStyle;
    symbol.size = CGSizeMake(6.0f, 6.0f);
    self.plot1.plotSymbol = symbol;
    self.plot2.plotSymbol = symbol;
    self.plot3.plotSymbol = symbol;
    self.plot4.plotSymbol = symbol;
    self.plot5.plotSymbol = symbol;
}

- (void)configureAxes
{
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [CPTColor blackColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 12.0f;
    
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 2.0f;
    axisLineStyle.lineColor = [CPTColor blackColor];
    
    CPTMutableTextStyle *axisTextStyle = [[CPTMutableTextStyle alloc] init];
    axisTextStyle.color = [CPTColor blackColor];
    axisTextStyle.fontName = @"Helvetica-Bold";
    axisTextStyle.fontSize = 11.0f;
    
    CPTMutableLineStyle *tickLineStyle = [CPTMutableLineStyle lineStyle];
    tickLineStyle.lineColor = [CPTColor blackColor];
    tickLineStyle.lineWidth = 2.0f;
    
    CPTMutableLineStyle *gridLineStyle = [CPTMutableLineStyle lineStyle];
    gridLineStyle.lineColor = [CPTColor grayColor];
    gridLineStyle.lineWidth = 1.0f;
    
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) _hostView.hostedGraph.axisSet;
    
    // X AXIS
    CPTAxis *x = axisSet.xAxis;
    x.titleTextStyle = axisTitleStyle;
    x.titleOffset = 15.0f;
    x.axisLineStyle = axisLineStyle;
    x.labelingPolicy = CPTAxisLabelingPolicyNone;
    x.labelTextStyle = axisTextStyle;
    x.majorTickLineStyle = tickLineStyle;
    x.majorTickLength = 4.0f;
    x.tickDirection = CPTSignNegative;
    
    int DAY_CUTOFF  = 21;
    int WEEK_CUTOFF = 60;
    int xCount, countLength;
    if ([self numberOfRecordsForPlot:self.plot1] == 1) {
        x.title = @"Day";
        xCount = 1;
        countLength = 1;
    }else if ([self numberOfRecordsForPlot:self.plot1] < DAY_CUTOFF) {
        x.title = @"Days";
        xCount = [self numberOfRecordsForPlot:self.plot1];
        countLength = 1;
    } else if ([self numberOfRecordsForPlot:self.plot1] < WEEK_CUTOFF) {
        x.title = @"Weeks";
        xCount = [self numberOfRecordsForPlot:self.plot1]/7;
        countLength = 7;
    } else {
        x.title = @"Months";
        xCount = [self numberOfRecordsForPlot:self.plot1]/30;
        countLength = 30;
    }
    
    NSMutableSet *xLabels = [NSMutableSet setWithCapacity:xCount];
    NSMutableSet *xLocations = [NSMutableSet setWithCapacity:xCount];
    for (int i = 1; i <= xCount; i++)
    {
        NSString *text = [NSString stringWithFormat:@"%d", i];
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:text  textStyle:x.labelTextStyle];
        CGFloat location = i * countLength;
        label.tickLocation = CPTDecimalFromCGFloat(location);
        label.offset = x.majorTickLength;
        if (label)
        {
            [xLabels addObject:label];
            [xLocations addObject:[NSNumber numberWithFloat:location]];
        }
    }
    x.axisLabels = xLabels;
    x.majorTickLocations = xLocations;
    
    // Y AXIS
    CPTAxis *y = axisSet.yAxis;
    y.title = @"Score";
    y.titleTextStyle = axisTitleStyle;
    y.titleOffset = 15.0f;
    y.axisLineStyle = axisLineStyle;
    y.labelingPolicy = CPTAxisLabelingPolicyNone;
    y.labelTextStyle = axisTextStyle;
    y.majorTickLineStyle = tickLineStyle;
    y.majorTickLength = 4.0f;
    y.tickDirection = CPTSignNegative;
    CGFloat yCount = 5;
    NSMutableSet *yLabels = [NSMutableSet setWithCapacity:yCount];
    NSMutableSet *yLocations = [NSMutableSet setWithCapacity:yCount];
    for (int i = 1; i <= yCount; i++)
    {
        NSString *text = [NSString stringWithFormat:@"%d",i];
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:text textStyle:y.labelTextStyle];
        CGFloat location = i;
        label.tickLocation = CPTDecimalFromCGFloat(location);
        label.offset = y.majorTickLength;
        if (label)
        {
            [yLabels addObject:label];
            [yLocations addObject:[NSNumber numberWithFloat:location]];
        }
    }
    y.axisLabels = yLabels;
    y.majorTickLocations = yLocations;
}

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return 6;   //TODO
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    return [NSNumber numberWithUnsignedInteger:index];  //TODO
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end