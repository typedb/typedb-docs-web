# GRAKN.AI Documentation

## Dependencies

You need to install the following dependencies to be able to build HTML pages in the documentation repository. **NOTE:** this is *not* necessary for updating the documentation itself.

**Arch Linux**
```
$ yaourt -S ruby-bundler
$ bundle install
```

**macOS**
```
$ brew install ruby
$ gem install bundler
$ bundle install
```

## Building

You can generate the documentation HTML by running the following in the repository top level.

```
$ jekyll build
```

This will build the documentation site by taking everything (excluding certain files and directories) in the top level directorty and generating the static html files in the `_site` directory.


## Cleaning

Clean by running the following command in the repository top level:

```
$ jekyll clean
```

This will remove the `_site` directory.

## Running local server (for development)

You can also build and server the generated HTML files in one command. A WEBrick web
server will be started listening on 127.0.0.1:4005.

```
$ jekyll serve
```

You can now view the documentation by navigating your web browser to `http://127.0.0.1:4005`

## Running host server (to test production deployment) (optional, for debugging host server issues)

The [dev.grakn.ai](https://dev.grakn.ai) website is hosted on a Puma web server as a Heroku app using the following command. This can only be run locally which starts the Puma server listening on 0.0.0.0:9292.

```
$ jekyll build
$ bundle exec puma -t 8:32 -w 3
```

## Deployment

1. Make sure you have access rights to write to Grakn Heroku account.
2. Create a new PR to Grakn Docs [master branch](https://github.com/graknlabs/docs/tree/master).
3. Once the PR has been merged, an automatic deploy to [dev.grakn.ai](https://dev.grakn.ai) takes place.

## Tests

Work in progres ...
<!-- There are a few tests we run against docs:

- `html-proofer`
- `GraqlDocsTest`
- `JavaDocsTest` -->

<!-- `html-proofer` can be executed with `rake test`. It will check all the links in the docs to make sure they actually go
somewhere.

`GraqlDocsTest` and `JavaDocsTest` will test the Graql and Java code blocks respectively. Blocks are identified by
whether they begin with `graql` or `java`. Each page is tested on its own by executing the code blocks sequentially.

By default, the code blocks are executed against the genealogy knowledge graph. If you want to use a different knowledge
base, then add e.g.
```
KB: pokemon
```
to the header of the markdown file. The valid knowledge graphs can be found in `DocTestUtils`.

Java code blocks are actually tested with Groovy (because it is an interpreted language). There are some differences
between Java and Groovy syntax, so we recommend writing code that is valid in both languages.

If a code block should not be executed (e.g. because it is deliberately invalid or does something dangerous), then mark
it `graq-test-ignore` or `java-test-ignore` instead of `graql` or `java`. -->
