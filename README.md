wintersmith-makerelative
==================

[Wintersmith makeRelative() helper](https://github.com/ericanderson/wintersmith-makerelative)

Intended use is from something like a jade template:

```jade
link(rel='stylesheet', href=makeRelative(page.url, '/syntax.css'))
```

That way the template can be used deep in hierarchies and will render the following for `/foo/bar/baz/`:

```html
<link rel="stylesheet" href="../../../syntax.css">
```

## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-plugin
```

and add `wintersmith-makerelative` to your config.json

```json
{
  "plugins": [
    "wintersmith-makerelative"
  ]
}
```

## Running tests

```
npm install
npm test
```