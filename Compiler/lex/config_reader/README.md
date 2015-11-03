Config Reader
==

A tool created using lex.
It analyzes a config.in file like the following

```ini
db_type         : mysql
db_name         : testdata
db_table_prefix : test_
db_port         : 1337
```
and displays the following :

```
Line #1: db_type          is a TYPE
Line #1: :                is a COLON
Line #1: mysql            is a IDENTIFIER
Line #1: db_name          is a NAME
Line #1: :                is a COLON
Line #1: testdata         is a IDENTIFIER
Line #1: db_table_prefix  is a TABLE_PREFIX
Line #1: :                is a COLON
Line #1: test_            is a IDENTIFIER
Line #1: db_port          is a PORT
Line #1: :                is a COLON
Line #1: 1337             is a INTEGER
```

Usage:
```
#building
lex myscanner.l
gcc myscanner.c lex.yy.c -o config_reader
#running
./config_reader < config.in
```
