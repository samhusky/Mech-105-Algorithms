function nd = days(mo, da, leap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


nd = 0;
ja = 31;
fe = 28;
ma = 31;
ap = 30;
may = 31;
ju = 30;
jul = 31;
au = 31;
se = 30;
oc = 31;
no = 30;


if mo < 1 || mo > 12
    error('Month must be a number 1-12')
end


if da < 1 || da > 31
    error('The day must be within the limits of the month!')
end


if mo == 2 && da > 29
    error('The day must be within the limits of the month!')
end


if (da == 29 && leap == 0) && mo == 2
    error('February only has 28 days this year!')
end


if da > 30 && (mo == 4 || mo == 6 || mo == 9 || mo == 11)
    error('The day must be within the limits of the month!')
end


if mo > 2 && leap == 1
    nd = nd + 1;
end


if mo == 1
    nd = nd + da;
elseif mo == 2
    nd = nd + ja + da;
elseif mo == 3
    nd = nd + ja + fe + da;
elseif mo == 4
    nd = nd + ja + fe + ma + da;
elseif mo == 5
    nd = nd + ja + fe + ma + ap + da;
elseif mo == 6
    nd = nd + ja + fe + ma + ap + may + da;
elseif mo == 7
    nd = nd + ja + fe + ma + ap + may + ju + da;
elseif mo == 8
    nd = nd + ja + fe + ma + ap + may + ju + jul + da;
elseif mo == 9
    nd = nd + ja + fe + ma + ap + may + ju + jul + au + da;
elseif mo == 10
    nd = nd + ja + fe + ma + ap + may + ju + jul + au + se + da;
elseif mo == 11
    nd = nd + ja + fe + ma + ap + may + ju + jul + au + se + oc + da;
elseif mo == 12
    nd = nd + ja + fe + ma + ap + may + ju + jul + au + se + oc + no + da;
end
end


