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
black = BlackIndex(screenNumber);
grey = white/2;mhh

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
Screen('TextSize', window, 20);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Hello! Thank you for participating in our experiment. Here’s what you need to know: \n\n\n 1. There will be four rounds. \n 2. In each round, you will see a string of seven two-digit numbers that you will have 15 seconds to memorize. \n 3. After those 15 seconds, you will have a 10 second break where you will be asked to count backwards by 3s from a certain number. \n 4. You will then be prompted to recall the string of numbers, in order, to the best of your ability. \n 5. Once you’ve finished all four rounds, you will see a display of your results. \n Press any key to continue and get started!', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;

%Red Block
Screen('TextSize', window, 40);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, '34, 19, 72, 51, 83, 86, 17','center','center',[1,0,0]); 
Screen('Flip', window);
KbStrokeWait;

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

sca;