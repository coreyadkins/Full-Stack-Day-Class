# Practice: Rain
The city of Portland has rain gauges that keep track of rainfall.
[A website](http://or.water.usgs.gov/non-usgs/bes/) has text data tables the history of all the daily measurements at these gauges.

Python gives you a module called `urllib.request` you can use a function `urllib.request.urlopen(url)` which returns a file-like object.
Look at [the docs](https://docs.python.org/3/library/urllib.request.html#module-urllib.request) for that module.

One little difference is the file-like object doesn't return strings, it returns **bytes**.
The following code snippet reads Pride and Prejudice into a list of strings:
```python
import urllib.request

with urllib.request.urlopen('http://www.gutenberg.org/ebooks/1342.txt.utf-8') as pride_and_prejudice_file:
  lines = [byte_line.decode('utf-8') for byte_line in pride_and_prejudice_file]
```
Adapt it to read [the history of the gauge at Sunnyside School](https://raw.githubusercontent.com/selassid/codeguild/master/sunnyside.rain). It looks like:
```
TEXT HEADER...

            Daily  Hourly data -->
   Date     Total    0   1
--------------------------
25-MAR-2016     0    0   0
24-MAR-2016     6    0   1
MORE...
```
The amounts are in hundredths of inches.

Please use the following URL to access a copy of the data: `https://raw.githubusercontent.com/selassid/codeguild/master/sunnyside.rain`.

* Parse and store the _daily total_ data for each day in a dict from date string to daily total.
* From that dict, print out the specific date with the most rain.
* Derive another dict which maps from year to yearly rain total.
* From that dict, print out the year with the most rain.

You will have to slice out the header lines from all the lines you read.
Remember, the header has a totally different format.
You can split a string by whitespace into a list of strings using `str.split()`.
You will also have to slice out the date and daily total from each of those lists of strings.

## Advanced
* Find and print the day of the year with the most rain on average.
E.g. December 30th has 1" of rain on average.
* Allow someone to type in a date in the future and, using the average value for that day of the year, predict the amount of rain.
* URL open the [main listing website](http://or.water.usgs.gov/non-usgs/bes/).
Parse it and allow the user to select statistics from the available rain gauges.
