Copyright 2012-2015 Johns Hopkins University HLTCOE. All rights
reserved.  This software is released under the 2-clause BSD license.
See LICENSE in the project root directory.

Concrete
========

Current version: `4.4`

Please consult `NEWS.md` for more information about changes between versions.

Introduction
------------

Concrete is an attempt to map out various NLP data types in a
[Thrift](http://thrift.apache.org/)
schema for use in projects across Johns Hopkins University.  This
standardized schema allows researchers to use a common, underlying
data model for all NLP tasks, and thus, facilitating integration
between projects.


Browsable Schema Documentation
------------------------------

This repository contains HTML documentation for the Concrete schema.
The documentation content is generated from the .thrift schema files.
This HTML documentation contains the exact same content as the schema
text files, but the HTML format makes it easier browse and explore
relations between different Concrete data structures.

To view the HTML documentation, open the file:

    concrete/doc/schema/index.html

in your favorite web browser.


Documentation Webserver
-----------------------

The repository comes with an (optional) simple
[Bottle](https://www.bottlepy.org)-based Python web server for hosting
the documentation.  You can install Bottle using pip:

    pip install bottle

and then start the web server with the command:

    python concrete_docs_server.py [--port PORT_NUMBER]

This command will start a web server on your machine on the default
port number (8097).

Point your browser to ```http://localhost:8097``` to navigate to the
documentation (assuming port 8097).


Regenerating Documentation
--------------------------

If you do not have write access to this repository than you can safely
ignore this section.

The HTML documentation is a modified version of the documentation
generated by the Thrift compiler.  If you have a copy of the Thrift
compiler, you can regenerate the documentation by running the
```regenerate_docs.sh``` script:

    cd doc
    regenerate_docs.sh path_to_thrift_compiler

This script will call ```thrift --gen html``` to generate HTML files
for each .thrift file, and then copy modified versions of each HTML
file to the ```schema/``` directory.  Not all files in the
```schema/``` directory are auto-generated.
