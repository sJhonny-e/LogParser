# LogParser
A quick side project of in-memory "log parsing" using ruby

## Usage
`./parser.rb webserver.log <log file name>`  
(Don't forget to `bundle` first).  
**Note:** Script was tested on my windows machine, if you're using a different OS YMMV

## Output

1. list of webpages with most page views ordered from most pages views to less page
views  
e.g.:  
```
/home 90 visits
/index 80 visits
etc...
```

2. list of webpages with most unique page views also ordered  
e.g.:  
```
/about/2 8 unique views
/index 5 unique views
etc...
```

## Running Tests
`rspec`

## Design considerations

1. Using the 'visitor' design pattern to decouple the data from the stats running on it, and to allow to easily add new stats without changing any of the other code.  
Alternative solutions considered were:
   1. Using a generic repository with a 'query object' / 'specification' pattern. However, I felt that this would leak out the implementation of the repository (as an in-memory array, for example) into the specification objects, which I didn't want to do.
   2. Using a shell script - `grep`ing a file with a known format should be fairly straightforward. But then I wouldn't have a project :)
2. Created a simple store class to abstract away any storage mechanism (currently, just in-memory, but it's easy to change to file / DB storage without changing anything else)

### Possible improvements

1. Error handling - make the parsing of the file more robust; ability to handle bad line formats
2. Move orchestration, currently in the main script file, to a more testable location
3. Don't read whole file at once; use something like `File.read_line` to make it more scalable for larger file sizes
