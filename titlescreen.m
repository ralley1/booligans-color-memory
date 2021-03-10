% Boilerplate
sca;
close all;
clear all;
% Skip some tests in case your initial ScreenTest command failed. Ignore otherwise
Screen('Preference', 'SkipSyncTests', 1);
% Default settings for Psychtoolbox
PsychDefaultSetup(2);
 
%Get the screen numbers.
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
 
%creates blank arrays for storing response time, accuracy, colors
rT = [];
accuracy = [];
colors = [];
 
%Displays intro page
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
Screen('TextSize', window, 20);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Hello! Thank you for participating in our experiment. Hereâ€™s what you need to know: \n\n\n 1. There will be four rounds. \n 2. In each round, you will see a string of seven two-digit numbers that you will have 15 seconds to memorize. \n 3. After those 15 seconds, you will have a 10 second break where \n you will be asked to count backwards by 3s from a certain number. \n 4. You will then be prompted to recall the string of numbers to the best of your ability. \n 5. Once youâ€™ve finished all four rounds, you will see a display of your results. \n \n \n Press Enter to continue and get started!', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;
 
%Loop for set of 4 blocks/trials, one for each color
for ii = 1:4
    str_dig = num2str(randi([10 99], 1, 7));
   
    %memorization screen
    Screen('TextSize', window, 40);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, str_dig ,'center','center', col_rand{ii}); 
    Screen('Flip', window);
    WaitSecs(15);
    
    %intermediary screen
    Screen('TextSize', window, 30);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, 'Please count backwards from 60 by threes until the next screen is displayed.', 'center', 'center', [1 1 1]);
    Screen('Flip', window);
    WaitSecs(10);
    
    %response screen
    Screen('TextSize', window, 40);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, 'Please type as much of the string you remember. \n (Hit Enter when finished!)','center','center',[1,1,1]);
    tic;
    reply = 0;
    reply = Ask(window, 'Your Input: ', [1 1 1], grey, 'GetChar', RectLeft, RectBottom);
    elapsedTime = toc;
    Screen('TextSize', window, 40);
    Screen('TextFont', window, 'Courier');
    DrawFormattedText(window, 'Press Enter to continue','center','center',[1,1,1]);
     
    %collecting response time, accuracy, and colors to then
    %create array of info across all trials
    rT = [rT, elapsedTime];
    x = strsplit(str_dig);
    y = strsplit(reply);
    num_correct = 0;
    for i = 1:length(y)
        tf = strcmp(x, y(i));
        z = find(tf == 1);
        num_correct = num_correct + length(z);
    end
    accuracy = [accuracy, num_correct];
    Screen('Flip', window);
    KbStrokeWait
    
    
    if col_rand{ii} == black
        col_loop = "black";
    elseif col_rand{ii} == red
        col_loop = "red";
    elseif col_rand{ii} == green
        col_loop = "green";
    else
        col_loop = "blue";
    end
    colors = [colors, col_loop];
end
 
%final screen
Screen('TextSize', window, 25);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Thanks for playing! \n Press Enter to exit the screen and see your results', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;
 
 
%Results: plot of reaction time (rT) and accuracy (accuracy)
a = categorical(colors);
a = reordercats(a, colors);
b1 = accuracy;
b2 = rT;
 
results = figure;
 
subplot(1,2,1);
bar(a, b1, 0.75, 'k');
ylim([0,7]);
title('Accuracy');
xlabel('color of text');
ylabel('number of correct responses');
 
subplot(1,2,2);
bar(a, b2, 0.75, 'k');
title('Response Time');
xlabel('color of text');
ylabel('seconds');
 
figureTexture = Screen('MakeTexture', window, results);
Screen('DrawTexture', window, figureTexture, [], [], 0);
Screen('Flip', window);
KbStrokeWait;
 
sca;