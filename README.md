# [`mondrian-rest`](https://github.com/jazzido/mondrian-rest) demo project

This is an example project and testbed for [`mondrian-rest`](http://github.com/jazzido/mondrian-rest), a REST endpoint for the OLAP server [Mondrian](http://community.pentaho.com/projects/mondrian/).

It implements a simple [OLAP Cube](https://en.wikipedia.org/wiki/OLAP_cube) with data from the [UN COMTRADE](http://comtrade.un.org/) database, as republished by the [Observatory of Economic Complexity](http://atlas.media.mit.edu/en/resources/data/)

## Requirements

  - [JRuby](http://jruby.org) ([rvm](http://rvm.io) or [rbenv](http://rbenv.org/) are recommended)
  - [Monet DB](http://monetdb.org/)

## Installation

  - Download the [DB dump](http://mondrian-rest.jazzido.com/oec_dump.sql.xz) — **ACHTUNG**: it's a ~1.3 GB file.
  - Create a DB in your Monet server: `monetdb create oec; monetdb release oec`
  - Import the dump into your DB: `xzcat oec_dump.sql.xz | mclient -u monetdb -d oec` (this will take a while)
  - If needed, adjust the connection parameters in `config.ru`
  - Run: `rackup`
  
## See also

[`mondrian-rest-foodmart`](https://github.com/jazzido/mondrian-rest-foodmart): a similar demo project (easier to setup)

## Example requests

### Aggregations

#### World's export value, by year (JSON)

[`/cubes/Trade%20Flow/aggregate?drilldown[]=Year&measures[]=Exports`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow/aggregate?drilldown[]=Year&measures[]=Exports)

#### Argentina's exports and imports value, by year (CSV)

[`/cubes/Trade%20Flow/aggregate.csv?drilldown[]=Year&measures[]=Exports&measures[]=Imports&cut[]=Origin%20Country.South%20America.Argentina`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow/aggregate.csv?drilldown[]=Year&measures[]=Exports&measures[]=Imports&cut[]=Origin%20Country.South%20America.Argentina)

#### Argentina's exports value to African countries, by year (Excel)

[`/cubes/Trade%20Flow/aggregate.xls?drilldown[]=Year&drilldown[]=Destination%20Country&measures[]=Exports&cut[]=Origin%20Country.South%20America.Argentina&cut[]=Destination%20Country.Africa`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow/aggregate.xls?drilldown[]=Year&drilldown[]=Destination%20Country&measures[]=Exports&cut[]=Origin%20Country.South%20America.Argentina&cut[]=Destination%20Country.Africa)

#### Total South America's exports of Live Animals to Germany, by year

[`/cubes/Trade Flow/aggregate.csv?drilldown[]=Year&measures[]=Exports&cut[]=Origin Country.South America&cut[]=Destination%20Country.Europe.Germany&cut[]=Product.Live%20Animals`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow/aggregate.csv?drilldown[]=Year&measures[]=Exports&cut[]=Origin%20Country.South%20America&cut[]=Destination%20Country.Europe.Germany&cut[]=Product.Live%020Animals)

### Metadata

#### Get available cubes

[`/cubes`](http://mondrian-rest.jazzido.com/cubes)

#### Get the definition of the *Trade Flow* cube

[`/cubes/Trade%20Flow`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow)

#### Get the definition and members of the *Origin Country* dimension

[`/cubes/Trade%20Flow/dimensions/Origin%20Country`](http://mondrian-rest.jazzido.com//cubes/Trade%20Flow/dimensions/Origin%20Country)

#### Get a member of the *Country* level from the *Origin Country* dimension

[`/cubes/Trade%20Flow/dimensions/Origin%20Country/levels/Country/members/arg`](http://mondrian-rest.jazzido.com/cubes/Trade%20Flow/dimensions/Origin%20Country/levels/Country/members/arg)

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
