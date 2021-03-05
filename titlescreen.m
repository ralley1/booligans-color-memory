% Boilerplate
% Clear all screens and figures as well as all variables in the workspace
sca;
close all;
clear all;
% Skip some tests in case your initial ScreenTest command failed. Ignore
%otherwise
Screen('Preference', 'SkipSyncTests', 1);
% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers. This gives us a number for each of the screens
%attached to your computer. The default should be 0.
screens = Screen('Screens');
% Find the maximum screen number - if there are two screens attached to
%your computer, the one with the higher number will be the external display.
%We will use the external display here.
screenNumber = max(screens);
% Define white, black, and grey using the luminance values for the display.
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white/2;

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);h
Screen('TextSize', window, 20);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Hello! Thank you for participating in our experiment. Here’s what you need to know: \n 1. There will be four rounds. \n 2. In each round, you will see a string of seven two-digit numbers that you will have 15 seconds to memorize. \n 3. After those 15 seconds, you will have a 10 second break where you will be asked to count backwards by 3s from a certain number. \n 4. You will then be prompted to recall the string of numbers, in order, to the best of your ability. \n 5. Once you’ve finished all four rounds, you will see a display of your results. \n Press any key to continue and get started!', 'center', 'center', [1 1 1]);
Screen('Flip', window);
KbStrokeWait;
sca;