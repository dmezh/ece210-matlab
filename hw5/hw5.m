% ECE-210 HW5
% Daniel Mezhiborsky

d1 = Date("02/22/2001");
d1.print();

indata = importdata('StocksAll.csv');
data.dates = indata.textdata(2:end, 1);
data.stocks = indata.textdata(1, 2:end);
%%
for n=size(data.dates):-1:1
    dates(n) = Date(data.dates(n));
    %dates(n).print();
end
%%
for n=max(size(data.stocks)):-1:1
    stock = Stock(data.stocks(n), dates, indata.data(:, n));
    stock.plot();
end
    

%str2double(split("02/22/2001", '/'))