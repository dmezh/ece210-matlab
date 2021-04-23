classdef Stock
    %properties (Access = private)
    properties
        sym string;
        times = {};
        returns;
    end
    methods
        function obj = Stock(sym, times, prices)
            if nargin == 3
                obj.times = times;
                obj.sym = sym;
                for n=2:max(size(obj.times))
                    obj.returns(n) = (prices(n)-prices(n-1))/prices(n-1);
                end
            end
        end
        function plot(s)
            t = 1:max(size(s.times));
            figure
            plot(t, s.returns(t));
            title(sprintf("Returns on %s", s.sym));
            ylabel('Return');
            xlabel('Date');
            midpt = round(max(t)/2);
            xticks([0 midpt max(t)]);
            xticklabels({s.times(1).print(), s.times(midpt).print(), s.times(max(t)).print()});
            xtickangle(45);
        end
    end
end 