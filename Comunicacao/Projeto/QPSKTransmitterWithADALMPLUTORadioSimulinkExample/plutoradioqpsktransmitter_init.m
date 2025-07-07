function SimParams = plutoradioqpsktransmitter_init
%   Copyright 2017 The MathWorks, Inc.

%% General simulation parameters
SimParams.Rsym = 22050/4;             % Symbol rate in Hertz (adjusted to match audio sample rate)
SimParams.ModulationOrder = 4;      % QPSK alphabet size
SimParams.Interpolation = 12;        % Interpolation factor
SimParams.Decimation = 1;           % Decimation factor
SimParams.Tsym = 1/SimParams.Rsym;  % Symbol time in sec
SimParams.Fs   = SimParams.Rsym * SimParams.Interpolation; % Sample rate

%% Frame Specifications
% [BarkerCode*2 | Audio Samples];
SimParams.BarkerCode      = [+1 +1 +1 +1 +1 -1 -1 +1 +1 -1 +1 -1 +1];     % Bipolar Barker Code
SimParams.BarkerLength    = length(SimParams.BarkerCode);
SimParams.HeaderLength    = SimParams.BarkerLength * 2;                   % Duplicate 2 Barker codes to be as a header

% Load audio file and process it (only for calculating payload size)
[audioData, audioFs] = audioread('speech_dft.wav');                        % Load the audio file
if size(audioData, 2) > 1                                                 % Convert to mono if stereo
    audioData = mean(audioData, 2);
end
audioData = audioData / max(abs(audioData));                              % Normalize audio to [-1, 1]
audioData = round(audioData * (2^15 - 1));                                % Quantize to 16 bits
audioData = int16(audioData);                                             % Convert to int16 format
SimParams.AudioBits = dec2bin(typecast(audioData, 'uint16'), 16);         % Convert audio samples to binary bits
SimParams.AudioBits = SimParams.AudioBits(:) - '0';                       % Convert to numeric vector of bits

SimParams.MessageLength   = length(audioData);                            % Number of audio samples
SimParams.PayloadLength   = SimParams.MessageLength * 16;                 % Total number of bits in the payload
SimParams.FrameSize       = (SimParams.HeaderLength + SimParams.PayloadLength) ...
    / log2(SimParams.ModulationOrder);                                    % Frame size in symbols
SimParams.FrameTime       = SimParams.Tsym * SimParams.FrameSize;         % Frame duration in seconds

%% Tx parameters
SimParams.RolloffFactor     = 0.5;                                        % Rolloff Factor of Raised Cosine Filter
SimParams.ScramblerBase     = 2;
SimParams.ScramblerPolynomial           = [1 1 1 0 1];
SimParams.ScramblerInitialConditions    = [0 0 0 0];
SimParams.RaisedCosineFilterSpan = 10;                                    % Filter span of Raised Cosine Tx Rx filters (in symbols)

%% Pluto transmitter parameters
SimParams.PlutoCenterFrequency      = 915e6;                              % Center frequency in Hz
SimParams.PlutoGain                 = -30;                                % Transmitter gain in dB
SimParams.PlutoFrontEndSampleRate   = SimParams.Fs;                       % Front-end sample rate
SimParams.PlutoFrameLength          = SimParams.Interpolation * SimParams.FrameSize; % Frame length in samples

% Simulation Parameters
SimParams.FrameTime = SimParams.PlutoFrameLength / SimParams.PlutoFrontEndSampleRate; % Frame time in seconds
SimParams.StopTime  = 1000;                                               % Simulation stop time in seconds