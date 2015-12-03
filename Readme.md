# NPM Dependencies diff tool

This tool takes 2 files containing output of `npm list` or `npm install` or similar results (e.g. Travis CI build logs) and calculates changes to the NPM packages and versions from first file to second.

More specific use case:

 - A build is broken on Travis because of unknown dependency change
 - Copy output of `npm install` from the last successful build to `file1`
 - Copy output of `npm install` from the broken build to `file2`
 - Use this tool to diff the package lists

## Usage

```
coffee npmdiff.coffee <file1> <file2>
```

## Requirements

 - CoffeeScript, Node.js

