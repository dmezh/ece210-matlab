classdef Date
    properties (Constant, Access = private)
        months = ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"];
    end
    properties (Access = private)
        m;
        d;
        y;
    end
    methods
        function obj = Date(s)
            if nargin == 1
                n = str2double(split(s, '/'));
                obj.m = n(1);
                obj.d = n(2);
                obj.y = n(3);
            end
        end
        function lbl = print(d)
            lbl = sprintf("%s %d, %d\n", d.months(d.m), d.d, d.y);
        end
    end
end 
