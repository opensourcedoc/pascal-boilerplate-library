# Pascal Boilerplate for Library

A Free Pascal boilerplate project to build a Pascal based dynamic library.

## System Requirements

* Free Pascal

## Usage

Clone the project:

```shell
$ git clone https://github.com/opensourcedoc/pascal-boilerplate-library.git mylib
```

Move your working directory to the root of *mylib*:

```shell
$ cd mylib
```

Modify *Logic.pas* as needed. You may add or remove Pascal source files (*.pas*) as needed.

Compile the application:

```shell
$ ./build
```

Modify *TestMain.lpr* according to the changes in *Logic.pas*. You may add or remove Pascal source files (*.pas*) as needed.

Run the compiled test program:

```shell
$ ./test-run
```

Set your own remote repository:

```shell
$ git remote set-url origin https://example.com/user/project.git
```

Push your modification to your own repo:

```shell
$ git push
```

## Copyright

Copyright (c) 2020 ByteBard. Licensed under MIT.