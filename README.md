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

===================

### Testing:

Run the specs with `rspec`.

===================

### Usage:

You may need to give executable permissions to the script using:
```
chmod +x bin/parser
```

- Using the default data:
```
$ bin/parser
```

- With a custom path:
```
$ bin/parser source/webserver.log
```

If an incorrect path is given or path does not lead to a file the program will raise an error:
```
$ bin/parser source/
>> The path to the log provided is not valid. Please amend it & try again.
```


When successful the output of the format:
```
$ bin/parser
>> Page views by total views (desc order): 
>> /contact/ 155 visits 
>> /products/3 149 visits 
>> /home 143 visits 
>> products/1 142 visits 
>> /index 141 visits 
>> /about 141 visits 
>> /products/2 129 visits 
    
>> Page views by unique views (desc order): 
>> /home 20 visits 
>> /contact/ 20 visits 
>> /index 20 visits 
>> /about 20 visits 
>> /products/3 20 visits 
>> products/1 20 visits 
>> /products/2 20 visits 
```