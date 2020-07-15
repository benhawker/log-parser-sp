# Log Parser

A Ruby `2.7.1` program that parses a basic log file, sorts the data & present it in the terminal.

===================

### Requirements:

```
a. Receives a log as argument
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...
```

