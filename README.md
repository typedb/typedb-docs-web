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

## Build

```
$ jekyll build
```

Running this command parses all markdown files in `/docs` to HTML and places them under `_site/docs` directory. Any other files or folders are also moved into `_site/` unless explicitly excluded in `_config.yml`.

## Clean

```
$ jekyll clean
```

Running this command removes `_site`, `.jekyll-metadata` and `.sass-cache`.

## Build and start the server

```
$ jekyll serve --trace
```

This starts a WEBrick web server on 127.0.0.1:4005. Same command with options `-H 0.0.0.0 -P $PORT` starts the server in production.

You can now view the documentation by navigating your web browser to `http://127.0.0.1:4005`

## Deploy

Commit changes made in the `docs` submodule and push to the remote repository.
Heroku watches for any push on this repository and deploys automatically.

<!-- ## Tests

Work in progres ... -->
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
it `graq-test-ignore` or `java-test-ignore` instead of `graql` or `java`.  -->
