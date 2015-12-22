# `mondrian-rest` demo project

This is an example project and testbed for [`mondrian-rest`](http://github.com/jazzido/mondrian-rest), a REST endpoint for the OLAP server [Mondrian](http://community.pentaho.com/projects/mondrian/).

It implements a simple [OLAP Cube](https://en.wikipedia.org/wiki/OLAP_cube) with data from the [UN COMTRADE](http://comtrade.un.org/) database, as republished by the [Observatory of Economic Complexity](http://atlas.media.mit.edu/en/resources/data/)

## Requirements

  - [JRuby](http://jruby.org) ([rvm](http://rvm.io) or [rbenv](http://rbenv.org/) are recommended)
  - [Monet DB](http://monetdb.org/)

## Installation

  - Download the [DB dump](http://xxxx) — **ACHTUNG**: it's a ~2GB file.
  - Create a DB in your Monet server: `monetdb create oec; monetdb release oec`
  - Import the dump into your DB: `xzcat oec_dump.sql.kz | mclient -u monetdb -d oec` (this will take a while)
  - If needed, adjust the connection parameters in `config.ru`
  - Run: `rackup`

## Example requests

#### `/cubes`

List available cubes

```javascript
{
  "cubes": [
    "Trade Flow"
  ]
}
```

#### `/cubes/Trade%20Flow`

Get the definition of the *Trade Flow* cube.

```javascript
{
  "measures": [
    {
      "caption": "Exports",
      "name": "Exports",
      "annotations": {}
    },
    {
      "caption": "Imports",
      "name": "Imports",
      "annotations": {}
    }
  ],
  "name": "Trade Flow",
  "dimensions": [
    {
      "hierarchies": [
        {
          "has_all": true,
          "name": "Year",
          "levels": [
            {
              "caption": "(All)",
              "name": "(All)"
            },
            {
              "caption": "Year",
              "name": "Year"
            }
          ],
          "all_member_name": "All Years"
        }
      ],
      "type": "time",
      "name": "Year",
      "annotations": {}
    },
    {
      "hierarchies": [
        {
          "has_all": true,
          "name": "Origin Country",
          "levels": [
            {
              "caption": "(All)",
              "name": "(All)"
            },
            {
              "caption": "Continent",
              "name": "Continent"
            },
            {
              "caption": "Country",
              "name": "Country"
            }
          ],
          "all_member_name": "All Origin Countrys"
        }
      ],
      "type": "standard",
      "name": "Origin Country",
      "annotations": {}
    },
    {
      "hierarchies": [
        {
          "has_all": true,
          "name": "Destination Country",
          "levels": [
            {
              "caption": "(All)",
              "name": "(All)"
            },
            {
              "caption": "Continent",
              "name": "Continent"
            },
            {
              "caption": "Country",
              "name": "Country"
            }
          ],
          "all_member_name": "All Destination Countrys"
        }
      ],
      "type": "standard",
      "name": "Destination Country",
      "annotations": {}
    },
    {
      "hierarchies": [
        {
          "has_all": true,
          "name": "Product",
          "levels": [
            {
              "caption": "(All)",
              "name": "(All)"
            },
            {
              "caption": "HS2",
              "name": "HS2"
            },
            {
              "caption": "HS4",
              "name": "HS4"
            },
            {
              "caption": "HS6",
              "name": "HS6"
            }
          ],
          "all_member_name": "All Products"
        }
      ],
      "type": "standard",
      "name": "Product",
      "annotations": {}
    }
  ]
}
```

## License

The MIT License (MIT)

Copyright (c) 2015 Manuel Aristarán

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
