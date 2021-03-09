% Boilerplate
sca;
close all;
clear all;
% Skip some tests in case your initial ScreenTest command failed. Ignore
%otherwise
Screen('Preference', 'SkipSyncTests', 1);
% Default settings for Psychtoolbox
PsychDefaultSetup(2);

%Get the screen numbers. This gives us a number for each of the screens
%attached to your computer. The default should be 0.
screens = Screen('Screens');
% Find the maximum screen number - if there are two screens attached to
%your computer, the one with the higher number will be the external display.
%We will use the external display here.
screenNumber = max(screens);
% Define white, black, and grey using the luminance values for the display.
white = WhiteIndex(screenNumber);
noir = BlackIndex(screenNumber);
grey = white/2;

%Initializes colors
red = [1 0 0];
green = [0 1 0];
blue = [0 0 1];
black = [0 0 0];

%Creates array of colors, then randomizes order
colRect = {red green blue black};
col_rand = colRect(randperm(length(colRect)));

%creates blank arrays for storing response time and accuracy
rT = [];
accuracy = [];

%Displays intro page
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
Screen('TextSize', window, 20);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Hello! Thank you for participating in our experiment. Here’s what you need to know: \n\n\n 1. There will be four rounds. \n 2. In each round, you will see a string of seven two-digit numbers that you will have 15 seconds to memorize. \n 3. After those 15 seconds, you will have a 10 second break where you will be asked to count backwards by 3s from a certain number. \n 4. You will then be prompted to recall the string of numbers, in order, to the best of your ability. \n 5. Once you’ve finished all four rounds, you will see a display of your results. \n Press any key to continue and get started!', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;

%Shows each test screen in a loop
for ii = 1:4
    str_dig = num2str(randi([10 99], 1, 7));
    
    Screen('TextSize', window, 40);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, str_dig ,'center','center', col_rand{ii}); 
    Screen('Flip', window);
    WaitSecs(15);
    
    Screen('TextSize', window, 30);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, 'Please count backwards from 60 by threes until the next screen is displayed.', 'center', 'center', [1 1 1]);
    Screen('Flip', window);
    WaitSecs(10);
    
    Screen('TextSize', window, 40);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, 'Please type as much of the string you remember, in order. \n (Hit Enter when finished!)','center','center',[1,1,1]);
    %tic;
    reply = Ask(window, 'Your Input: ', [1 1 1], grey, 'GetChar', RectLeft, RectBottom);
    %elapsedTime = toc;
    %rT = [rT, elapsedTime];
    %x = strsplit(str_dig);
    %y = strsplit(reply);
    %num_correct = 0;
    %for i = 1:length(y)
        %tf = strcmp(x, y(i))
        %z = find(tf == 1);
        %num_correct = num_correct + length(z);
    %end
    %accuracy = [accuracy, num_correct];
    Screen('Flip', window);
    KbStrokeWait;
    
end

%Results screen with plot of reaction time (rT) and accuracy (accuracy)

Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Thanks for playing!', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;

%[string,terminatorChar] = GetEchoString(window,'type!','center','center',[1,1,1],[],[useKbCheck == 0],[deviceIndex],[untilTime == inf]);
    
%{
Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Please type as much of the string you remember, in order. \n (Hit Enter when finished!)','center','center',[1,1,1]);
reply = Ask(window, 'Your Input: ', [1 1 1], grey, 'GetChar', RectLeft, RectBottom);
Screen('Flip', window);
KbStrokeWait;

Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'this is a check to make sure reply stores the right data' ,'top','center',[1,1,1]);
DrawFormattedText(window, reply ,'center','center',[1,1,1]);

Screen('Flip', window);
KbStrokeWait;

%}

%{

%Green Block
Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, '55, 23, 87, 46, 92, 15, 39','center','center',[0,1,0]); 
Screen('Flip', window);
KbStrokeWait;

%Blue Block
Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, '64, 13, 75, 52, 97, 22, 48','center','center',[0,0,1]); 
Screen('Flip', window);
KbStrokeWait;

%Black Block
Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, '29, 16, 85, 61, 33, 86, 96','center','center',[0,0,0]); 
Screen('Flip', window);
KbStrokeWait;

%for i = 1:4
	%Display one of the color blocks
	%display intermediate screen asking individual to count backwards by 3s from randi > 30
	% display screen asking individual to type in recalled string of numbers in order, recording the time it takes to submit as well as how accurate their input is
        %reply = Ask(window, ‘Please type as much of the string you remember, in order.’, [1 1 1], [background color], ‘GetString’, ‘center’, ‘bottom’)
	%loop back through until all blocks are presented
%end
%Results screen with plot of reaction time and accuracy
%Screen saying thank you for playing!
%}



sca;