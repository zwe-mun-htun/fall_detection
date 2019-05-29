%# read video frames
vid = VideoReader('test.avi');
sz = [vid.Height vid.Width];
mov = read(vid, [1 vid.NumberOfFrames]);

%# prepare GUI
p = get(0,'DefaultFigurePosition');
hFig = figure('Menubar','none', 'Resize','off', ...
    'Position',[p(1:2) sz(2) sz(1)]);

%# play movie
movv = struct('cdata',squeeze(num2cell(mov,[1 2 3])), 'colormap',[]);
movie(hFig, movv, 999, vid.FrameRate);