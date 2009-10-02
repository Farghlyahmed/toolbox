function [h,hc] = plotEllipse( cRow, cCol, ra, rb, phi, color, nPnts )
% Adds an ellipse to the current plot.
%
% USAGE
%  [h,hc] = plotEllipse( cRow, cCol, ra, rb, phi, [color], [nPnts] )
%
% INPUTS
%  cRow    - the row location of the center of the ellipse
%  cCol    - the column location of the center of the ellipse
%  ra      - semi-major axis radius length (in pixels) of the ellipse
%  rb      - semi-minor axis radius length (in pixels) of the ellipse
%  phi     - rotation angle (radians) of semimajor axis from x-axis
%  color   - ['b'] color for ellipse
%  nPnts   - [100] number of points used to draw each ellipse
%
% OUTPUT
%  h       - handle to ellipse
%  hc      - handle to ellipse center
%
% EXAMPLE
%  plotEllipse( 3, 2, 1, 5, pi/6, 'g');
%
% See also PLOTGAUSSELLIPSES
%
% Piotr's Image&Video Toolbox      Version NEW
% Copyright 2009 Piotr Dollar.  [pdollar-at-caltech.edu]
% Please email me if you find bugs, or have suggestions or questions!
% Licensed under the Lesser GPL [see external/lgpl.txt]

error(nargchk( 5, 7, nargin ));
if(nargin<6 || isempty(color)); color = 'b'; end
if(nargin<7 || isempty(nPnts)); nPnts = 100; end

% plot ellipse (rotate a scaled circle):
ts = linspace(-pi,pi,nPnts+1);  cts = cos(ts); sts = sin(ts);
h = plot( ra*cts*cos(-phi) + rb*sts*sin(-phi) + cCol, ...
  rb*sts*cos(-phi) - ra*cts*sin(-phi) + cRow, 'Color', color );

% plot center point
washeld = ishold; if(~washeld); hold('on'); end
hc = plot( cCol, cRow, 'k+' ); set( hc, 'Color', color );
if(~washeld); hold('off'); end
