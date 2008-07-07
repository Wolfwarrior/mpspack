% PLOT - plots a directed segment on current figure, using its quadrature pts
%
%  h = PLOT(seg) plots a segment, quadrature points, etc.
%
%  h = PLOT(seg, pm) plots segment if pm=1, or its reversal if pm=-1
%
%  h = PLOT(s, pm, opts) allows various options in opts, namely
%   opts.arrow: if true, show direction via an arrow (default true)
%
% See also: pointset/PLOT, domain/SHOWSEGMENTS

function h = plot(s, pm, o)
if nargin<2, pm = 1; end                       % default sense is positive
if nargin<3, o = []; end
if ~isfield(o, 'arrow'), o.arrow = 1; end      % default is show arrow

g = gcf;
figure(g); hold on;
h = plot(real(s.x), imag(s.x), '.-');

l = 0.1;                                       % show normals... length
h = [h; plot([s.x(:).'; (s.x(:)+l*pm*s.nx(:)).'], 'k-')];   % uses sign from pm

if o.arrow
  t = 0.5 + pm * 0.04 * [-1+1i, 1, -1-1i];     % t values of arrow, with direc
  h = [h; plot(s.Z(t), '-')];
end
