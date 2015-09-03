# Founded Rails

A Ruby on Rails CMS application for your [founded x](http://foundedx.com) site.

## Prerequesites

You’ll need a couple of things setup first:

1. [Amazon AWS S3](http://aws.amazon.com) bucket to store all file uploads
2. [Typeform](http://www.typeform.com/) account

## Running the app in development

Ensure you have the correct ruby version (check .ruby-version) and [PostgreSQL](http://postgresapp.com/) installed.

```sh
# Installs required gems, setups up database and creates .env enviornment file from sample
$ bin/setup
```

## MIT License

Copyright (c) 2015 Alternate Labs Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
